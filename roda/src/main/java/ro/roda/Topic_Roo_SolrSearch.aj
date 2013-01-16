// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.persistence.PostPersist;
import javax.persistence.PostUpdate;
import javax.persistence.PreRemove;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrInputDocument;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import ro.roda.Topic;

privileged aspect Topic_Roo_SolrSearch {
    
    @Autowired
    transient SolrServer Topic.solrServer;
    
    public static QueryResponse Topic.search(String queryString) {
        String searchString = "Topic_solrsummary_t:" + queryString;
        return search(new SolrQuery(searchString.toLowerCase()));
    }
    
    public static QueryResponse Topic.search(SolrQuery query) {
        try {
            return solrServer().query(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new QueryResponse();
    }
    
    public static void Topic.indexTopic(Topic topic) {
        List<Topic> topics = new ArrayList<Topic>();
        topics.add(topic);
        indexTopics(topics);
    }
    
    @Async
    public static void Topic.indexTopics(Collection<Topic> topics) {
        List<SolrInputDocument> documents = new ArrayList<SolrInputDocument>();
        for (Topic topic : topics) {
            SolrInputDocument sid = new SolrInputDocument();
            sid.addField("id", "topic_" + topic.getId());
            sid.addField("topic.name_s", topic.getName());
            sid.addField("topic.description_s", topic.getDescription());
            sid.addField("topic.lefttopic_i", topic.getLeftTopic());
            sid.addField("topic.righttopic_i", topic.getRightTopic());
            // Add summary field to allow searching documents for objects of this type
            sid.addField("topic_solrsummary_t", new StringBuilder().append(topic.getName()).append(" ").append(topic.getDescription()).append(" ").append(topic.getLeftTopic()).append(" ").append(topic.getRightTopic()));
            documents.add(sid);
        }
        try {
            SolrServer solrServer = solrServer();
            solrServer.add(documents);
            solrServer.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @Async
    public static void Topic.deleteIndex(Topic topic) {
        SolrServer solrServer = solrServer();
        try {
            solrServer.deleteById("topic_" + topic.getId());
            solrServer.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @PostUpdate
    @PostPersist
    private void Topic.postPersistOrUpdate() {
        indexTopic(this);
    }
    
    @PreRemove
    private void Topic.preRemove() {
        deleteIndex(this);
    }
    
    public static SolrServer Topic.solrServer() {
        SolrServer _solrServer = new Topic().solrServer;
        if (_solrServer == null) throw new IllegalStateException("Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return _solrServer;
    }
    
}

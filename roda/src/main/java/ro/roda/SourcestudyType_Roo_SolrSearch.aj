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
import ro.roda.SourcestudyType;

privileged aspect SourcestudyType_Roo_SolrSearch {
    
    @Autowired
    transient SolrServer SourcestudyType.solrServer;
    
    public static QueryResponse SourcestudyType.search(String queryString) {
        String searchString = "SourcestudyType_solrsummary_t:" + queryString;
        return search(new SolrQuery(searchString.toLowerCase()));
    }
    
    public static QueryResponse SourcestudyType.search(SolrQuery query) {
        try {
            return solrServer().query(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new QueryResponse();
    }
    
    public static void SourcestudyType.indexSourcestudyType(SourcestudyType sourcestudyType) {
        List<SourcestudyType> sourcestudytypes = new ArrayList<SourcestudyType>();
        sourcestudytypes.add(sourcestudyType);
        indexSourcestudyTypes(sourcestudytypes);
    }
    
    @Async
    public static void SourcestudyType.indexSourcestudyTypes(Collection<SourcestudyType> sourcestudytypes) {
        List<SolrInputDocument> documents = new ArrayList<SolrInputDocument>();
        for (SourcestudyType sourcestudyType : sourcestudytypes) {
            SolrInputDocument sid = new SolrInputDocument();
            sid.addField("id", "sourcestudytype_" + sourcestudyType.getId());
            sid.addField("sourcestudyType.name_s", sourcestudyType.getName());
            sid.addField("sourcestudyType.description_s", sourcestudyType.getDescription());
            // Add summary field to allow searching documents for objects of this type
            sid.addField("sourcestudytype_solrsummary_t", new StringBuilder().append(sourcestudyType.getName()).append(" ").append(sourcestudyType.getDescription()));
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
    public static void SourcestudyType.deleteIndex(SourcestudyType sourcestudyType) {
        SolrServer solrServer = solrServer();
        try {
            solrServer.deleteById("sourcestudytype_" + sourcestudyType.getId());
            solrServer.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @PostUpdate
    @PostPersist
    private void SourcestudyType.postPersistOrUpdate() {
        indexSourcestudyType(this);
    }
    
    @PreRemove
    private void SourcestudyType.preRemove() {
        deleteIndex(this);
    }
    
    public static SolrServer SourcestudyType.solrServer() {
        SolrServer _solrServer = new SourcestudyType().solrServer;
        if (_solrServer == null) throw new IllegalStateException("Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return _solrServer;
    }
    
}

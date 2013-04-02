// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

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
import ro.roda.domain.GroupAuthorities;

privileged aspect GroupAuthorities_Roo_SolrSearch {
    
    @Autowired
    transient SolrServer GroupAuthorities.solrServer;
    
    public static QueryResponse GroupAuthorities.search(String queryString) {
        String searchString = "GroupAuthorities_solrsummary_t:" + queryString;
        return search(new SolrQuery(searchString.toLowerCase()));
    }
    
    public static QueryResponse GroupAuthorities.search(SolrQuery query) {
        try {
            return solrServer().query(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new QueryResponse();
    }
    
    public static void GroupAuthorities.indexGroupAuthorities(GroupAuthorities groupAuthorities) {
        List<GroupAuthorities> groupauthoritieses = new ArrayList<GroupAuthorities>();
        groupauthoritieses.add(groupAuthorities);
        indexGroupAuthoritieses(groupauthoritieses);
    }
    
    @Async
    public static void GroupAuthorities.indexGroupAuthoritieses(Collection<GroupAuthorities> groupauthoritieses) {
        List<SolrInputDocument> documents = new ArrayList<SolrInputDocument>();
        for (GroupAuthorities groupAuthorities : groupauthoritieses) {
            SolrInputDocument sid = new SolrInputDocument();
            sid.addField("id", "groupauthorities_" + groupAuthorities.getId());
            sid.addField("groupAuthorities.groupid_t", groupAuthorities.getGroupId());
            // Add summary field to allow searching documents for objects of this type
            sid.addField("groupauthorities_solrsummary_t", new StringBuilder().append(groupAuthorities.getGroupId()));
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
    public static void GroupAuthorities.deleteIndex(GroupAuthorities groupAuthorities) {
        SolrServer solrServer = solrServer();
        try {
            solrServer.deleteById("groupauthorities_" + groupAuthorities.getId());
            solrServer.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @PostUpdate
    @PostPersist
    private void GroupAuthorities.postPersistOrUpdate() {
        indexGroupAuthorities(this);
    }
    
    @PreRemove
    private void GroupAuthorities.preRemove() {
        deleteIndex(this);
    }
    
    public static SolrServer GroupAuthorities.solrServer() {
        SolrServer _solrServer = new GroupAuthorities().solrServer;
        if (_solrServer == null) throw new IllegalStateException("Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return _solrServer;
    }
    
}
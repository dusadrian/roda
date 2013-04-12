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
import ro.roda.domain.SourceContacts;

privileged aspect SourceContacts_Roo_SolrSearch {
    
    @Autowired
    transient SolrServer SourceContacts.solrServer;
    
    public static QueryResponse SourceContacts.search(String queryString) {
        String searchString = "SourceContacts_solrsummary_t:" + queryString;
        return search(new SolrQuery(searchString.toLowerCase()));
    }
    
    public static QueryResponse SourceContacts.search(SolrQuery query) {
        try {
            return solrServer().query(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new QueryResponse();
    }
    
    public static void SourceContacts.indexSourceContacts(SourceContacts sourceContacts) {
        List<SourceContacts> sourcecontactses = new ArrayList<SourceContacts>();
        sourcecontactses.add(sourceContacts);
        indexSourceContactses(sourcecontactses);
    }
    
    @Async
    public static void SourceContacts.indexSourceContactses(Collection<SourceContacts> sourcecontactses) {
        List<SolrInputDocument> documents = new ArrayList<SolrInputDocument>();
        for (SourceContacts sourceContacts : sourcecontactses) {
            SolrInputDocument sid = new SolrInputDocument();
            sid.addField("id", "sourcecontacts_" + sourceContacts.getId());
            sid.addField("sourceContacts.id_i", sourceContacts.getId());
            // Add summary field to allow searching documents for objects of this type
            sid.addField("sourcecontacts_solrsummary_t", new StringBuilder().append(sourceContacts.getId()));
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
    public static void SourceContacts.deleteIndex(SourceContacts sourceContacts) {
        SolrServer solrServer = solrServer();
        try {
            solrServer.deleteById("sourcecontacts_" + sourceContacts.getId());
            solrServer.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @PostUpdate
    @PostPersist
    private void SourceContacts.postPersistOrUpdate() {
        indexSourceContacts(this);
    }
    
    @PreRemove
    private void SourceContacts.preRemove() {
        deleteIndex(this);
    }
    
    public static SolrServer SourceContacts.solrServer() {
        SolrServer _solrServer = new SourceContacts().solrServer;
        if (_solrServer == null) throw new IllegalStateException("Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return _solrServer;
    }
    
}

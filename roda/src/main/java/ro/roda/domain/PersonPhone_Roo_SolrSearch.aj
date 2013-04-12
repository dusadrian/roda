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
import ro.roda.domain.PersonPhone;

privileged aspect PersonPhone_Roo_SolrSearch {
    
    @Autowired
    transient SolrServer PersonPhone.solrServer;
    
    public static QueryResponse PersonPhone.search(String queryString) {
        String searchString = "PersonPhone_solrsummary_t:" + queryString;
        return search(new SolrQuery(searchString.toLowerCase()));
    }
    
    public static QueryResponse PersonPhone.search(SolrQuery query) {
        try {
            return solrServer().query(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new QueryResponse();
    }
    
    public static void PersonPhone.indexPersonPhone(PersonPhone personPhone) {
        List<PersonPhone> personphones = new ArrayList<PersonPhone>();
        personphones.add(personPhone);
        indexPersonPhones(personphones);
    }
    
    @Async
    public static void PersonPhone.indexPersonPhones(Collection<PersonPhone> personphones) {
        List<SolrInputDocument> documents = new ArrayList<SolrInputDocument>();
        for (PersonPhone personPhone : personphones) {
            SolrInputDocument sid = new SolrInputDocument();
            sid.addField("id", "personphone_" + personPhone.getId());
            sid.addField("personPhone.id_t", personPhone.getId());
            // Add summary field to allow searching documents for objects of this type
            sid.addField("personphone_solrsummary_t", new StringBuilder().append(personPhone.getId()));
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
    public static void PersonPhone.deleteIndex(PersonPhone personPhone) {
        SolrServer solrServer = solrServer();
        try {
            solrServer.deleteById("personphone_" + personPhone.getId());
            solrServer.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @PostUpdate
    @PostPersist
    private void PersonPhone.postPersistOrUpdate() {
        indexPersonPhone(this);
    }
    
    @PreRemove
    private void PersonPhone.preRemove() {
        deleteIndex(this);
    }
    
    public static SolrServer PersonPhone.solrServer() {
        SolrServer _solrServer = new PersonPhone().solrServer;
        if (_solrServer == null) throw new IllegalStateException("Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return _solrServer;
    }
    
}

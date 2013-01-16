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
import ro.roda.PersonAddress;

privileged aspect PersonAddress_Roo_SolrSearch {
    
    @Autowired
    transient SolrServer PersonAddress.solrServer;
    
    public static QueryResponse PersonAddress.search(String queryString) {
        String searchString = "PersonAddress_solrsummary_t:" + queryString;
        return search(new SolrQuery(searchString.toLowerCase()));
    }
    
    public static QueryResponse PersonAddress.search(SolrQuery query) {
        try {
            return solrServer().query(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new QueryResponse();
    }
    
    public static void PersonAddress.indexPersonAddress(PersonAddress personAddress) {
        List<PersonAddress> personaddresses = new ArrayList<PersonAddress>();
        personaddresses.add(personAddress);
        indexPersonAddresses(personaddresses);
    }
    
    @Async
    public static void PersonAddress.indexPersonAddresses(Collection<PersonAddress> personaddresses) {
        List<SolrInputDocument> documents = new ArrayList<SolrInputDocument>();
        for (PersonAddress personAddress : personaddresses) {
            SolrInputDocument sid = new SolrInputDocument();
            sid.addField("id", "personaddress_" + personAddress.getId());
            sid.addField("personAddress.addressid_t", personAddress.getAddressId());
            sid.addField("personAddress.personid_t", personAddress.getPersonId());
            sid.addField("personAddress.dateend_dt", personAddress.getDateend());
            sid.addField("personAddress.id_t", personAddress.getId());
            // Add summary field to allow searching documents for objects of this type
            sid.addField("personaddress_solrsummary_t", new StringBuilder().append(personAddress.getAddressId()).append(" ").append(personAddress.getPersonId()).append(" ").append(personAddress.getDateend()).append(" ").append(personAddress.getId()));
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
    public static void PersonAddress.deleteIndex(PersonAddress personAddress) {
        SolrServer solrServer = solrServer();
        try {
            solrServer.deleteById("personaddress_" + personAddress.getId());
            solrServer.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @PostUpdate
    @PostPersist
    private void PersonAddress.postPersistOrUpdate() {
        indexPersonAddress(this);
    }
    
    @PreRemove
    private void PersonAddress.preRemove() {
        deleteIndex(this);
    }
    
    public static SolrServer PersonAddress.solrServer() {
        SolrServer _solrServer = new PersonAddress().solrServer;
        if (_solrServer == null) throw new IllegalStateException("Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return _solrServer;
    }
    
}

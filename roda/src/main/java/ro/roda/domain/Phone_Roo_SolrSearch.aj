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
import ro.roda.domain.Phone;

privileged aspect Phone_Roo_SolrSearch {
    
    @Autowired
    transient SolrServer Phone.solrServer;
    
    public static QueryResponse Phone.search(String queryString) {
        String searchString = "Phone_solrsummary_t:" + queryString;
        return search(new SolrQuery(searchString.toLowerCase()));
    }
    
    public static QueryResponse Phone.search(SolrQuery query) {
        try {
            return solrServer().query(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new QueryResponse();
    }
    
    public static void Phone.indexPhone(Phone phone) {
        List<Phone> phones = new ArrayList<Phone>();
        phones.add(phone);
        indexPhones(phones);
    }
    
    @Async
    public static void Phone.indexPhones(Collection<Phone> phones) {
        List<SolrInputDocument> documents = new ArrayList<SolrInputDocument>();
        for (Phone phone : phones) {
            SolrInputDocument sid = new SolrInputDocument();
            sid.addField("id", "phone_" + phone.getId());
            sid.addField("phone.phone_s", phone.getPhone());
            sid.addField("phone.phonetype_s", phone.getPhoneType());
            // Add summary field to allow searching documents for objects of this type
            sid.addField("phone_solrsummary_t", new StringBuilder().append(phone.getPhone()).append(" ").append(phone.getPhoneType()));
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
    public static void Phone.deleteIndex(Phone phone) {
        SolrServer solrServer = solrServer();
        try {
            solrServer.deleteById("phone_" + phone.getId());
            solrServer.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @PostUpdate
    @PostPersist
    private void Phone.postPersistOrUpdate() {
        indexPhone(this);
    }
    
    @PreRemove
    private void Phone.preRemove() {
        deleteIndex(this);
    }
    
    public static SolrServer Phone.solrServer() {
        SolrServer _solrServer = new Phone().solrServer;
        if (_solrServer == null) throw new IllegalStateException("Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return _solrServer;
    }
    
}

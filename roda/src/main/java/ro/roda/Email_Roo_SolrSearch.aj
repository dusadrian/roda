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
import ro.roda.Email;

privileged aspect Email_Roo_SolrSearch {
    
    @Autowired
    transient SolrServer Email.solrServer;
    
    public static QueryResponse Email.search(String queryString) {
        String searchString = "Email_solrsummary_t:" + queryString;
        return search(new SolrQuery(searchString.toLowerCase()));
    }
    
    public static QueryResponse Email.search(SolrQuery query) {
        try {
            return solrServer().query(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new QueryResponse();
    }
    
    public static void Email.indexEmail(Email email) {
        List<Email> emails = new ArrayList<Email>();
        emails.add(email);
        indexEmails(emails);
    }
    
    @Async
    public static void Email.indexEmails(Collection<Email> emails) {
        List<SolrInputDocument> documents = new ArrayList<SolrInputDocument>();
        for (Email email : emails) {
            SolrInputDocument sid = new SolrInputDocument();
            sid.addField("id", "email_" + email.getId());
            sid.addField("email.orgid_t", email.getOrgId());
            sid.addField("email.personid_t", email.getPersonId());
            sid.addField("email.email_s", email.getEmail());
            // Add summary field to allow searching documents for objects of this type
            sid.addField("email_solrsummary_t", new StringBuilder().append(email.getOrgId()).append(" ").append(email.getPersonId()).append(" ").append(email.getEmail()));
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
    public static void Email.deleteIndex(Email email) {
        SolrServer solrServer = solrServer();
        try {
            solrServer.deleteById("email_" + email.getId());
            solrServer.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @PostUpdate
    @PostPersist
    private void Email.postPersistOrUpdate() {
        indexEmail(this);
    }
    
    @PreRemove
    private void Email.preRemove() {
        deleteIndex(this);
    }
    
    public static SolrServer Email.solrServer() {
        SolrServer _solrServer = new Email().solrServer;
        if (_solrServer == null) throw new IllegalStateException("Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return _solrServer;
    }
    
}
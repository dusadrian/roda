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
import ro.roda.domain.PersonLinks;

privileged aspect PersonLinks_Roo_SolrSearch {
    
    @Autowired
    transient SolrServer PersonLinks.solrServer;
    
    public static QueryResponse PersonLinks.search(String queryString) {
        String searchString = "PersonLinks_solrsummary_t:" + queryString;
        return search(new SolrQuery(searchString.toLowerCase()));
    }
    
    public static QueryResponse PersonLinks.search(SolrQuery query) {
        try {
            return solrServer().query(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new QueryResponse();
    }
    
    public static void PersonLinks.indexPersonLinks(PersonLinks personLinks) {
        List<PersonLinks> personlinkses = new ArrayList<PersonLinks>();
        personlinkses.add(personLinks);
        indexPersonLinkses(personlinkses);
    }
    
    @Async
    public static void PersonLinks.indexPersonLinkses(Collection<PersonLinks> personlinkses) {
        List<SolrInputDocument> documents = new ArrayList<SolrInputDocument>();
        for (PersonLinks personLinks : personlinkses) {
            SolrInputDocument sid = new SolrInputDocument();
            sid.addField("id", "personlinks_" + personLinks.getId());
            sid.addField("personLinks.personid_t", personLinks.getPersonId());
            sid.addField("personLinks.userid_t", personLinks.getUserId());
            sid.addField("personLinks.statusby_t", personLinks.getStatusBy());
            sid.addField("personLinks.simscore_t", personLinks.getSimscore());
            sid.addField("personLinks.namescore_t", personLinks.getNamescore());
            sid.addField("personLinks.emailscore_t", personLinks.getEmailscore());
            sid.addField("personLinks.status_i", personLinks.getStatus());
            sid.addField("personLinks.statustime_dt", personLinks.getStatusTime().getTime());
            sid.addField("personLinks.id_i", personLinks.getId());
            // Add summary field to allow searching documents for objects of this type
            sid.addField("personlinks_solrsummary_t", new StringBuilder().append(personLinks.getPersonId()).append(" ").append(personLinks.getUserId()).append(" ").append(personLinks.getStatusBy()).append(" ").append(personLinks.getSimscore()).append(" ").append(personLinks.getNamescore()).append(" ").append(personLinks.getEmailscore()).append(" ").append(personLinks.getStatus()).append(" ").append(personLinks.getStatusTime().getTime()).append(" ").append(personLinks.getId()));
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
    public static void PersonLinks.deleteIndex(PersonLinks personLinks) {
        SolrServer solrServer = solrServer();
        try {
            solrServer.deleteById("personlinks_" + personLinks.getId());
            solrServer.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @PostUpdate
    @PostPersist
    private void PersonLinks.postPersistOrUpdate() {
        indexPersonLinks(this);
    }
    
    @PreRemove
    private void PersonLinks.preRemove() {
        deleteIndex(this);
    }
    
    public static SolrServer PersonLinks.solrServer() {
        SolrServer _solrServer = new PersonLinks().solrServer;
        if (_solrServer == null) throw new IllegalStateException("Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return _solrServer;
    }
    
}

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
import ro.roda.Audit;

privileged aspect Audit_Roo_SolrSearch {
    
    @Autowired
    transient SolrServer Audit.solrServer;
    
    public static QueryResponse Audit.search(String queryString) {
        String searchString = "Audit_solrsummary_t:" + queryString;
        return search(new SolrQuery(searchString.toLowerCase()));
    }
    
    public static QueryResponse Audit.search(SolrQuery query) {
        try {
            return solrServer().query(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new QueryResponse();
    }
    
    public static void Audit.indexAudit(Audit audit) {
        List<Audit> audits = new ArrayList<Audit>();
        audits.add(audit);
        indexAudits(audits);
    }
    
    @Async
    public static void Audit.indexAudits(Collection<Audit> audits) {
        List<SolrInputDocument> documents = new ArrayList<SolrInputDocument>();
        for (Audit audit : audits) {
            SolrInputDocument sid = new SolrInputDocument();
            sid.addField("id", "audit_" + audit.getId());
            sid.addField("audit.id_l", audit.getId());
            // Add summary field to allow searching documents for objects of this type
            sid.addField("audit_solrsummary_t", new StringBuilder().append(audit.getId()));
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
    public static void Audit.deleteIndex(Audit audit) {
        SolrServer solrServer = solrServer();
        try {
            solrServer.deleteById("audit_" + audit.getId());
            solrServer.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @PostUpdate
    @PostPersist
    private void Audit.postPersistOrUpdate() {
        indexAudit(this);
    }
    
    @PreRemove
    private void Audit.preRemove() {
        deleteIndex(this);
    }
    
    public static SolrServer Audit.solrServer() {
        SolrServer _solrServer = new Audit().solrServer;
        if (_solrServer == null) throw new IllegalStateException("Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return _solrServer;
    }
    
}

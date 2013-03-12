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
import ro.roda.domain.AuditLogField;

privileged aspect AuditLogField_Roo_SolrSearch {
    
    @Autowired
    transient SolrServer AuditLogField.solrServer;
    
    public static QueryResponse AuditLogField.search(String queryString) {
        String searchString = "AuditLogField_solrsummary_t:" + queryString;
        return search(new SolrQuery(searchString.toLowerCase()));
    }
    
    public static QueryResponse AuditLogField.search(SolrQuery query) {
        try {
            return solrServer().query(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new QueryResponse();
    }
    
    public static void AuditLogField.indexAuditLogField(AuditLogField auditLogField) {
        List<AuditLogField> auditlogfields = new ArrayList<AuditLogField>();
        auditlogfields.add(auditLogField);
        indexAuditLogFields(auditlogfields);
    }
    
    @Async
    public static void AuditLogField.indexAuditLogFields(Collection<AuditLogField> auditlogfields) {
        List<SolrInputDocument> documents = new ArrayList<SolrInputDocument>();
        for (AuditLogField auditLogField : auditlogfields) {
            SolrInputDocument sid = new SolrInputDocument();
            sid.addField("id", "auditlogfield_" + auditLogField.getId());
            sid.addField("auditLogField.auditedtable_t", auditLogField.getAuditedTable());
            sid.addField("auditLogField.name_s", auditLogField.getName());
            sid.addField("auditLogField.id_i", auditLogField.getId());
            // Add summary field to allow searching documents for objects of this type
            sid.addField("auditlogfield_solrsummary_t", new StringBuilder().append(auditLogField.getAuditedTable()).append(" ").append(auditLogField.getName()).append(" ").append(auditLogField.getId()));
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
    public static void AuditLogField.deleteIndex(AuditLogField auditLogField) {
        SolrServer solrServer = solrServer();
        try {
            solrServer.deleteById("auditlogfield_" + auditLogField.getId());
            solrServer.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @PostUpdate
    @PostPersist
    private void AuditLogField.postPersistOrUpdate() {
        indexAuditLogField(this);
    }
    
    @PreRemove
    private void AuditLogField.preRemove() {
        deleteIndex(this);
    }
    
    public static SolrServer AuditLogField.solrServer() {
        SolrServer _solrServer = new AuditLogField().solrServer;
        if (_solrServer == null) throw new IllegalStateException("Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return _solrServer;
    }
    
}
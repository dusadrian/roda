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
import ro.roda.domain.FormSelectionVar;

privileged aspect FormSelectionVar_Roo_SolrSearch {
    
    @Autowired
    transient SolrServer FormSelectionVar.solrServer;
    
    public static QueryResponse FormSelectionVar.search(String queryString) {
        String searchString = "FormSelectionVar_solrsummary_t:" + queryString;
        return search(new SolrQuery(searchString.toLowerCase()));
    }
    
    public static QueryResponse FormSelectionVar.search(SolrQuery query) {
        try {
            return solrServer().query(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new QueryResponse();
    }
    
    public static void FormSelectionVar.indexFormSelectionVar(FormSelectionVar formSelectionVar) {
        List<FormSelectionVar> formselectionvars = new ArrayList<FormSelectionVar>();
        formselectionvars.add(formSelectionVar);
        indexFormSelectionVars(formselectionvars);
    }
    
    @Async
    public static void FormSelectionVar.indexFormSelectionVars(Collection<FormSelectionVar> formselectionvars) {
        List<SolrInputDocument> documents = new ArrayList<SolrInputDocument>();
        for (FormSelectionVar formSelectionVar : formselectionvars) {
            SolrInputDocument sid = new SolrInputDocument();
            sid.addField("id", "formselectionvar_" + formSelectionVar.getId());
            sid.addField("formSelectionVar.id_t", formSelectionVar.getId());
            // Add summary field to allow searching documents for objects of this type
            sid.addField("formselectionvar_solrsummary_t", new StringBuilder().append(formSelectionVar.getId()));
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
    public static void FormSelectionVar.deleteIndex(FormSelectionVar formSelectionVar) {
        SolrServer solrServer = solrServer();
        try {
            solrServer.deleteById("formselectionvar_" + formSelectionVar.getId());
            solrServer.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @PostUpdate
    @PostPersist
    private void FormSelectionVar.postPersistOrUpdate() {
        indexFormSelectionVar(this);
    }
    
    @PreRemove
    private void FormSelectionVar.preRemove() {
        deleteIndex(this);
    }
    
    public static SolrServer FormSelectionVar.solrServer() {
        SolrServer _solrServer = new FormSelectionVar().solrServer;
        if (_solrServer == null) throw new IllegalStateException("Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return _solrServer;
    }
    
}

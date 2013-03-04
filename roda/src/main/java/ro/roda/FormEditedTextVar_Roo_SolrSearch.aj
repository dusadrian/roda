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
import ro.roda.FormEditedTextVar;

privileged aspect FormEditedTextVar_Roo_SolrSearch {
    
    @Autowired
    transient SolrServer FormEditedTextVar.solrServer;
    
    public static QueryResponse FormEditedTextVar.search(String queryString) {
        String searchString = "FormEditedTextVar_solrsummary_t:" + queryString;
        return search(new SolrQuery(searchString.toLowerCase()));
    }
    
    public static QueryResponse FormEditedTextVar.search(SolrQuery query) {
        try {
            return solrServer().query(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new QueryResponse();
    }
    
    public static void FormEditedTextVar.indexFormEditedTextVar(FormEditedTextVar formEditedTextVar) {
        List<FormEditedTextVar> formeditedtextvars = new ArrayList<FormEditedTextVar>();
        formeditedtextvars.add(formEditedTextVar);
        indexFormEditedTextVars(formeditedtextvars);
    }
    
    @Async
    public static void FormEditedTextVar.indexFormEditedTextVars(Collection<FormEditedTextVar> formeditedtextvars) {
        List<SolrInputDocument> documents = new ArrayList<SolrInputDocument>();
        for (FormEditedTextVar formEditedTextVar : formeditedtextvars) {
            SolrInputDocument sid = new SolrInputDocument();
            sid.addField("id", "formeditedtextvar_" + formEditedTextVar.getId());
            sid.addField("formEditedTextVar.formid_t", formEditedTextVar.getFormId());
            sid.addField("formEditedTextVar.variableid_t", formEditedTextVar.getVariableId());
            sid.addField("formEditedTextVar.text_s", formEditedTextVar.getText());
            sid.addField("formEditedTextVar.id_t", formEditedTextVar.getId());
            // Add summary field to allow searching documents for objects of this type
            sid.addField("formeditedtextvar_solrsummary_t", new StringBuilder().append(formEditedTextVar.getFormId()).append(" ").append(formEditedTextVar.getVariableId()).append(" ").append(formEditedTextVar.getText()).append(" ").append(formEditedTextVar.getId()));
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
    public static void FormEditedTextVar.deleteIndex(FormEditedTextVar formEditedTextVar) {
        SolrServer solrServer = solrServer();
        try {
            solrServer.deleteById("formeditedtextvar_" + formEditedTextVar.getId());
            solrServer.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @PostUpdate
    @PostPersist
    private void FormEditedTextVar.postPersistOrUpdate() {
        indexFormEditedTextVar(this);
    }
    
    @PreRemove
    private void FormEditedTextVar.preRemove() {
        deleteIndex(this);
    }
    
    public static SolrServer FormEditedTextVar.solrServer() {
        SolrServer _solrServer = new FormEditedTextVar().solrServer;
        if (_solrServer == null) throw new IllegalStateException("Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return _solrServer;
    }
    
}
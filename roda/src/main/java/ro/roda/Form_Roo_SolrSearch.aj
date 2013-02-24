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
import ro.roda.Form;

privileged aspect Form_Roo_SolrSearch {
    
    @Autowired
    transient SolrServer Form.solrServer;
    
    public static QueryResponse Form.search(String queryString) {
        String searchString = "Form_solrsummary_t:" + queryString;
        return search(new SolrQuery(searchString.toLowerCase()));
    }
    
    public static QueryResponse Form.search(SolrQuery query) {
        try {
            return solrServer().query(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new QueryResponse();
    }
    
    public static void Form.indexForm(Form form) {
        List<Form> forms = new ArrayList<Form>();
        forms.add(form);
        indexForms(forms);
    }
    
    @Async
    public static void Form.indexForms(Collection<Form> forms) {
        List<SolrInputDocument> documents = new ArrayList<SolrInputDocument>();
        for (Form form : forms) {
            SolrInputDocument sid = new SolrInputDocument();
            sid.addField("id", "form_" + form.getId());
            sid.addField("form.instanceid_t", form.getInstanceId());
            sid.addField("form.operatorid_t", form.getOperatorId());
            sid.addField("form.orderininstance_i", form.getOrderInInstance());
            sid.addField("form.operatornotes_s", form.getOperatorNotes());
            sid.addField("form.filltime_dt", form.getFillTime().getTime());
            sid.addField("form.id_l", form.getId());
            // Add summary field to allow searching documents for objects of this type
            sid.addField("form_solrsummary_t", new StringBuilder().append(form.getInstanceId()).append(" ").append(form.getOperatorId()).append(" ").append(form.getOrderInInstance()).append(" ").append(form.getOperatorNotes()).append(" ").append(form.getFillTime().getTime()).append(" ").append(form.getId()));
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
    public static void Form.deleteIndex(Form form) {
        SolrServer solrServer = solrServer();
        try {
            solrServer.deleteById("form_" + form.getId());
            solrServer.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @PostUpdate
    @PostPersist
    private void Form.postPersistOrUpdate() {
        indexForm(this);
    }
    
    @PreRemove
    private void Form.preRemove() {
        deleteIndex(this);
    }
    
    public static SolrServer Form.solrServer() {
        SolrServer _solrServer = new Form().solrServer;
        if (_solrServer == null) throw new IllegalStateException("Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return _solrServer;
    }
    
}

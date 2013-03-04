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
import ro.roda.Variable;

privileged aspect Variable_Roo_SolrSearch {
    
    @Autowired
    transient SolrServer Variable.solrServer;
    
    public static QueryResponse Variable.search(String queryString) {
        String searchString = "Variable_solrsummary_t:" + queryString;
        return search(new SolrQuery(searchString.toLowerCase()));
    }
    
    public static QueryResponse Variable.search(SolrQuery query) {
        try {
            return solrServer().query(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new QueryResponse();
    }
    
    public static void Variable.indexVariable(Variable variable) {
        List<Variable> variables = new ArrayList<Variable>();
        variables.add(variable);
        indexVariables(variables);
    }
    
    @Async
    public static void Variable.indexVariables(Collection<Variable> variables) {
        List<SolrInputDocument> documents = new ArrayList<SolrInputDocument>();
        for (Variable variable : variables) {
            SolrInputDocument sid = new SolrInputDocument();
            sid.addField("id", "variable_" + variable.getId());
            sid.addField("variable.selectionvariable_t", variable.getSelectionVariable());
            sid.addField("variable.fileid_t", variable.getFileId());
            sid.addField("variable.instanceid_t", variable.getInstanceId());
            sid.addField("variable.label_s", variable.getLabel());
            sid.addField("variable.type_t", variable.getType());
            sid.addField("variable.orderininstance_i", variable.getOrderInInstance());
            sid.addField("variable.operatorinstructions_s", variable.getOperatorInstructions());
            sid.addField("variable.id_l", variable.getId());
            // Add summary field to allow searching documents for objects of this type
            sid.addField("variable_solrsummary_t", new StringBuilder().append(variable.getSelectionVariable()).append(" ").append(variable.getFileId()).append(" ").append(variable.getInstanceId()).append(" ").append(variable.getLabel()).append(" ").append(variable.getType()).append(" ").append(variable.getOrderInInstance()).append(" ").append(variable.getOperatorInstructions()).append(" ").append(variable.getId()));
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
    public static void Variable.deleteIndex(Variable variable) {
        SolrServer solrServer = solrServer();
        try {
            solrServer.deleteById("variable_" + variable.getId());
            solrServer.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @PostUpdate
    @PostPersist
    private void Variable.postPersistOrUpdate() {
        indexVariable(this);
    }
    
    @PreRemove
    private void Variable.preRemove() {
        deleteIndex(this);
    }
    
    public static SolrServer Variable.solrServer() {
        SolrServer _solrServer = new Variable().solrServer;
        if (_solrServer == null) throw new IllegalStateException("Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return _solrServer;
    }
    
}
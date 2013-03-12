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
import ro.roda.domain.PropertyName;

privileged aspect PropertyName_Roo_SolrSearch {
    
    @Autowired
    transient SolrServer PropertyName.solrServer;
    
    public static QueryResponse PropertyName.search(String queryString) {
        String searchString = "PropertyName_solrsummary_t:" + queryString;
        return search(new SolrQuery(searchString.toLowerCase()));
    }
    
    public static QueryResponse PropertyName.search(SolrQuery query) {
        try {
            return solrServer().query(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new QueryResponse();
    }
    
    public static void PropertyName.indexPropertyName(PropertyName propertyName) {
        List<PropertyName> propertynames = new ArrayList<PropertyName>();
        propertynames.add(propertyName);
        indexPropertyNames(propertynames);
    }
    
    @Async
    public static void PropertyName.indexPropertyNames(Collection<PropertyName> propertynames) {
        List<SolrInputDocument> documents = new ArrayList<SolrInputDocument>();
        for (PropertyName propertyName : propertynames) {
            SolrInputDocument sid = new SolrInputDocument();
            sid.addField("id", "propertyname_" + propertyName.getId());
            sid.addField("propertyName.name_s", propertyName.getName());
            sid.addField("propertyName.description_s", propertyName.getDescription());
            sid.addField("propertyName.id_i", propertyName.getId());
            // Add summary field to allow searching documents for objects of this type
            sid.addField("propertyname_solrsummary_t", new StringBuilder().append(propertyName.getName()).append(" ").append(propertyName.getDescription()).append(" ").append(propertyName.getId()));
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
    public static void PropertyName.deleteIndex(PropertyName propertyName) {
        SolrServer solrServer = solrServer();
        try {
            solrServer.deleteById("propertyname_" + propertyName.getId());
            solrServer.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @PostUpdate
    @PostPersist
    private void PropertyName.postPersistOrUpdate() {
        indexPropertyName(this);
    }
    
    @PreRemove
    private void PropertyName.preRemove() {
        deleteIndex(this);
    }
    
    public static SolrServer PropertyName.solrServer() {
        SolrServer _solrServer = new PropertyName().solrServer;
        if (_solrServer == null) throw new IllegalStateException("Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return _solrServer;
    }
    
}
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
import ro.roda.domain.Internet;

privileged aspect Internet_Roo_SolrSearch {
    
    @Autowired
    transient SolrServer Internet.solrServer;
    
    public static QueryResponse Internet.search(String queryString) {
        String searchString = "Internet_solrsummary_t:" + queryString;
        return search(new SolrQuery(searchString.toLowerCase()));
    }
    
    public static QueryResponse Internet.search(SolrQuery query) {
        try {
            return solrServer().query(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new QueryResponse();
    }
    
    public static void Internet.indexInternet(Internet internet) {
        List<Internet> internets = new ArrayList<Internet>();
        internets.add(internet);
        indexInternets(internets);
    }
    
    @Async
    public static void Internet.indexInternets(Collection<Internet> internets) {
        List<SolrInputDocument> documents = new ArrayList<SolrInputDocument>();
        for (Internet internet : internets) {
            SolrInputDocument sid = new SolrInputDocument();
            sid.addField("id", "internet_" + internet.getId());
            sid.addField("internet.internettype_s", internet.getInternetType());
            sid.addField("internet.internet_s", internet.getInternet());
            sid.addField("internet.id_i", internet.getId());
            // Add summary field to allow searching documents for objects of this type
            sid.addField("internet_solrsummary_t", new StringBuilder().append(internet.getInternetType()).append(" ").append(internet.getInternet()).append(" ").append(internet.getId()));
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
    public static void Internet.deleteIndex(Internet internet) {
        SolrServer solrServer = solrServer();
        try {
            solrServer.deleteById("internet_" + internet.getId());
            solrServer.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @PostUpdate
    @PostPersist
    private void Internet.postPersistOrUpdate() {
        indexInternet(this);
    }
    
    @PreRemove
    private void Internet.preRemove() {
        deleteIndex(this);
    }
    
    public static SolrServer Internet.solrServer() {
        SolrServer _solrServer = new Internet().solrServer;
        if (_solrServer == null) throw new IllegalStateException("Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return _solrServer;
    }
    
}

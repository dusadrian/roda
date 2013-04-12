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
import ro.roda.domain.Keyword;

privileged aspect Keyword_Roo_SolrSearch {
    
    @Autowired
    transient SolrServer Keyword.solrServer;
    
    public static QueryResponse Keyword.search(String queryString) {
        String searchString = "Keyword_solrsummary_t:" + queryString;
        return search(new SolrQuery(searchString.toLowerCase()));
    }
    
    public static QueryResponse Keyword.search(SolrQuery query) {
        try {
            return solrServer().query(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new QueryResponse();
    }
    
    public static void Keyword.indexKeyword(Keyword keyword) {
        List<Keyword> keywords = new ArrayList<Keyword>();
        keywords.add(keyword);
        indexKeywords(keywords);
    }
    
    @Async
    public static void Keyword.indexKeywords(Collection<Keyword> keywords) {
        List<SolrInputDocument> documents = new ArrayList<SolrInputDocument>();
        for (Keyword keyword : keywords) {
            SolrInputDocument sid = new SolrInputDocument();
            sid.addField("id", "keyword_" + keyword.getId());
            sid.addField("keyword.id_i", keyword.getId());
            // Add summary field to allow searching documents for objects of this type
            sid.addField("keyword_solrsummary_t", new StringBuilder().append(keyword.getId()));
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
    public static void Keyword.deleteIndex(Keyword keyword) {
        SolrServer solrServer = solrServer();
        try {
            solrServer.deleteById("keyword_" + keyword.getId());
            solrServer.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @PostUpdate
    @PostPersist
    private void Keyword.postPersistOrUpdate() {
        indexKeyword(this);
    }
    
    @PreRemove
    private void Keyword.preRemove() {
        deleteIndex(this);
    }
    
    public static SolrServer Keyword.solrServer() {
        SolrServer _solrServer = new Keyword().solrServer;
        if (_solrServer == null) throw new IllegalStateException("Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return _solrServer;
    }
    
}

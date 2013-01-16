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
import ro.roda.Sourcestudy;

privileged aspect Sourcestudy_Roo_SolrSearch {
    
    @Autowired
    transient SolrServer Sourcestudy.solrServer;
    
    public static QueryResponse Sourcestudy.search(String queryString) {
        String searchString = "Sourcestudy_solrsummary_t:" + queryString;
        return search(new SolrQuery(searchString.toLowerCase()));
    }
    
    public static QueryResponse Sourcestudy.search(SolrQuery query) {
        try {
            return solrServer().query(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new QueryResponse();
    }
    
    public static void Sourcestudy.indexSourcestudy(Sourcestudy sourcestudy) {
        List<Sourcestudy> sourcestudys = new ArrayList<Sourcestudy>();
        sourcestudys.add(sourcestudy);
        indexSourcestudys(sourcestudys);
    }
    
    @Async
    public static void Sourcestudy.indexSourcestudys(Collection<Sourcestudy> sourcestudys) {
        List<SolrInputDocument> documents = new ArrayList<SolrInputDocument>();
        for (Sourcestudy sourcestudy : sourcestudys) {
            SolrInputDocument sid = new SolrInputDocument();
            sid.addField("id", "sourcestudy_" + sourcestudy.getId());
            sid.addField("sourcestudy.orgid_t", sourcestudy.getOrgId());
            sid.addField("sourcestudy.type_t", sourcestudy.getType());
            sid.addField("sourcestudy.name_s", sourcestudy.getName());
            sid.addField("sourcestudy.details_s", sourcestudy.getDetails());
            sid.addField("sourcestudy.id_i", sourcestudy.getId());
            // Add summary field to allow searching documents for objects of this type
            sid.addField("sourcestudy_solrsummary_t", new StringBuilder().append(sourcestudy.getOrgId()).append(" ").append(sourcestudy.getType()).append(" ").append(sourcestudy.getName()).append(" ").append(sourcestudy.getDetails()).append(" ").append(sourcestudy.getId()));
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
    public static void Sourcestudy.deleteIndex(Sourcestudy sourcestudy) {
        SolrServer solrServer = solrServer();
        try {
            solrServer.deleteById("sourcestudy_" + sourcestudy.getId());
            solrServer.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @PostUpdate
    @PostPersist
    private void Sourcestudy.postPersistOrUpdate() {
        indexSourcestudy(this);
    }
    
    @PreRemove
    private void Sourcestudy.preRemove() {
        deleteIndex(this);
    }
    
    public static SolrServer Sourcestudy.solrServer() {
        SolrServer _solrServer = new Sourcestudy().solrServer;
        if (_solrServer == null) throw new IllegalStateException("Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return _solrServer;
    }
    
}

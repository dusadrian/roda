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
import ro.roda.domain.TimeMethType;

privileged aspect TimeMethType_Roo_SolrSearch {
    
    @Autowired
    transient SolrServer TimeMethType.solrServer;
    
    public static QueryResponse TimeMethType.search(String queryString) {
        String searchString = "TimeMethType_solrsummary_t:" + queryString;
        return search(new SolrQuery(searchString.toLowerCase()));
    }
    
    public static QueryResponse TimeMethType.search(SolrQuery query) {
        try {
            return solrServer().query(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new QueryResponse();
    }
    
    public static void TimeMethType.indexTimeMethType(TimeMethType timeMethType) {
        List<TimeMethType> timemethtypes = new ArrayList<TimeMethType>();
        timemethtypes.add(timeMethType);
        indexTimeMethTypes(timemethtypes);
    }
    
    @Async
    public static void TimeMethType.indexTimeMethTypes(Collection<TimeMethType> timemethtypes) {
        List<SolrInputDocument> documents = new ArrayList<SolrInputDocument>();
        for (TimeMethType timeMethType : timemethtypes) {
            SolrInputDocument sid = new SolrInputDocument();
            sid.addField("id", "timemethtype_" + timeMethType.getId());
            sid.addField("timeMethType.id_i", timeMethType.getId());
            // Add summary field to allow searching documents for objects of this type
            sid.addField("timemethtype_solrsummary_t", new StringBuilder().append(timeMethType.getId()));
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
    public static void TimeMethType.deleteIndex(TimeMethType timeMethType) {
        SolrServer solrServer = solrServer();
        try {
            solrServer.deleteById("timemethtype_" + timeMethType.getId());
            solrServer.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @PostUpdate
    @PostPersist
    private void TimeMethType.postPersistOrUpdate() {
        indexTimeMethType(this);
    }
    
    @PreRemove
    private void TimeMethType.preRemove() {
        deleteIndex(this);
    }
    
    public static SolrServer TimeMethType.solrServer() {
        SolrServer _solrServer = new TimeMethType().solrServer;
        if (_solrServer == null) throw new IllegalStateException("Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return _solrServer;
    }
    
}

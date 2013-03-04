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
import ro.roda.OtherStatistic;

privileged aspect OtherStatistic_Roo_SolrSearch {
    
    @Autowired
    transient SolrServer OtherStatistic.solrServer;
    
    public static QueryResponse OtherStatistic.search(String queryString) {
        String searchString = "OtherStatistic_solrsummary_t:" + queryString;
        return search(new SolrQuery(searchString.toLowerCase()));
    }
    
    public static QueryResponse OtherStatistic.search(SolrQuery query) {
        try {
            return solrServer().query(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new QueryResponse();
    }
    
    public static void OtherStatistic.indexOtherStatistic(OtherStatistic otherStatistic) {
        List<OtherStatistic> otherstatistics = new ArrayList<OtherStatistic>();
        otherstatistics.add(otherStatistic);
        indexOtherStatistics(otherstatistics);
    }
    
    @Async
    public static void OtherStatistic.indexOtherStatistics(Collection<OtherStatistic> otherstatistics) {
        List<SolrInputDocument> documents = new ArrayList<SolrInputDocument>();
        for (OtherStatistic otherStatistic : otherstatistics) {
            SolrInputDocument sid = new SolrInputDocument();
            sid.addField("id", "otherstatistic_" + otherStatistic.getId());
            sid.addField("otherStatistic.variableid_t", otherStatistic.getVariableId());
            sid.addField("otherStatistic.name_s", otherStatistic.getName());
            sid.addField("otherStatistic.value_f", otherStatistic.getValue());
            sid.addField("otherStatistic.description_s", otherStatistic.getDescription());
            sid.addField("otherStatistic.id_l", otherStatistic.getId());
            // Add summary field to allow searching documents for objects of this type
            sid.addField("otherstatistic_solrsummary_t", new StringBuilder().append(otherStatistic.getVariableId()).append(" ").append(otherStatistic.getName()).append(" ").append(otherStatistic.getValue()).append(" ").append(otherStatistic.getDescription()).append(" ").append(otherStatistic.getId()));
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
    public static void OtherStatistic.deleteIndex(OtherStatistic otherStatistic) {
        SolrServer solrServer = solrServer();
        try {
            solrServer.deleteById("otherstatistic_" + otherStatistic.getId());
            solrServer.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @PostUpdate
    @PostPersist
    private void OtherStatistic.postPersistOrUpdate() {
        indexOtherStatistic(this);
    }
    
    @PreRemove
    private void OtherStatistic.preRemove() {
        deleteIndex(this);
    }
    
    public static SolrServer OtherStatistic.solrServer() {
        SolrServer _solrServer = new OtherStatistic().solrServer;
        if (_solrServer == null) throw new IllegalStateException("Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return _solrServer;
    }
    
}
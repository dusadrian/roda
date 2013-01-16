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
import ro.roda.SourcestudyTypeHistory;

privileged aspect SourcestudyTypeHistory_Roo_SolrSearch {
    
    @Autowired
    transient SolrServer SourcestudyTypeHistory.solrServer;
    
    public static QueryResponse SourcestudyTypeHistory.search(String queryString) {
        String searchString = "SourcestudyTypeHistory_solrsummary_t:" + queryString;
        return search(new SolrQuery(searchString.toLowerCase()));
    }
    
    public static QueryResponse SourcestudyTypeHistory.search(SolrQuery query) {
        try {
            return solrServer().query(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new QueryResponse();
    }
    
    public static void SourcestudyTypeHistory.indexSourcestudyTypeHistory(SourcestudyTypeHistory sourcestudyTypeHistory) {
        List<SourcestudyTypeHistory> sourcestudytypehistorys = new ArrayList<SourcestudyTypeHistory>();
        sourcestudytypehistorys.add(sourcestudyTypeHistory);
        indexSourcestudyTypeHistorys(sourcestudytypehistorys);
    }
    
    @Async
    public static void SourcestudyTypeHistory.indexSourcestudyTypeHistorys(Collection<SourcestudyTypeHistory> sourcestudytypehistorys) {
        List<SolrInputDocument> documents = new ArrayList<SolrInputDocument>();
        for (SourcestudyTypeHistory sourcestudyTypeHistory : sourcestudytypehistorys) {
            SolrInputDocument sid = new SolrInputDocument();
            sid.addField("id", "sourcestudytypehistory_" + sourcestudyTypeHistory.getId());
            sid.addField("sourcestudyTypeHistory.sourcesstudyid_t", sourcestudyTypeHistory.getSourcesstudyId());
            sid.addField("sourcestudyTypeHistory.sourcestudytypeid_t", sourcestudyTypeHistory.getSourcestudyTypeId());
            sid.addField("sourcestudyTypeHistory.datestart_dt", sourcestudyTypeHistory.getDatestart());
            sid.addField("sourcestudyTypeHistory.dateend_dt", sourcestudyTypeHistory.getDateend());
            sid.addField("sourcestudyTypeHistory.addedby_i", sourcestudyTypeHistory.getAddedBy());
            sid.addField("sourcestudyTypeHistory.id_i", sourcestudyTypeHistory.getId());
            // Add summary field to allow searching documents for objects of this type
            sid.addField("sourcestudytypehistory_solrsummary_t", new StringBuilder().append(sourcestudyTypeHistory.getSourcesstudyId()).append(" ").append(sourcestudyTypeHistory.getSourcestudyTypeId()).append(" ").append(sourcestudyTypeHistory.getDatestart()).append(" ").append(sourcestudyTypeHistory.getDateend()).append(" ").append(sourcestudyTypeHistory.getAddedBy()).append(" ").append(sourcestudyTypeHistory.getId()));
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
    public static void SourcestudyTypeHistory.deleteIndex(SourcestudyTypeHistory sourcestudyTypeHistory) {
        SolrServer solrServer = solrServer();
        try {
            solrServer.deleteById("sourcestudytypehistory_" + sourcestudyTypeHistory.getId());
            solrServer.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @PostUpdate
    @PostPersist
    private void SourcestudyTypeHistory.postPersistOrUpdate() {
        indexSourcestudyTypeHistory(this);
    }
    
    @PreRemove
    private void SourcestudyTypeHistory.preRemove() {
        deleteIndex(this);
    }
    
    public static SolrServer SourcestudyTypeHistory.solrServer() {
        SolrServer _solrServer = new SourcestudyTypeHistory().solrServer;
        if (_solrServer == null) throw new IllegalStateException("Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return _solrServer;
    }
    
}

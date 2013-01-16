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
import ro.roda.StudyKeyword;

privileged aspect StudyKeyword_Roo_SolrSearch {
    
    @Autowired
    transient SolrServer StudyKeyword.solrServer;
    
    public static QueryResponse StudyKeyword.search(String queryString) {
        String searchString = "StudyKeyword_solrsummary_t:" + queryString;
        return search(new SolrQuery(searchString.toLowerCase()));
    }
    
    public static QueryResponse StudyKeyword.search(SolrQuery query) {
        try {
            return solrServer().query(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new QueryResponse();
    }
    
    public static void StudyKeyword.indexStudyKeyword(StudyKeyword studyKeyword) {
        List<StudyKeyword> studykeywords = new ArrayList<StudyKeyword>();
        studykeywords.add(studyKeyword);
        indexStudyKeywords(studykeywords);
    }
    
    @Async
    public static void StudyKeyword.indexStudyKeywords(Collection<StudyKeyword> studykeywords) {
        List<SolrInputDocument> documents = new ArrayList<SolrInputDocument>();
        for (StudyKeyword studyKeyword : studykeywords) {
            SolrInputDocument sid = new SolrInputDocument();
            sid.addField("id", "studykeyword_" + studyKeyword.getId());
            sid.addField("studyKeyword.keywordid_t", studyKeyword.getKeywordId());
            sid.addField("studyKeyword.studyid_t", studyKeyword.getStudyId());
            sid.addField("studyKeyword.added_dt", studyKeyword.getAdded());
            sid.addField("studyKeyword.addedby_i", studyKeyword.getAddedBy());
            sid.addField("studyKeyword.id_t", studyKeyword.getId());
            // Add summary field to allow searching documents for objects of this type
            sid.addField("studykeyword_solrsummary_t", new StringBuilder().append(studyKeyword.getKeywordId()).append(" ").append(studyKeyword.getStudyId()).append(" ").append(studyKeyword.getAdded()).append(" ").append(studyKeyword.getAddedBy()).append(" ").append(studyKeyword.getId()));
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
    public static void StudyKeyword.deleteIndex(StudyKeyword studyKeyword) {
        SolrServer solrServer = solrServer();
        try {
            solrServer.deleteById("studykeyword_" + studyKeyword.getId());
            solrServer.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @PostUpdate
    @PostPersist
    private void StudyKeyword.postPersistOrUpdate() {
        indexStudyKeyword(this);
    }
    
    @PreRemove
    private void StudyKeyword.preRemove() {
        deleteIndex(this);
    }
    
    public static SolrServer StudyKeyword.solrServer() {
        SolrServer _solrServer = new StudyKeyword().solrServer;
        if (_solrServer == null) throw new IllegalStateException("Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return _solrServer;
    }
    
}

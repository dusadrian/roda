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
import ro.roda.StudyAcl;

privileged aspect StudyAcl_Roo_SolrSearch {
    
    @Autowired
    transient SolrServer StudyAcl.solrServer;
    
    public static QueryResponse StudyAcl.search(String queryString) {
        String searchString = "StudyAcl_solrsummary_t:" + queryString;
        return search(new SolrQuery(searchString.toLowerCase()));
    }
    
    public static QueryResponse StudyAcl.search(SolrQuery query) {
        try {
            return solrServer().query(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new QueryResponse();
    }
    
    public static void StudyAcl.indexStudyAcl(StudyAcl studyAcl) {
        List<StudyAcl> studyacls = new ArrayList<StudyAcl>();
        studyacls.add(studyAcl);
        indexStudyAcls(studyacls);
    }
    
    @Async
    public static void StudyAcl.indexStudyAcls(Collection<StudyAcl> studyacls) {
        List<SolrInputDocument> documents = new ArrayList<SolrInputDocument>();
        for (StudyAcl studyAcl : studyacls) {
            SolrInputDocument sid = new SolrInputDocument();
            sid.addField("id", "studyacl_" + studyAcl.getId());
            sid.addField("studyAcl.studyid_t", studyAcl.getStudyId());
            sid.addField("studyAcl.read_b", studyAcl.getRead());
            sid.addField("studyAcl.update_b", studyAcl.getUpdate());
            sid.addField("studyAcl.delete_b", studyAcl.getDelete());
            sid.addField("studyAcl.modacl_b", studyAcl.getModacl());
            sid.addField("studyAcl.id_t", studyAcl.getId());
            // Add summary field to allow searching documents for objects of this type
            sid.addField("studyacl_solrsummary_t", new StringBuilder().append(studyAcl.getStudyId()).append(" ").append(studyAcl.getRead()).append(" ").append(studyAcl.getUpdate()).append(" ").append(studyAcl.getDelete()).append(" ").append(studyAcl.getModacl()).append(" ").append(studyAcl.getId()));
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
    public static void StudyAcl.deleteIndex(StudyAcl studyAcl) {
        SolrServer solrServer = solrServer();
        try {
            solrServer.deleteById("studyacl_" + studyAcl.getId());
            solrServer.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @PostUpdate
    @PostPersist
    private void StudyAcl.postPersistOrUpdate() {
        indexStudyAcl(this);
    }
    
    @PreRemove
    private void StudyAcl.preRemove() {
        deleteIndex(this);
    }
    
    public static SolrServer StudyAcl.solrServer() {
        SolrServer _solrServer = new StudyAcl().solrServer;
        if (_solrServer == null) throw new IllegalStateException("Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return _solrServer;
    }
    
}

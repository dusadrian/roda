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
import ro.roda.domain.StudyPerson;

privileged aspect StudyPerson_Roo_SolrSearch {
    
    @Autowired
    transient SolrServer StudyPerson.solrServer;
    
    public static QueryResponse StudyPerson.search(String queryString) {
        String searchString = "StudyPerson_solrsummary_t:" + queryString;
        return search(new SolrQuery(searchString.toLowerCase()));
    }
    
    public static QueryResponse StudyPerson.search(SolrQuery query) {
        try {
            return solrServer().query(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new QueryResponse();
    }
    
    public static void StudyPerson.indexStudyPerson(StudyPerson studyPerson) {
        List<StudyPerson> studypeople = new ArrayList<StudyPerson>();
        studypeople.add(studyPerson);
        indexStudypeople(studypeople);
    }
    
    @Async
    public static void StudyPerson.indexStudypeople(Collection<StudyPerson> studypeople) {
        List<SolrInputDocument> documents = new ArrayList<SolrInputDocument>();
        for (StudyPerson studyPerson : studypeople) {
            SolrInputDocument sid = new SolrInputDocument();
            sid.addField("id", "studyperson_" + studyPerson.getId());
            sid.addField("studyPerson.id_t", studyPerson.getId());
            // Add summary field to allow searching documents for objects of this type
            sid.addField("studyperson_solrsummary_t", new StringBuilder().append(studyPerson.getId()));
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
    public static void StudyPerson.deleteIndex(StudyPerson studyPerson) {
        SolrServer solrServer = solrServer();
        try {
            solrServer.deleteById("studyperson_" + studyPerson.getId());
            solrServer.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @PostUpdate
    @PostPersist
    private void StudyPerson.postPersistOrUpdate() {
        indexStudyPerson(this);
    }
    
    @PreRemove
    private void StudyPerson.preRemove() {
        deleteIndex(this);
    }
    
    public static SolrServer StudyPerson.solrServer() {
        SolrServer _solrServer = new StudyPerson().solrServer;
        if (_solrServer == null) throw new IllegalStateException("Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return _solrServer;
    }
    
}

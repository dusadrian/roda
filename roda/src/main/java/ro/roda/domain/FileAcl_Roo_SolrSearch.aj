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
import ro.roda.domain.FileAcl;

privileged aspect FileAcl_Roo_SolrSearch {
    
    @Autowired
    transient SolrServer FileAcl.solrServer;
    
    public static QueryResponse FileAcl.search(String queryString) {
        String searchString = "FileAcl_solrsummary_t:" + queryString;
        return search(new SolrQuery(searchString.toLowerCase()));
    }
    
    public static QueryResponse FileAcl.search(SolrQuery query) {
        try {
            return solrServer().query(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new QueryResponse();
    }
    
    public static void FileAcl.indexFileAcl(FileAcl fileAcl) {
        List<FileAcl> fileacls = new ArrayList<FileAcl>();
        fileacls.add(fileAcl);
        indexFileAcls(fileacls);
    }
    
    @Async
    public static void FileAcl.indexFileAcls(Collection<FileAcl> fileacls) {
        List<SolrInputDocument> documents = new ArrayList<SolrInputDocument>();
        for (FileAcl fileAcl : fileacls) {
            SolrInputDocument sid = new SolrInputDocument();
            sid.addField("id", "fileacl_" + fileAcl.getId());
            sid.addField("fileAcl.id_t", fileAcl.getId());
            // Add summary field to allow searching documents for objects of this type
            sid.addField("fileacl_solrsummary_t", new StringBuilder().append(fileAcl.getId()));
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
    public static void FileAcl.deleteIndex(FileAcl fileAcl) {
        SolrServer solrServer = solrServer();
        try {
            solrServer.deleteById("fileacl_" + fileAcl.getId());
            solrServer.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @PostUpdate
    @PostPersist
    private void FileAcl.postPersistOrUpdate() {
        indexFileAcl(this);
    }
    
    @PreRemove
    private void FileAcl.preRemove() {
        deleteIndex(this);
    }
    
    public static SolrServer FileAcl.solrServer() {
        SolrServer _solrServer = new FileAcl().solrServer;
        if (_solrServer == null) throw new IllegalStateException("Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return _solrServer;
    }
    
}

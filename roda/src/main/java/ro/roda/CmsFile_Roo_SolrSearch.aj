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
import ro.roda.CmsFile;

privileged aspect CmsFile_Roo_SolrSearch {
    
    @Autowired
    transient SolrServer CmsFile.solrServer;
    
    public static QueryResponse CmsFile.search(String queryString) {
        String searchString = "CmsFile_solrsummary_t:" + queryString;
        return search(new SolrQuery(searchString.toLowerCase()));
    }
    
    public static QueryResponse CmsFile.search(SolrQuery query) {
        try {
            return solrServer().query(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new QueryResponse();
    }
    
    public static void CmsFile.indexCmsFile(CmsFile cmsFile) {
        List<CmsFile> cmsfiles = new ArrayList<CmsFile>();
        cmsfiles.add(cmsFile);
        indexCmsFiles(cmsfiles);
    }
    
    @Async
    public static void CmsFile.indexCmsFiles(Collection<CmsFile> cmsfiles) {
        List<SolrInputDocument> documents = new ArrayList<SolrInputDocument>();
        for (CmsFile cmsFile : cmsfiles) {
            SolrInputDocument sid = new SolrInputDocument();
            sid.addField("id", "cmsfile_" + cmsFile.getId());
            sid.addField("cmsFile.id_i", cmsFile.getId());
            // Add summary field to allow searching documents for objects of this type
            sid.addField("cmsfile_solrsummary_t", new StringBuilder().append(cmsFile.getId()));
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
    public static void CmsFile.deleteIndex(CmsFile cmsFile) {
        SolrServer solrServer = solrServer();
        try {
            solrServer.deleteById("cmsfile_" + cmsFile.getId());
            solrServer.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @PostUpdate
    @PostPersist
    private void CmsFile.postPersistOrUpdate() {
        indexCmsFile(this);
    }
    
    @PreRemove
    private void CmsFile.preRemove() {
        deleteIndex(this);
    }
    
    public static SolrServer CmsFile.solrServer() {
        SolrServer _solrServer = new CmsFile().solrServer;
        if (_solrServer == null) throw new IllegalStateException("Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return _solrServer;
    }
    
}

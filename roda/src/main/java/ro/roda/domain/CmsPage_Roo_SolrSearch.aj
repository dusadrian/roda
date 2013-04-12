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
import ro.roda.domain.CmsPage;

privileged aspect CmsPage_Roo_SolrSearch {
    
    @Autowired
    transient SolrServer CmsPage.solrServer;
    
    public static QueryResponse CmsPage.search(String queryString) {
        String searchString = "CmsPage_solrsummary_t:" + queryString;
        return search(new SolrQuery(searchString.toLowerCase()));
    }
    
    public static QueryResponse CmsPage.search(SolrQuery query) {
        try {
            return solrServer().query(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new QueryResponse();
    }
    
    public static void CmsPage.indexCmsPage(CmsPage cmsPage) {
        List<CmsPage> cmspages = new ArrayList<CmsPage>();
        cmspages.add(cmsPage);
        indexCmsPages(cmspages);
    }
    
    @Async
    public static void CmsPage.indexCmsPages(Collection<CmsPage> cmspages) {
        List<SolrInputDocument> documents = new ArrayList<SolrInputDocument>();
        for (CmsPage cmsPage : cmspages) {
            SolrInputDocument sid = new SolrInputDocument();
            sid.addField("id", "cmspage_" + cmsPage.getId());
            sid.addField("cmsPage.id_i", cmsPage.getId());
            // Add summary field to allow searching documents for objects of this type
            sid.addField("cmspage_solrsummary_t", new StringBuilder().append(cmsPage.getId()));
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
    public static void CmsPage.deleteIndex(CmsPage cmsPage) {
        SolrServer solrServer = solrServer();
        try {
            solrServer.deleteById("cmspage_" + cmsPage.getId());
            solrServer.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @PostUpdate
    @PostPersist
    private void CmsPage.postPersistOrUpdate() {
        indexCmsPage(this);
    }
    
    @PreRemove
    private void CmsPage.preRemove() {
        deleteIndex(this);
    }
    
    public static SolrServer CmsPage.solrServer() {
        SolrServer _solrServer = new CmsPage().solrServer;
        if (_solrServer == null) throw new IllegalStateException("Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return _solrServer;
    }
    
}

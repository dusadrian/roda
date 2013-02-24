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
import ro.roda.CmsLayout;

privileged aspect CmsLayout_Roo_SolrSearch {
    
    @Autowired
    transient SolrServer CmsLayout.solrServer;
    
    public static QueryResponse CmsLayout.search(String queryString) {
        String searchString = "CmsLayout_solrsummary_t:" + queryString;
        return search(new SolrQuery(searchString.toLowerCase()));
    }
    
    public static QueryResponse CmsLayout.search(SolrQuery query) {
        try {
            return solrServer().query(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new QueryResponse();
    }
    
    public static void CmsLayout.indexCmsLayout(CmsLayout cmsLayout) {
        List<CmsLayout> cmslayouts = new ArrayList<CmsLayout>();
        cmslayouts.add(cmsLayout);
        indexCmsLayouts(cmslayouts);
    }
    
    @Async
    public static void CmsLayout.indexCmsLayouts(Collection<CmsLayout> cmslayouts) {
        List<SolrInputDocument> documents = new ArrayList<SolrInputDocument>();
        for (CmsLayout cmsLayout : cmslayouts) {
            SolrInputDocument sid = new SolrInputDocument();
            sid.addField("id", "cmslayout_" + cmsLayout.getId());
            sid.addField("cmsLayout.cmslayoutgroupid_t", cmsLayout.getCmsLayoutGroupId());
            sid.addField("cmsLayout.name_s", cmsLayout.getName());
            sid.addField("cmsLayout.layoutcontent_s", cmsLayout.getLayoutContent());
            sid.addField("cmsLayout.id_i", cmsLayout.getId());
            // Add summary field to allow searching documents for objects of this type
            sid.addField("cmslayout_solrsummary_t", new StringBuilder().append(cmsLayout.getCmsLayoutGroupId()).append(" ").append(cmsLayout.getName()).append(" ").append(cmsLayout.getLayoutContent()).append(" ").append(cmsLayout.getId()));
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
    public static void CmsLayout.deleteIndex(CmsLayout cmsLayout) {
        SolrServer solrServer = solrServer();
        try {
            solrServer.deleteById("cmslayout_" + cmsLayout.getId());
            solrServer.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @PostUpdate
    @PostPersist
    private void CmsLayout.postPersistOrUpdate() {
        indexCmsLayout(this);
    }
    
    @PreRemove
    private void CmsLayout.preRemove() {
        deleteIndex(this);
    }
    
    public static SolrServer CmsLayout.solrServer() {
        SolrServer _solrServer = new CmsLayout().solrServer;
        if (_solrServer == null) throw new IllegalStateException("Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return _solrServer;
    }
    
}

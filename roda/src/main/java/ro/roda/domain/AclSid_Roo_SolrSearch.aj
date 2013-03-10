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
import ro.roda.domain.AclSid;

privileged aspect AclSid_Roo_SolrSearch {
    
    @Autowired
    transient SolrServer AclSid.solrServer;
    
    public static QueryResponse AclSid.search(String queryString) {
        String searchString = "AclSid_solrsummary_t:" + queryString;
        return search(new SolrQuery(searchString.toLowerCase()));
    }
    
    public static QueryResponse AclSid.search(SolrQuery query) {
        try {
            return solrServer().query(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new QueryResponse();
    }
    
    public static void AclSid.indexAclSid(AclSid aclSid) {
        List<AclSid> aclsids = new ArrayList<AclSid>();
        aclsids.add(aclSid);
        indexAclSids(aclsids);
    }
    
    @Async
    public static void AclSid.indexAclSids(Collection<AclSid> aclsids) {
        List<SolrInputDocument> documents = new ArrayList<SolrInputDocument>();
        for (AclSid aclSid : aclsids) {
            SolrInputDocument sid = new SolrInputDocument();
            sid.addField("id", "aclsid_" + aclSid.getId());
            sid.addField("aclSid.id_l", aclSid.getId());
            // Add summary field to allow searching documents for objects of this type
            sid.addField("aclsid_solrsummary_t", new StringBuilder().append(aclSid.getId()));
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
    public static void AclSid.deleteIndex(AclSid aclSid) {
        SolrServer solrServer = solrServer();
        try {
            solrServer.deleteById("aclsid_" + aclSid.getId());
            solrServer.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @PostUpdate
    @PostPersist
    private void AclSid.postPersistOrUpdate() {
        indexAclSid(this);
    }
    
    @PreRemove
    private void AclSid.preRemove() {
        deleteIndex(this);
    }
    
    public static SolrServer AclSid.solrServer() {
        SolrServer _solrServer = new AclSid().solrServer;
        if (_solrServer == null) throw new IllegalStateException("Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return _solrServer;
    }
    
}

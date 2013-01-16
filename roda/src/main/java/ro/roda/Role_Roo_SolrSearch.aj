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
import ro.roda.Role;

privileged aspect Role_Roo_SolrSearch {
    
    @Autowired
    transient SolrServer Role.solrServer;
    
    public static QueryResponse Role.search(String queryString) {
        String searchString = "Role_solrsummary_t:" + queryString;
        return search(new SolrQuery(searchString.toLowerCase()));
    }
    
    public static QueryResponse Role.search(SolrQuery query) {
        try {
            return solrServer().query(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new QueryResponse();
    }
    
    public static void Role.indexRole(Role role) {
        List<Role> roles = new ArrayList<Role>();
        roles.add(role);
        indexRoles(roles);
    }
    
    @Async
    public static void Role.indexRoles(Collection<Role> roles) {
        List<SolrInputDocument> documents = new ArrayList<SolrInputDocument>();
        for (Role role : roles) {
            SolrInputDocument sid = new SolrInputDocument();
            sid.addField("id", "role_" + role.getId());
            sid.addField("role.name_s", role.getName());
            sid.addField("role.description_s", role.getDescription());
            // Add summary field to allow searching documents for objects of this type
            sid.addField("role_solrsummary_t", new StringBuilder().append(role.getName()).append(" ").append(role.getDescription()));
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
    public static void Role.deleteIndex(Role role) {
        SolrServer solrServer = solrServer();
        try {
            solrServer.deleteById("role_" + role.getId());
            solrServer.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @PostUpdate
    @PostPersist
    private void Role.postPersistOrUpdate() {
        indexRole(this);
    }
    
    @PreRemove
    private void Role.preRemove() {
        deleteIndex(this);
    }
    
    public static SolrServer Role.solrServer() {
        SolrServer _solrServer = new Role().solrServer;
        if (_solrServer == null) throw new IllegalStateException("Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return _solrServer;
    }
    
}

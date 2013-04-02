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
import ro.roda.domain.Users;

privileged aspect Users_Roo_SolrSearch {
    
    @Autowired
    transient SolrServer Users.solrServer;
    
    public static QueryResponse Users.search(String queryString) {
        String searchString = "Users_solrsummary_t:" + queryString;
        return search(new SolrQuery(searchString.toLowerCase()));
    }
    
    public static QueryResponse Users.search(SolrQuery query) {
        try {
            return solrServer().query(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new QueryResponse();
    }
    
    public static void Users.indexUsers(Users users) {
        List<Users> userses = new ArrayList<Users>();
        userses.add(users);
        indexUserses(userses);
    }
    
    @Async
    public static void Users.indexUserses(Collection<Users> userses) {
        List<SolrInputDocument> documents = new ArrayList<SolrInputDocument>();
        for (Users users : userses) {
            SolrInputDocument sid = new SolrInputDocument();
            sid.addField("id", "users_" + users.getId());
            sid.addField("users.authdata_t", users.getAuthData());
            sid.addField("users.userprofile_t", users.getUserProfile());
            sid.addField("users.username_s", users.getUsername());
            sid.addField("users.password_s", users.getPassword());
            sid.addField("users.id_i", users.getId());
            // Add summary field to allow searching documents for objects of this type
            sid.addField("users_solrsummary_t", new StringBuilder().append(users.getAuthData()).append(" ").append(users.getUserProfile()).append(" ").append(users.getUsername()).append(" ").append(users.getPassword()).append(" ").append(users.getId()));
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
    public static void Users.deleteIndex(Users users) {
        SolrServer solrServer = solrServer();
        try {
            solrServer.deleteById("users_" + users.getId());
            solrServer.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @PostUpdate
    @PostPersist
    private void Users.postPersistOrUpdate() {
        indexUsers(this);
    }
    
    @PreRemove
    private void Users.preRemove() {
        deleteIndex(this);
    }
    
    public static SolrServer Users.solrServer() {
        SolrServer _solrServer = new Users().solrServer;
        if (_solrServer == null) throw new IllegalStateException("Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return _solrServer;
    }
    
}
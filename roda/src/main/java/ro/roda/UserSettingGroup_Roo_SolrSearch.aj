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
import ro.roda.UserSettingGroup;

privileged aspect UserSettingGroup_Roo_SolrSearch {
    
    @Autowired
    transient SolrServer UserSettingGroup.solrServer;
    
    public static QueryResponse UserSettingGroup.search(String queryString) {
        String searchString = "UserSettingGroup_solrsummary_t:" + queryString;
        return search(new SolrQuery(searchString.toLowerCase()));
    }
    
    public static QueryResponse UserSettingGroup.search(SolrQuery query) {
        try {
            return solrServer().query(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new QueryResponse();
    }
    
    public static void UserSettingGroup.indexUserSettingGroup(UserSettingGroup userSettingGroup) {
        List<UserSettingGroup> usersettinggroups = new ArrayList<UserSettingGroup>();
        usersettinggroups.add(userSettingGroup);
        indexUserSettingGroups(usersettinggroups);
    }
    
    @Async
    public static void UserSettingGroup.indexUserSettingGroups(Collection<UserSettingGroup> usersettinggroups) {
        List<SolrInputDocument> documents = new ArrayList<SolrInputDocument>();
        for (UserSettingGroup userSettingGroup : usersettinggroups) {
            SolrInputDocument sid = new SolrInputDocument();
            sid.addField("id", "usersettinggroup_" + userSettingGroup.getId());
            sid.addField("userSettingGroup.name_s", userSettingGroup.getName());
            sid.addField("userSettingGroup.description_s", userSettingGroup.getDescription());
            sid.addField("userSettingGroup.id_i", userSettingGroup.getId());
            // Add summary field to allow searching documents for objects of this type
            sid.addField("usersettinggroup_solrsummary_t", new StringBuilder().append(userSettingGroup.getName()).append(" ").append(userSettingGroup.getDescription()).append(" ").append(userSettingGroup.getId()));
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
    public static void UserSettingGroup.deleteIndex(UserSettingGroup userSettingGroup) {
        SolrServer solrServer = solrServer();
        try {
            solrServer.deleteById("usersettinggroup_" + userSettingGroup.getId());
            solrServer.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @PostUpdate
    @PostPersist
    private void UserSettingGroup.postPersistOrUpdate() {
        indexUserSettingGroup(this);
    }
    
    @PreRemove
    private void UserSettingGroup.preRemove() {
        deleteIndex(this);
    }
    
    public static SolrServer UserSettingGroup.solrServer() {
        SolrServer _solrServer = new UserSettingGroup().solrServer;
        if (_solrServer == null) throw new IllegalStateException("Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return _solrServer;
    }
    
}

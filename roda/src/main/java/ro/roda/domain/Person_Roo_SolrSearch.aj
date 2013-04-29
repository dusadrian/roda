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
import ro.roda.domain.Person;

privileged aspect Person_Roo_SolrSearch {
    
    @Autowired
    transient SolrServer Person.solrServer;
    
    public static QueryResponse Person.search(String queryString) {
        String searchString = "Person_solrsummary_t:" + queryString;
        return search(new SolrQuery(searchString.toLowerCase()));
    }
    
    public static QueryResponse Person.search(SolrQuery query) {
        try {
            return solrServer().query(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new QueryResponse();
    }
    
    public static void Person.indexPerson(Person person) {
        List<Person> people = new ArrayList<Person>();
        people.add(person);
        indexPeople(people);
    }
    
    @Async
    public static void Person.indexPeople(Collection<Person> people) {
        List<SolrInputDocument> documents = new ArrayList<SolrInputDocument>();
        for (Person person : people) {
            SolrInputDocument sid = new SolrInputDocument();
            sid.addField("id", "person_" + person.getId());
            sid.addField("person.prefixid_t", person.getPrefixId());
            sid.addField("person.suffixid_t", person.getSuffixId());
            sid.addField("person.fname_s", person.getFname());
            sid.addField("person.mname_s", person.getMname());
            sid.addField("person.lname_s", person.getLname());
            // Add summary field to allow searching documents for objects of this type
            sid.addField("person_solrsummary_t", new StringBuilder().append(person.getPrefixId()).append(" ").append(person.getSuffixId()).append(" ").append(person.getFname()).append(" ").append(person.getMname()).append(" ").append(person.getLname()));
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
    public static void Person.deleteIndex(Person person) {
        SolrServer solrServer = solrServer();
        try {
            solrServer.deleteById("person_" + person.getId());
            solrServer.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @PostUpdate
    @PostPersist
    private void Person.postPersistOrUpdate() {
        indexPerson(this);
    }
    
    @PreRemove
    private void Person.preRemove() {
        deleteIndex(this);
    }
    
    public static SolrServer Person.solrServer() {
        SolrServer _solrServer = new Person().solrServer;
        if (_solrServer == null) throw new IllegalStateException("Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return _solrServer;
    }
    
}

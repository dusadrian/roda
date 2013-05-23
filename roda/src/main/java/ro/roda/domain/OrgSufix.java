package ro.roda.domain;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PersistenceContext;
import javax.persistence.PostPersist;
import javax.persistence.PostUpdate;
import javax.persistence.PreRemove;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrInputDocument;
import org.hibernate.envers.Audited;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.solr.RooSolrSearchable;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.scheduling.annotation.Async;
import org.springframework.transaction.annotation.Transactional;

@Configurable
@Entity
@Table(schema = "public",name = "org_sufix")






public class OrgSufix {

	public String toString() {
        return ReflectionToStringBuilder.toString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }

	public String toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }

	public static OrgSufix fromJsonToOrgSufix(String json) {
        return new JSONDeserializer<OrgSufix>().use(null, OrgSufix.class).deserialize(json);
    }

	public static String toJsonArray(Collection<OrgSufix> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }

	public static Collection<OrgSufix> fromJsonArrayToOrgSufixes(String json) {
        return new JSONDeserializer<List<OrgSufix>>().use(null, ArrayList.class).use("values", OrgSufix.class).deserialize(json);
    }

	@PersistenceContext
    transient EntityManager entityManager;

	public static final EntityManager entityManager() {
        EntityManager em = new OrgSufix().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }

	public static long countOrgSufixes() {
        return entityManager().createQuery("SELECT COUNT(o) FROM OrgSufix o", Long.class).getSingleResult();
    }

	public static List<OrgSufix> findAllOrgSufixes() {
        return entityManager().createQuery("SELECT o FROM OrgSufix o", OrgSufix.class).getResultList();
    }

	public static OrgSufix findOrgSufix(Integer id) {
        if (id == null) return null;
        return entityManager().find(OrgSufix.class, id);
    }

	public static List<OrgSufix> findOrgSufixEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM OrgSufix o", OrgSufix.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }

	@Transactional
    public void persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }

	@Transactional
    public void remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            OrgSufix attached = OrgSufix.findOrgSufix(this.id);
            this.entityManager.remove(attached);
        }
    }

	@Transactional
    public void flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }

	@Transactional
    public void clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }

	@Transactional
    public OrgSufix merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        OrgSufix merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }

	@OneToMany(mappedBy = "orgSufixId")
    private Set<Org> orgs;

	@Column(name = "name", columnDefinition = "varchar", length = 100)
    @NotNull
    private String name;

	@Column(name = "description", columnDefinition = "text")
    private String description;

	public Set<Org> getOrgs() {
        return orgs;
    }

	public void setOrgs(Set<Org> orgs) {
        this.orgs = orgs;
    }

	public String getName() {
        return name;
    }

	public void setName(String name) {
        this.name = name;
    }

	public String getDescription() {
        return description;
    }

	public void setDescription(String description) {
        this.description = description;
    }

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", columnDefinition = "serial")
    private Integer id;

	public Integer getId() {
        return this.id;
    }

	public void setId(Integer id) {
        this.id = id;
    }

	@Autowired
    transient SolrServer solrServer;

	public static QueryResponse search(String queryString) {
        String searchString = "OrgSufix_solrsummary_t:" + queryString;
        return search(new SolrQuery(searchString.toLowerCase()));
    }

	public static QueryResponse search(SolrQuery query) {
        try {
            return solrServer().query(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new QueryResponse();
    }

	public static void indexOrgSufix(OrgSufix orgSufix) {
        List<OrgSufix> orgsufixes = new ArrayList<OrgSufix>();
        orgsufixes.add(orgSufix);
        indexOrgSufixes(orgsufixes);
    }

	@Async
    public static void indexOrgSufixes(Collection<OrgSufix> orgsufixes) {
        List<SolrInputDocument> documents = new ArrayList<SolrInputDocument>();
        for (OrgSufix orgSufix : orgsufixes) {
            SolrInputDocument sid = new SolrInputDocument();
            sid.addField("id", "orgsufix_" + orgSufix.getId());
            sid.addField("orgSufix.name_s", orgSufix.getName());
            sid.addField("orgSufix.description_s", orgSufix.getDescription());
            sid.addField("orgSufix.id_i", orgSufix.getId());
            // Add summary field to allow searching documents for objects of this type
            sid.addField("orgsufix_solrsummary_t", new StringBuilder().append(orgSufix.getName()).append(" ").append(orgSufix.getDescription()).append(" ").append(orgSufix.getId()));
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
    public static void deleteIndex(OrgSufix orgSufix) {
        SolrServer solrServer = solrServer();
        try {
            solrServer.deleteById("orgsufix_" + orgSufix.getId());
            solrServer.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

	@PostUpdate
    @PostPersist
    private void postPersistOrUpdate() {
        indexOrgSufix(this);
    }

	@PreRemove
    private void preRemove() {
        deleteIndex(this);
    }

	public static SolrServer solrServer() {
        SolrServer _solrServer = new OrgSufix().solrServer;
        if (_solrServer == null) throw new IllegalStateException("Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return _solrServer;
    }
}

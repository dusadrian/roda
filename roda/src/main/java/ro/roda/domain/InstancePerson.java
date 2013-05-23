package ro.roda.domain;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PersistenceContext;
import javax.persistence.PostPersist;
import javax.persistence.PostUpdate;
import javax.persistence.PreRemove;
import javax.persistence.Table;
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

@Entity
@Table(schema = "public", name = "instance_person")
@Configurable
public class InstancePerson {

	@PersistenceContext
	transient EntityManager entityManager;

	public static final EntityManager entityManager() {
		EntityManager em = new InstancePerson().entityManager;
		if (em == null)
			throw new IllegalStateException(
					"Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
		return em;
	}

	public static long countInstancepeople() {
		return entityManager().createQuery("SELECT COUNT(o) FROM InstancePerson o", Long.class).getSingleResult();
	}

	public static List<InstancePerson> findAllInstancepeople() {
		return entityManager().createQuery("SELECT o FROM InstancePerson o", InstancePerson.class).getResultList();
	}

	public static InstancePerson findInstancePerson(InstancePersonPK id) {
		if (id == null)
			return null;
		return entityManager().find(InstancePerson.class, id);
	}

	public static List<InstancePerson> findInstancePersonEntries(int firstResult, int maxResults) {
		return entityManager().createQuery("SELECT o FROM InstancePerson o", InstancePerson.class)
				.setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
	}

	@Transactional
	public void persist() {
		if (this.entityManager == null)
			this.entityManager = entityManager();
		this.entityManager.persist(this);
	}

	@Transactional
	public void remove() {
		if (this.entityManager == null)
			this.entityManager = entityManager();
		if (this.entityManager.contains(this)) {
			this.entityManager.remove(this);
		} else {
			InstancePerson attached = InstancePerson.findInstancePerson(this.id);
			this.entityManager.remove(attached);
		}
	}

	@Transactional
	public void flush() {
		if (this.entityManager == null)
			this.entityManager = entityManager();
		this.entityManager.flush();
	}

	@Transactional
	public void clear() {
		if (this.entityManager == null)
			this.entityManager = entityManager();
		this.entityManager.clear();
	}

	@Transactional
	public InstancePerson merge() {
		if (this.entityManager == null)
			this.entityManager = entityManager();
		InstancePerson merged = this.entityManager.merge(this);
		this.entityManager.flush();
		return merged;
	}

	public String toString() {
		return ReflectionToStringBuilder.toString(this, ToStringStyle.SHORT_PREFIX_STYLE);
	}

	@EmbeddedId
	private InstancePersonPK id;

	public InstancePersonPK getId() {
		return this.id;
	}

	public void setId(InstancePersonPK id) {
		this.id = id;
	}

	@Autowired
	transient SolrServer solrServer;

	public static QueryResponse search(String queryString) {
		String searchString = "InstancePerson_solrsummary_t:" + queryString;
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

	public static void indexInstancePerson(InstancePerson instancePerson) {
		List<InstancePerson> instancepeople = new ArrayList<InstancePerson>();
		instancepeople.add(instancePerson);
		indexInstancepeople(instancepeople);
	}

	@Async
	public static void indexInstancepeople(Collection<InstancePerson> instancepeople) {
		List<SolrInputDocument> documents = new ArrayList<SolrInputDocument>();
		for (InstancePerson instancePerson : instancepeople) {
			SolrInputDocument sid = new SolrInputDocument();
			sid.addField("id", "instanceperson_" + instancePerson.getId());
			sid.addField("instancePerson.instanceid_t", instancePerson.getInstanceId());
			sid.addField("instancePerson.assoctypeid_t", instancePerson.getAssocTypeId());
			sid.addField("instancePerson.personid_t", instancePerson.getPersonId());
			sid.addField("instancePerson.assocdetails_s", instancePerson.getAssocDetails());
			sid.addField("instancePerson.id_t", instancePerson.getId());
			// Add summary field to allow searching documents for objects of
			// this type
			sid.addField(
					"instanceperson_solrsummary_t",
					new StringBuilder().append(instancePerson.getInstanceId()).append(" ")
							.append(instancePerson.getAssocTypeId()).append(" ").append(instancePerson.getPersonId())
							.append(" ").append(instancePerson.getAssocDetails()).append(" ")
							.append(instancePerson.getId()));
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
	public static void deleteIndex(InstancePerson instancePerson) {
		SolrServer solrServer = solrServer();
		try {
			solrServer.deleteById("instanceperson_" + instancePerson.getId());
			solrServer.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@PostUpdate
	@PostPersist
	private void postPersistOrUpdate() {
		indexInstancePerson(this);
	}

	@PreRemove
	private void preRemove() {
		deleteIndex(this);
	}

	public static SolrServer solrServer() {
		SolrServer _solrServer = new InstancePerson().solrServer;
		if (_solrServer == null)
			throw new IllegalStateException(
					"Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
		return _solrServer;
	}

	public String toJson() {
		return new JSONSerializer().exclude("*.class").serialize(this);
	}

	public static InstancePerson fromJsonToInstancePerson(String json) {
		return new JSONDeserializer<InstancePerson>().use(null, InstancePerson.class).deserialize(json);
	}

	public static String toJsonArray(Collection<InstancePerson> collection) {
		return new JSONSerializer().exclude("*.class").serialize(collection);
	}

	public static Collection<InstancePerson> fromJsonArrayToInstancepeople(String json) {
		return new JSONDeserializer<List<InstancePerson>>().use(null, ArrayList.class)
				.use("values", InstancePerson.class).deserialize(json);
	}

	@ManyToOne
	@JoinColumn(name = "instance_id", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
	private Instance instanceId;

	@ManyToOne
	@JoinColumn(name = "assoc_type_id", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
	private InstancePersonAssoc assocTypeId;

	@ManyToOne
	@JoinColumn(name = "person_id", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
	private Person personId;

	@Column(name = "assoc_details", columnDefinition = "text")
	private String assocDetails;

	public Instance getInstanceId() {
		return instanceId;
	}

	public void setInstanceId(Instance instanceId) {
		this.instanceId = instanceId;
	}

	public InstancePersonAssoc getAssocTypeId() {
		return assocTypeId;
	}

	public void setAssocTypeId(InstancePersonAssoc assocTypeId) {
		this.assocTypeId = assocTypeId;
	}

	public Person getPersonId() {
		return personId;
	}

	public void setPersonId(Person personId) {
		this.personId = personId;
	}

	public String getAssocDetails() {
		return assocDetails;
	}

	public void setAssocDetails(String assocDetails) {
		this.assocDetails = assocDetails;
	}
}

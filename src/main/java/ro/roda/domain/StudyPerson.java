package ro.roda.domain;

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
import org.hibernate.envers.AuditReader;
import org.hibernate.envers.AuditReaderFactory;
import org.hibernate.envers.Audited;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.scheduling.annotation.Async;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.annotation.JsonIgnore;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;

@Configurable
@Entity
@Table(schema = "public", name = "study_person")
@Audited
public class StudyPerson {

	public static long countStudypeople() {
		return entityManager().createQuery("SELECT COUNT(o) FROM StudyPerson o", Long.class).getSingleResult();
	}

	@Async
	public static void deleteIndex(StudyPerson studyPerson) {
		SolrServer solrServer = solrServer();
		try {
			solrServer.deleteById("studyperson_" + studyPerson.getId());
			solrServer.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static final EntityManager entityManager() {
		EntityManager em = new StudyPerson().entityManager;
		if (em == null)
			throw new IllegalStateException(
					"Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
		return em;
	}

	public static List<StudyPerson> findAllStudypeople() {
		return entityManager().createQuery("SELECT o FROM StudyPerson o", StudyPerson.class).getResultList();
	}

	public static StudyPerson findStudyPerson(StudyPersonPK id) {
		if (id == null)
			return null;
		return entityManager().find(StudyPerson.class, id);
	}

	public static List<StudyPerson> findStudyPersonEntries(int firstResult, int maxResults) {
		return entityManager().createQuery("SELECT o FROM StudyPerson o", StudyPerson.class)
				.setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
	}

	public static Collection<StudyPerson> fromJsonArrayToStudypeople(String json) {
		return new JSONDeserializer<List<StudyPerson>>().use(null, ArrayList.class).use("values", StudyPerson.class)
				.deserialize(json);
	}

	public static StudyPerson fromJsonToStudyPerson(String json) {
		return new JSONDeserializer<StudyPerson>().use(null, StudyPerson.class).deserialize(json);
	}

	@Async
	public static void indexStudypeople(Collection<StudyPerson> studypeople) {
		List<SolrInputDocument> documents = new ArrayList<SolrInputDocument>();
		for (StudyPerson studyPerson : studypeople) {
			SolrInputDocument sid = new SolrInputDocument();
			sid.addField("id", "studyperson_" + studyPerson.getId());
			sid.addField("studyPerson.personid_t", studyPerson.getPersonId());
			sid.addField("studyPerson.studyid_t", studyPerson.getStudyId());
			sid.addField("studyPerson.assoctypeid_t", studyPerson.getAssoctypeId());
			sid.addField("studyPerson.assocdetails_s", studyPerson.getAssocDetails());
			sid.addField("studyPerson.id_t", studyPerson.getId());
			// Add summary field to allow searching documents for objects of
			// this type
			sid.addField("studyperson_solrsummary_t", new StringBuilder().append(studyPerson.getPersonId()).append(" ")
					.append(studyPerson.getStudyId()).append(" ").append(studyPerson.getAssoctypeId()).append(" ")
					.append(studyPerson.getAssocDetails()).append(" ").append(studyPerson.getId()));
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

	public static void indexStudyPerson(StudyPerson studyPerson) {
		List<StudyPerson> studypeople = new ArrayList<StudyPerson>();
		studypeople.add(studyPerson);
		indexStudypeople(studypeople);
	}

	public static QueryResponse search(SolrQuery query) {
		try {
			return solrServer().query(query);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new QueryResponse();
	}

	public static QueryResponse search(String queryString) {
		String searchString = "StudyPerson_solrsummary_t:" + queryString;
		return search(new SolrQuery(searchString.toLowerCase()));
	}

	public static SolrServer solrServer() {
		SolrServer _solrServer = new StudyPerson().solrServer;
		if (_solrServer == null)
			throw new IllegalStateException(
					"Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
		return _solrServer;
	}

	public static String toJsonArray(Collection<StudyPerson> collection) {
		return new JSONSerializer().exclude("*.class").exclude("classAuditReader", "auditReader").serialize(collection);
	}

	public static AuditReader getClassAuditReader() {
		return AuditReaderFactory.get(entityManager());
	}

	@Column(name = "assoc_details", columnDefinition = "text")
	private String assocDetails;

	@ManyToOne
	@JoinColumn(name = "assoctype_id", columnDefinition = "integer", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
	private StudyPersonAssoc assoctypeId;

	@EmbeddedId
	private StudyPersonPK id;

	@ManyToOne
	@JoinColumn(name = "person_id", columnDefinition = "integer", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
	private Person personId;

	@ManyToOne
	@JoinColumn(name = "study_id", columnDefinition = "integer", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
	private Study studyId;

	@PersistenceContext
	transient EntityManager entityManager;

	@Autowired(required = false)
	transient SolrServer solrServer;

	@Transactional
	public void clear() {
		if (this.entityManager == null)
			this.entityManager = entityManager();
		this.entityManager.clear();
	}

	@Transactional
	public void flush() {
		if (this.entityManager == null)
			this.entityManager = entityManager();
		this.entityManager.flush();
	}

	public String getAssocDetails() {
		return assocDetails;
	}

	public StudyPersonAssoc getAssoctypeId() {
		return assoctypeId;
	}

	public StudyPersonPK getId() {
		return this.id;
	}

	public Person getPersonId() {
		return personId;
	}

	public Study getStudyId() {
		return studyId;
	}

	@Transactional
	public StudyPerson merge() {
		if (this.entityManager == null)
			this.entityManager = entityManager();
		StudyPerson merged = this.entityManager.merge(this);
		this.entityManager.flush();
		return merged;
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
			StudyPerson attached = StudyPerson.findStudyPerson(this.id);
			this.entityManager.remove(attached);
		}
	}

	public void setAssocDetails(String assocDetails) {
		this.assocDetails = assocDetails;
	}

	public void setAssoctypeId(StudyPersonAssoc assoctypeId) {
		this.assoctypeId = assoctypeId;
	}

	public void setId(StudyPersonPK id) {
		this.id = id;
	}

	public void setPersonId(Person personId) {
		this.personId = personId;
	}

	public void setStudyId(Study studyId) {
		this.studyId = studyId;
	}

	public String toJson() {
		return new JSONSerializer().exclude("*.class").exclude("classAuditReader", "auditReader").serialize(this);
	}

	public String toString() {
		return ReflectionToStringBuilder.toString(this, ToStringStyle.SHORT_PREFIX_STYLE);
	}

	@JsonIgnore
	public AuditReader getAuditReader() {
		return AuditReaderFactory.get(entityManager);
	}

	@PostUpdate
	@PostPersist
	private void postPersistOrUpdate() {
		// indexStudyPerson(this);
	}

	@PreRemove
	private void preRemove() {
		// deleteIndex(this);
	}
}

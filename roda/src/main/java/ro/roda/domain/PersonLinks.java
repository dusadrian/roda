package ro.roda.domain;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PersistenceContext;
import javax.persistence.PostPersist;
import javax.persistence.PostUpdate;
import javax.persistence.PreRemove;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
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
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.scheduling.annotation.Async;
import org.springframework.transaction.annotation.Transactional;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;

@Configurable
@Entity
@Table(schema = "public", name = "person_links")
@Audited
public class PersonLinks {

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

	@ManyToOne
	@JoinColumn(name = "person_id", referencedColumnName = "id", nullable = false)
	private Person personId;

	@ManyToOne
	@JoinColumn(name = "user_id", referencedColumnName = "id", nullable = false)
	private Users userId;

	@ManyToOne
	@JoinColumn(name = "status_by", referencedColumnName = "id", nullable = false)
	private Users statusBy;

	@Column(name = "simscore", columnDefinition = "numeric", precision = 10, scale = 2)
	@NotNull
	private BigDecimal simscore;

	@Column(name = "namescore", columnDefinition = "numeric", precision = 10, scale = 2)
	@NotNull
	private BigDecimal namescore;

	@Column(name = "emailscore", columnDefinition = "numeric", precision = 10, scale = 2)
	@NotNull
	private BigDecimal emailscore;

	@Column(name = "status", columnDefinition = "int4")
	@NotNull
	private Integer status;

	@Column(name = "status_time", columnDefinition = "timestamp")
	@NotNull
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM")
	private Calendar statusTime;

	public Person getPersonId() {
		return personId;
	}

	public void setPersonId(Person personId) {
		this.personId = personId;
	}

	public Users getUserId() {
		return userId;
	}

	public void setUserId(Users userId) {
		this.userId = userId;
	}

	public Users getStatusBy() {
		return statusBy;
	}

	public void setStatusBy(Users statusBy) {
		this.statusBy = statusBy;
	}

	public BigDecimal getSimscore() {
		return simscore;
	}

	public void setSimscore(BigDecimal simscore) {
		this.simscore = simscore;
	}

	public BigDecimal getNamescore() {
		return namescore;
	}

	public void setNamescore(BigDecimal namescore) {
		this.namescore = namescore;
	}

	public BigDecimal getEmailscore() {
		return emailscore;
	}

	public void setEmailscore(BigDecimal emailscore) {
		this.emailscore = emailscore;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Calendar getStatusTime() {
		return statusTime;
	}

	public void setStatusTime(Calendar statusTime) {
		this.statusTime = statusTime;
	}

	public String toJson() {
		return new JSONSerializer().exclude("*.class").serialize(this);
	}

	public static PersonLinks fromJsonToPersonLinks(String json) {
		return new JSONDeserializer<PersonLinks>().use(null, PersonLinks.class).deserialize(json);
	}

	public static String toJsonArray(Collection<PersonLinks> collection) {
		return new JSONSerializer().exclude("*.class").serialize(collection);
	}

	public static Collection<PersonLinks> fromJsonArrayToPersonLinkses(String json) {
		return new JSONDeserializer<List<PersonLinks>>().use(null, ArrayList.class).use("values", PersonLinks.class)
				.deserialize(json);
	}

	@Autowired
	transient SolrServer solrServer;

	public static QueryResponse search(String queryString) {
		String searchString = "PersonLinks_solrsummary_t:" + queryString;
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

	public static void indexPersonLinks(PersonLinks personLinks) {
		List<PersonLinks> personlinkses = new ArrayList<PersonLinks>();
		personlinkses.add(personLinks);
		indexPersonLinkses(personlinkses);
	}

	@Async
	public static void indexPersonLinkses(Collection<PersonLinks> personlinkses) {
		List<SolrInputDocument> documents = new ArrayList<SolrInputDocument>();
		for (PersonLinks personLinks : personlinkses) {
			SolrInputDocument sid = new SolrInputDocument();
			sid.addField("id", "personlinks_" + personLinks.getId());
			sid.addField("personLinks.personid_t", personLinks.getPersonId());
			sid.addField("personLinks.userid_t", personLinks.getUserId());
			sid.addField("personLinks.statusby_t", personLinks.getStatusBy());
			sid.addField("personLinks.simscore_t", personLinks.getSimscore());
			sid.addField("personLinks.namescore_t", personLinks.getNamescore());
			sid.addField("personLinks.emailscore_t", personLinks.getEmailscore());
			sid.addField("personLinks.status_i", personLinks.getStatus());
			sid.addField("personLinks.statustime_dt", personLinks.getStatusTime().getTime());
			sid.addField("personLinks.id_i", personLinks.getId());
			// Add summary field to allow searching documents for objects of
			// this type
			sid.addField(
					"personlinks_solrsummary_t",
					new StringBuilder().append(personLinks.getPersonId()).append(" ").append(personLinks.getUserId())
							.append(" ").append(personLinks.getStatusBy()).append(" ")
							.append(personLinks.getSimscore()).append(" ").append(personLinks.getNamescore())
							.append(" ").append(personLinks.getEmailscore()).append(" ")
							.append(personLinks.getStatus()).append(" ").append(personLinks.getStatusTime().getTime())
							.append(" ").append(personLinks.getId()));
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
	public static void deleteIndex(PersonLinks personLinks) {
		SolrServer solrServer = solrServer();
		try {
			solrServer.deleteById("personlinks_" + personLinks.getId());
			solrServer.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@PostUpdate
	@PostPersist
	private void postPersistOrUpdate() {
		indexPersonLinks(this);
	}

	@PreRemove
	private void preRemove() {
		deleteIndex(this);
	}

	public static SolrServer solrServer() {
		SolrServer _solrServer = new PersonLinks().solrServer;
		if (_solrServer == null)
			throw new IllegalStateException(
					"Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
		return _solrServer;
	}

	public String toString() {
		return ReflectionToStringBuilder.toString(this, ToStringStyle.SHORT_PREFIX_STYLE);
	}

	@PersistenceContext
	transient EntityManager entityManager;

	public static final EntityManager entityManager() {
		EntityManager em = new PersonLinks().entityManager;
		if (em == null)
			throw new IllegalStateException(
					"Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
		return em;
	}

	public static long countPersonLinkses() {
		return entityManager().createQuery("SELECT COUNT(o) FROM PersonLinks o", Long.class).getSingleResult();
	}

	public static List<PersonLinks> findAllPersonLinkses() {
		return entityManager().createQuery("SELECT o FROM PersonLinks o", PersonLinks.class).getResultList();
	}

	public static PersonLinks findPersonLinks(Integer id) {
		if (id == null)
			return null;
		return entityManager().find(PersonLinks.class, id);
	}

	public static List<PersonLinks> findPersonLinksEntries(int firstResult, int maxResults) {
		return entityManager().createQuery("SELECT o FROM PersonLinks o", PersonLinks.class)
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
			PersonLinks attached = PersonLinks.findPersonLinks(this.id);
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
	public PersonLinks merge() {
		if (this.entityManager == null)
			this.entityManager = entityManager();
		PersonLinks merged = this.entityManager.merge(this);
		this.entityManager.flush();
		return merged;
	}
}

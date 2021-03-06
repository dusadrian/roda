package ro.roda.domain;

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
import javax.persistence.ManyToMany;
import javax.persistence.PersistenceContext;
import javax.persistence.PostPersist;
import javax.persistence.PostUpdate;
import javax.persistence.PreRemove;
import javax.persistence.Table;
import javax.persistence.TypedQuery;
import javax.validation.constraints.NotNull;

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
@Table(schema = "public", name = "email")
@Audited
public class Email {

	public static long countEmails() {
		return entityManager().createQuery("SELECT COUNT(o) FROM Email o", Long.class).getSingleResult();
	}

	@Async
	public static void deleteIndex(Email email) {
		SolrServer solrServer = solrServer();
		try {
			solrServer.deleteById("email_" + email.getId());
			solrServer.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static final EntityManager entityManager() {
		EntityManager em = new Email().entityManager;
		if (em == null)
			throw new IllegalStateException(
					"Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
		return em;
	}

	public static List<Email> findAllEmails() {
		return entityManager().createQuery("SELECT o FROM Email o", Email.class).getResultList();
	}

	public static Email findEmail(Integer id) {
		if (id == null)
			return null;
		return entityManager().find(Email.class, id);
	}

	public static List<Email> findEmailEntries(int firstResult, int maxResults) {
		return entityManager().createQuery("SELECT o FROM Email o", Email.class).setFirstResult(firstResult)
				.setMaxResults(maxResults).getResultList();
	}

	public static Collection<Email> fromJsonArrayToEmails(String json) {
		return new JSONDeserializer<List<Email>>().use(null, ArrayList.class).use("values", Email.class)
				.deserialize(json);
	}

	public static Email fromJsonToEmail(String json) {
		return new JSONDeserializer<Email>().use(null, Email.class).deserialize(json);
	}

	public static void indexEmail(Email email) {
		List<Email> emails = new ArrayList<Email>();
		emails.add(email);
		indexEmails(emails);
	}

	@Async
	public static void indexEmails(Collection<Email> emails) {
		List<SolrInputDocument> documents = new ArrayList<SolrInputDocument>();
		for (Email email : emails) {
			SolrInputDocument sid = new SolrInputDocument();
			sid.addField("id", "email_" + email.getId());
			sid.addField("email.email_s", email.getEmail());
			sid.addField("email.id_i", email.getId());
			// Add summary field to allow searching documents for objects of
			// this type
			sid.addField("email_solrsummary_t",
					new StringBuilder().append(email.getEmail()).append(" ").append(email.getId()));
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

	public static QueryResponse search(SolrQuery query) {
		try {
			return solrServer().query(query);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new QueryResponse();
	}

	public static QueryResponse search(String queryString) {
		String searchString = "Email_solrsummary_t:" + queryString;
		return search(new SolrQuery(searchString.toLowerCase()));
	}

	public static SolrServer solrServer() {
		SolrServer _solrServer = new Email().solrServer;
		if (_solrServer == null)
			throw new IllegalStateException(
					"Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
		return _solrServer;
	}

	public static String toJsonArray(Collection<Email> collection) {
		return new JSONSerializer().exclude("*.class").exclude("classAuditReader", "auditReader").serialize(collection);
	}

	/**
	 * Verifica existenta unui obiect de tip <code>Email</code> (cont de mail)
	 * in baza de date; in caz afirmativ il returneaza, altfel, metoda il
	 * introduce in baza de date si apoi il returneaza. Verificarea existentei
	 * in baza de date se realizeaza fie dupa identificator, fie dupa un
	 * criteriu de unicitate.
	 * 
	 * <p>
	 * Criterii de unicitate:
	 * <ul>
	 * <li>email
	 * </ul>
	 * 
	 * <p>
	 * 
	 * @param id
	 *            - identificatorul contului.
	 * @param email
	 *            - adresa contului.
	 * @return
	 */
	public static Email checkEmail(Integer id, String email) {
		Email object;

		if (id != null) {
			object = findEmail(id);

			if (object != null) {
				return object;
			}
		}

		List<Email> queryResult;

		if (email != null) {
			TypedQuery<Email> query = entityManager().createQuery(
					"SELECT o FROM Email o WHERE lower(o.email) = lower(:email)", Email.class);
			query.setParameter("email", email);

			queryResult = query.getResultList();
			if (queryResult.size() > 0) {
				return queryResult.get(0);
			}
		}

		object = new Email();
		object.email = email;
		object.persist();

		return object;
	}

	public static AuditReader getClassAuditReader() {
		return AuditReaderFactory.get(entityManager());
	}

	@Column(name = "email", columnDefinition = "varchar", length = 200)
	@NotNull
	private String email;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	// , columnDefinition = "serial")
	private Integer id;

	@ManyToMany(mappedBy = "emails")
	private Set<Org> orgs;

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

	public String getEmail() {
		return email;
	}

	public Integer getId() {
		return this.id;
	}

	public Set<Org> getOrgs() {
		return orgs;
	}

	@Transactional
	public Email merge() {
		if (this.entityManager == null)
			this.entityManager = entityManager();
		Email merged = this.entityManager.merge(this);
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
			Email attached = Email.findEmail(this.id);
			this.entityManager.remove(attached);
		}
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String toJson() {
		return new JSONSerializer().exclude("*.class").exclude("classAuditReader", "auditReader").serialize(this);
	}

	public String toString() {
		return ReflectionToStringBuilder.toString(this, ToStringStyle.SHORT_PREFIX_STYLE);
	}

	@PostUpdate
	@PostPersist
	private void postPersistOrUpdate() {
		indexEmail(this);
	}

	@PreRemove
	private void preRemove() {
		deleteIndex(this);
	}

	@Override
	public boolean equals(Object obj) {
		return (id != null && id.equals(((Email) obj).id))
				|| (email != null && email.equalsIgnoreCase(((Email) obj).email));
	}

	@JsonIgnore public AuditReader getAuditReader() {
		return AuditReaderFactory.get(entityManager);
	}
}

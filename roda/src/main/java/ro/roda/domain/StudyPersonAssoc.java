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
@Table(schema = "public", name = "study_person_assoc")
public class StudyPersonAssoc {

	@OneToMany(mappedBy = "assoctypeId")
	private Set<StudyPerson> studypeople;

	@Column(name = "asoc_name", columnDefinition = "text")
	@NotNull
	private String asocName;

	@Column(name = "asoc_description", columnDefinition = "text")
	private String asocDescription;

	public Set<StudyPerson> getStudypeople() {
		return studypeople;
	}

	public void setStudypeople(Set<StudyPerson> studypeople) {
		this.studypeople = studypeople;
	}

	public String getAsocName() {
		return asocName;
	}

	public void setAsocName(String asocName) {
		this.asocName = asocName;
	}

	public String getAsocDescription() {
		return asocDescription;
	}

	public void setAsocDescription(String asocDescription) {
		this.asocDescription = asocDescription;
	}

	@PersistenceContext
	transient EntityManager entityManager;

	public static final EntityManager entityManager() {
		EntityManager em = new StudyPersonAssoc().entityManager;
		if (em == null)
			throw new IllegalStateException(
					"Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
		return em;
	}

	public static long countStudyPersonAssocs() {
		return entityManager().createQuery("SELECT COUNT(o) FROM StudyPersonAssoc o", Long.class).getSingleResult();
	}

	public static List<StudyPersonAssoc> findAllStudyPersonAssocs() {
		return entityManager().createQuery("SELECT o FROM StudyPersonAssoc o", StudyPersonAssoc.class).getResultList();
	}

	public static StudyPersonAssoc findStudyPersonAssoc(Integer id) {
		if (id == null)
			return null;
		return entityManager().find(StudyPersonAssoc.class, id);
	}

	public static List<StudyPersonAssoc> findStudyPersonAssocEntries(int firstResult, int maxResults) {
		return entityManager().createQuery("SELECT o FROM StudyPersonAssoc o", StudyPersonAssoc.class)
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
			StudyPersonAssoc attached = StudyPersonAssoc.findStudyPersonAssoc(this.id);
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
	public StudyPersonAssoc merge() {
		if (this.entityManager == null)
			this.entityManager = entityManager();
		StudyPersonAssoc merged = this.entityManager.merge(this);
		this.entityManager.flush();
		return merged;
	}

	public String toString() {
		return ReflectionToStringBuilder.toString(this, ToStringStyle.SHORT_PREFIX_STYLE);
	}

	@Autowired
	transient SolrServer solrServer;

	public static QueryResponse search(String queryString) {
		String searchString = "StudyPersonAssoc_solrsummary_t:" + queryString;
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

	public static void indexStudyPersonAssoc(StudyPersonAssoc studyPersonAssoc) {
		List<StudyPersonAssoc> studypersonassocs = new ArrayList<StudyPersonAssoc>();
		studypersonassocs.add(studyPersonAssoc);
		indexStudyPersonAssocs(studypersonassocs);
	}

	@Async
	public static void indexStudyPersonAssocs(Collection<StudyPersonAssoc> studypersonassocs) {
		List<SolrInputDocument> documents = new ArrayList<SolrInputDocument>();
		for (StudyPersonAssoc studyPersonAssoc : studypersonassocs) {
			SolrInputDocument sid = new SolrInputDocument();
			sid.addField("id", "studypersonassoc_" + studyPersonAssoc.getId());
			sid.addField("studyPersonAssoc.asocname_s", studyPersonAssoc.getAsocName());
			sid.addField("studyPersonAssoc.asocdescription_s", studyPersonAssoc.getAsocDescription());
			// Add summary field to allow searching documents for objects of
			// this type
			sid.addField("studypersonassoc_solrsummary_t", new StringBuilder().append(studyPersonAssoc.getAsocName())
					.append(" ").append(studyPersonAssoc.getAsocDescription()));
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
	public static void deleteIndex(StudyPersonAssoc studyPersonAssoc) {
		SolrServer solrServer = solrServer();
		try {
			solrServer.deleteById("studypersonassoc_" + studyPersonAssoc.getId());
			solrServer.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@PostUpdate
	@PostPersist
	private void postPersistOrUpdate() {
		indexStudyPersonAssoc(this);
	}

	@PreRemove
	private void preRemove() {
		deleteIndex(this);
	}

	public static SolrServer solrServer() {
		SolrServer _solrServer = new StudyPersonAssoc().solrServer;
		if (_solrServer == null)
			throw new IllegalStateException(
					"Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
		return _solrServer;
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

	public String toJson() {
		return new JSONSerializer().exclude("*.class").serialize(this);
	}

	public static StudyPersonAssoc fromJsonToStudyPersonAssoc(String json) {
		return new JSONDeserializer<StudyPersonAssoc>().use(null, StudyPersonAssoc.class).deserialize(json);
	}

	public static String toJsonArray(Collection<StudyPersonAssoc> collection) {
		return new JSONSerializer().exclude("*.class").serialize(collection);
	}

	public static Collection<StudyPersonAssoc> fromJsonArrayToStudyPersonAssocs(String json) {
		return new JSONDeserializer<List<StudyPersonAssoc>>().use(null, ArrayList.class)
				.use("values", StudyPersonAssoc.class).deserialize(json);
	}
}

package ro.roda.domain;

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

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrInputDocument;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.scheduling.annotation.Async;
import org.springframework.transaction.annotation.Transactional;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;

@Entity
@Table(schema = "public", name = "sched_execution")
@Configurable
public class SchedExecution {

	public static long countExecutions() {
		return entityManager().createQuery("SELECT COUNT(o) FROM SchedExecution o", Long.class).getSingleResult();
	}

	@Async
	public static void deleteIndex(SchedExecution schedExecution) {
		SolrServer solrServer = solrServer();
		try {
			solrServer.deleteById("Execution_" + schedExecution.getId());
			solrServer.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static final EntityManager entityManager() {
		EntityManager em = new SchedExecution().entityManager;
		if (em == null)
			throw new IllegalStateException(
					"Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
		return em;
	}

	public static List<SchedExecution> findAllExecutions() {
		return entityManager().createQuery("SELECT o FROM SchedExecution o", SchedExecution.class).getResultList();
	}

	public static SchedExecution findExecution(Integer id) {
		if (id == null)
			return null;
		return entityManager().find(SchedExecution.class, id);
	}

	public static List<SchedExecution> findExecutionEntries(int firstResult, int maxResults) {
		return entityManager().createQuery("SELECT o FROM SchedExecution o", SchedExecution.class).setFirstResult(firstResult)
				.setMaxResults(maxResults).getResultList();
	}

	public static Collection<SchedExecution> fromJsonArrayToExecutions(String json) {
		return new JSONDeserializer<List<SchedExecution>>().use(null, ArrayList.class).use("values", SchedExecution.class)
				.deserialize(json);
	}

	public static SchedExecution fromJsonToExecution(String json) {
		return new JSONDeserializer<SchedExecution>().use(null, SchedExecution.class).deserialize(json);
	}

	public static void indexExecution(SchedExecution schedExecution) {
		List<SchedExecution> schedExecutions = new ArrayList<SchedExecution>();
		schedExecutions.add(schedExecution);
		indexExecutions(schedExecutions);
	}

	@Async
	public static void indexExecutions(Collection<SchedExecution> schedExecutions) {
		List<SolrInputDocument> documents = new ArrayList<SolrInputDocument>();
		for (SchedExecution schedExecution : schedExecutions) {
			SolrInputDocument sid = new SolrInputDocument();
			sid.addField("id", "Execution_" + schedExecution.getId());
			sid.addField("Execution.cmsfolderid_t", schedExecution.getTask());
			sid.addField("Execution.id_i", schedExecution.getId());
			// Add summary field to allow searching documents for objects of
			// this type
			/*
			 * sid.addField( "Execution_solrsummary_t", new
			 * StringBuilder().append
			 * (execution.getTask()).append(" ").append(execution.getFilename())
			 * .
			 * append(" ").append(execution.getLabel()).append(" ").append(execution
			 * .getFilesize()) .append(" ").append(execution.getId()));
			 */
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
		String searchString = "Execution_solrsummary_t:" + queryString;
		return search(new SolrQuery(searchString.toLowerCase()));
	}

	public static SolrServer solrServer() {
		SolrServer _solrServer = new SchedExecution().solrServer;
		if (_solrServer == null)
			throw new IllegalStateException(
					"Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
		return _solrServer;
	}

	public static String toJsonArray(Collection<SchedExecution> collection) {
		return new JSONSerializer().exclude("*.class").exclude("classAuditReader", "auditReader").serialize(collection);
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", columnDefinition = "serial")
	private Integer id;

	@ManyToOne
	@JoinColumn(name = "task_id", columnDefinition = "integer", referencedColumnName = "id", nullable = false)
	private SchedTask schedTask;

	@Column(name = "exec_type", columnDefinition = "text")
	@NotNull
	private String execType;

	@Column(name = "exec_started", columnDefinition = "timestamp")
	@NotNull
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM")
	private Calendar execStarted;

	@Column(name = "exec_result", columnDefinition = "int8")
	private Long result;

	// TODO longer varchar ?
	@Column(name = "stacktrace", columnDefinition = "varchar", length = 200)
	private String stacktrace;

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

	public SchedTask getTask() {
		return schedTask;
	}

	public Integer getId() {
		return this.id;
	}

	@Transactional
	public SchedExecution merge() {
		if (this.entityManager == null)
			this.entityManager = entityManager();
		SchedExecution merged = this.entityManager.merge(this);
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
			SchedExecution attached = SchedExecution.findExecution(this.id);
			this.entityManager.remove(attached);
		}
	}

	public void setCmsFolderId(SchedTask schedTask) {
		this.schedTask = schedTask;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getExecType() {
		return execType;
	}

	public void setExecType(String execType) {
		this.execType = execType;
	}

	public Calendar getExecStarted() {
		return execStarted;
	}

	public void setExecStarted(Calendar execStarted) {
		this.execStarted = execStarted;
	}

	public Long getResult() {
		return result;
	}

	public void setResult(Long result) {
		this.result = result;
	}

	public String getStacktrace() {
		return stacktrace;
	}

	public void setStacktrace(String stacktrace) {
		this.stacktrace = stacktrace;
	}

	public void setTask(SchedTask schedTask) {
		this.schedTask = schedTask;
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
		indexExecution(this);
	}

	@PreRemove
	private void preRemove() {
		deleteIndex(this);
	}

	@Override
	public boolean equals(Object obj) {
		if (obj instanceof SchedExecution) {
			final SchedExecution other = (SchedExecution) obj;
			return new EqualsBuilder().append(schedTask, other.schedTask).append(execType, other.execType)
					.append(execStarted, other.execStarted).append(result, other.result).isEquals();
		} else {
			return false;
		}
	}
}

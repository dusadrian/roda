package ro.roda.domain;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PersistenceContext;
import javax.persistence.PostPersist;
import javax.persistence.PostUpdate;
import javax.persistence.PreRemove;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Version;
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
@Table(schema = "public", name = "study")
@Audited
public class Study {

	@ManyToMany
	@JoinTable(name = "study_topic", joinColumns = { @JoinColumn(name = "study_id", nullable = false) }, inverseJoinColumns = { @JoinColumn(name = "topic_id", nullable = false) })
	private Set<Topic> topics;

	@ManyToMany(mappedBy = "studies")
	private Set<SamplingProcedure> samplingProcedures;

	@ManyToMany(mappedBy = "studies")
	private Set<CollectionModelType> collectionModelTypes;

	@ManyToMany(mappedBy = "studies")
	private Set<DataSourceType> dataSourceTypes;

	@ManyToMany(mappedBy = "studies1")
	private Set<File> files1;

	@ManyToMany(mappedBy = "studies")
	private Set<Source> sources;

	@OneToOne
	@JoinColumn(name = "id", nullable = false, insertable = false, updatable = false)
	private TimeMethType timeMethType;

	@OneToMany(mappedBy = "studyId")
	private Set<CatalogStudy> catalogStudies;

	@OneToMany(mappedBy = "studyId")
	private Set<Instance> instances;

	@OneToMany(mappedBy = "studyId")
	private Set<StudyDescr> studyDescrs;

	@OneToMany(mappedBy = "studyId")
	private Set<StudyKeyword> studyKeywords;

	@OneToMany(mappedBy = "studyId")
	private Set<StudyOrg> studyOrgs;

	@OneToMany(mappedBy = "studyId")
	private Set<StudyPerson> studypeople;

	@ManyToOne
	@JoinColumn(name = "unit_analysis_id", referencedColumnName = "id", nullable = false)
	private UnitAnalysis unitAnalysisId;

	@ManyToOne
	@JoinColumn(name = "added_by", referencedColumnName = "id", nullable = false)
	private Users addedBy;

	@Column(name = "date_start", columnDefinition = "date")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(style = "M-")
	private Date dateStart;

	@Column(name = "date_end", columnDefinition = "date")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(style = "M-")
	private Date dateEnd;

	@Column(name = "insertion_status", columnDefinition = "int4")
	@NotNull
	private Integer insertionStatus;

	@Column(name = "added", columnDefinition = "timestamp")
	@NotNull
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM")
	private Calendar added;

	@Column(name = "digitizable", columnDefinition = "bool")
	@NotNull
	private boolean digitizable;

	@Column(name = "anonymous_usage", columnDefinition = "bool")
	@NotNull
	private boolean anonymousUsage;

	@Column(name = "raw_data", columnDefinition = "bool")
	@NotNull
	private boolean rawData;

	@Column(name = "raw_metadata", columnDefinition = "bool")
	@NotNull
	private boolean rawMetadata;

	@Column(name = "time_meth_id", columnDefinition = "int4")
	@NotNull
	private Integer timeMethId;

	public Set<Topic> getTopics() {
		return topics;
	}

	public void setTopics(Set<Topic> topics) {
		this.topics = topics;
	}

	public Set<SamplingProcedure> getSamplingProcedures() {
		return samplingProcedures;
	}

	public void setSamplingProcedures(Set<SamplingProcedure> samplingProcedures) {
		this.samplingProcedures = samplingProcedures;
	}

	public Set<CollectionModelType> getCollectionModelTypes() {
		return collectionModelTypes;
	}

	public void setCollectionModelTypes(Set<CollectionModelType> collectionModelTypes) {
		this.collectionModelTypes = collectionModelTypes;
	}

	public Set<DataSourceType> getDataSourceTypes() {
		return dataSourceTypes;
	}

	public void setDataSourceTypes(Set<DataSourceType> dataSourceTypes) {
		this.dataSourceTypes = dataSourceTypes;
	}

	public Set<File> getFiles1() {
		return files1;
	}

	public void setFiles1(Set<File> files1) {
		this.files1 = files1;
	}

	public Set<Source> getSources() {
		return sources;
	}

	public void setSources(Set<Source> sources) {
		this.sources = sources;
	}

	public TimeMethType getTimeMethType() {
		return timeMethType;
	}

	public void setTimeMethType(TimeMethType timeMethType) {
		this.timeMethType = timeMethType;
	}

	public Set<CatalogStudy> getCatalogStudies() {
		return catalogStudies;
	}

	public void setCatalogStudies(Set<CatalogStudy> catalogStudies) {
		this.catalogStudies = catalogStudies;
	}

	public Set<Instance> getInstances() {
		return instances;
	}

	public void setInstances(Set<Instance> instances) {
		this.instances = instances;
	}

	public Set<StudyDescr> getStudyDescrs() {
		return studyDescrs;
	}

	public void setStudyDescrs(Set<StudyDescr> studyDescrs) {
		this.studyDescrs = studyDescrs;
	}

	public Set<StudyKeyword> getStudyKeywords() {
		return studyKeywords;
	}

	public void setStudyKeywords(Set<StudyKeyword> studyKeywords) {
		this.studyKeywords = studyKeywords;
	}

	public Set<StudyOrg> getStudyOrgs() {
		return studyOrgs;
	}

	public void setStudyOrgs(Set<StudyOrg> studyOrgs) {
		this.studyOrgs = studyOrgs;
	}

	public Set<StudyPerson> getStudypeople() {
		return studypeople;
	}

	public void setStudypeople(Set<StudyPerson> studypeople) {
		this.studypeople = studypeople;
	}

	public UnitAnalysis getUnitAnalysisId() {
		return unitAnalysisId;
	}

	public void setUnitAnalysisId(UnitAnalysis unitAnalysisId) {
		this.unitAnalysisId = unitAnalysisId;
	}

	public Users getAddedBy() {
		return addedBy;
	}

	public void setAddedBy(Users addedBy) {
		this.addedBy = addedBy;
	}

	public Date getDateStart() {
		return dateStart;
	}

	public void setDateStart(Date dateStart) {
		this.dateStart = dateStart;
	}

	public Date getDateEnd() {
		return dateEnd;
	}

	public void setDateEnd(Date dateEnd) {
		this.dateEnd = dateEnd;
	}

	public Integer getInsertionStatus() {
		return insertionStatus;
	}

	public void setInsertionStatus(Integer insertionStatus) {
		this.insertionStatus = insertionStatus;
	}

	public Calendar getAdded() {
		return added;
	}

	public void setAdded(Calendar added) {
		this.added = added;
	}

	public boolean isDigitizable() {
		return digitizable;
	}

	public void setDigitizable(boolean digitizable) {
		this.digitizable = digitizable;
	}

	public boolean isAnonymousUsage() {
		return anonymousUsage;
	}

	public void setAnonymousUsage(boolean anonymousUsage) {
		this.anonymousUsage = anonymousUsage;
	}

	public boolean isRawData() {
		return rawData;
	}

	public void setRawData(boolean rawData) {
		this.rawData = rawData;
	}

	public boolean isRawMetadata() {
		return rawMetadata;
	}

	public void setRawMetadata(boolean rawMetadata) {
		this.rawMetadata = rawMetadata;
	}

	public Integer getTimeMethId() {
		return timeMethId;
	}

	public void setTimeMethId(Integer timeMethId) {
		this.timeMethId = timeMethId;
	}

	@Autowired
	transient SolrServer solrServer;

	public static QueryResponse search(String queryString) {
		String searchString = "Study_solrsummary_t:" + queryString;
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

	public static void indexStudy(Study study) {
		List<Study> studys = new ArrayList<Study>();
		studys.add(study);
		indexStudys(studys);
	}

	@Async
	public static void indexStudys(Collection<Study> studys) {
		List<SolrInputDocument> documents = new ArrayList<SolrInputDocument>();
		for (Study study : studys) {
			SolrInputDocument sid = new SolrInputDocument();
			sid.addField("id", "study_" + study.getId());
			sid.addField("study.id_i", study.getId());
			// Add summary field to allow searching documents for objects of
			// this type
			sid.addField("study_solrsummary_t", new StringBuilder().append(study.getId()));
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
	public static void deleteIndex(Study study) {
		SolrServer solrServer = solrServer();
		try {
			solrServer.deleteById("study_" + study.getId());
			solrServer.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@PostUpdate
	@PostPersist
	private void postPersistOrUpdate() {
		indexStudy(this);
	}

	@PreRemove
	private void preRemove() {
		deleteIndex(this);
	}

	public static SolrServer solrServer() {
		SolrServer _solrServer = new Study().solrServer;
		if (_solrServer == null)
			throw new IllegalStateException(
					"Solr server has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
		return _solrServer;
	}

	@PersistenceContext
	transient EntityManager entityManager;

	public static final EntityManager entityManager() {
		EntityManager em = new Study().entityManager;
		if (em == null)
			throw new IllegalStateException(
					"Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
		return em;
	}

	public static long countStudys() {
		return entityManager().createQuery("SELECT COUNT(o) FROM Study o", Long.class).getSingleResult();
	}

	public static List<Study> findAllStudys() {
		return entityManager().createQuery("SELECT o FROM Study o", Study.class).getResultList();
	}

	public static Study findStudy(Integer id) {
		if (id == null)
			return null;
		return entityManager().find(Study.class, id);
	}

	public static List<Study> findStudyEntries(int firstResult, int maxResults) {
		return entityManager().createQuery("SELECT o FROM Study o", Study.class).setFirstResult(firstResult)
				.setMaxResults(maxResults).getResultList();
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
			Study attached = Study.findStudy(this.id);
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
	public Study merge() {
		if (this.entityManager == null)
			this.entityManager = entityManager();
		Study merged = this.entityManager.merge(this);
		this.entityManager.flush();
		return merged;
	}

	public String toJson() {
		return new JSONSerializer().exclude("*.class").serialize(this);
	}

	public static Study fromJsonToStudy(String json) {
		return new JSONDeserializer<Study>().use(null, Study.class).deserialize(json);
	}

	public static String toJsonArray(Collection<Study> collection) {
		return new JSONSerializer().exclude("*.class").serialize(collection);
	}

	public static Collection<Study> fromJsonArrayToStudys(String json) {
		return new JSONDeserializer<List<Study>>().use(null, ArrayList.class).use("values", Study.class)
				.deserialize(json);
	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id", columnDefinition = "serial")
	private Integer id;

	@Version
	@Column(name = "version")
	private Integer version;

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getVersion() {
		return this.version;
	}

	public void setVersion(Integer version) {
		this.version = version;
	}

	public String toString() {
		return new ReflectionToStringBuilder(this, ToStringStyle.SHORT_PREFIX_STYLE).setExcludeFieldNames(
				"timeMethType").toString();
	}
}

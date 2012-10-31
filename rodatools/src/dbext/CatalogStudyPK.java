package dbext;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the catalog_study database table.
 * 
 */
@Embeddable
public class CatalogStudyPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(name="study_id", unique=true, nullable=false)
	private Integer studyId;

	@Column(name="catalog_id", unique=true, nullable=false)
	private Integer catalogId;

    public CatalogStudyPK() {
    }
	public Integer getStudyId() {
		return this.studyId;
	}
	public void setStudyId(Integer studyId) {
		this.studyId = studyId;
	}
	public Integer getCatalogId() {
		return this.catalogId;
	}
	public void setCatalogId(Integer catalogId) {
		this.catalogId = catalogId;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof CatalogStudyPK)) {
			return false;
		}
		CatalogStudyPK castOther = (CatalogStudyPK)other;
		return 
			this.studyId.equals(castOther.studyId)
			&& this.catalogId.equals(castOther.catalogId);

    }
    
	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.studyId.hashCode();
		hash = hash * prime + this.catalogId.hashCode();
		
		return hash;
    }
}
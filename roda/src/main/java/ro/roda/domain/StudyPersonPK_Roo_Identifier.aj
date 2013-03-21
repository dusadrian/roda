// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import ro.roda.domain.StudyPersonPK;

privileged aspect StudyPersonPK_Roo_Identifier {
    
    declare @type: StudyPersonPK: @Embeddable;
    
    @Column(name = "person_id", columnDefinition = "int4", nullable = false)
    private Integer StudyPersonPK.personId;
    
    @Column(name = "study_id", columnDefinition = "int4", nullable = false)
    private Integer StudyPersonPK.studyId;
    
    @Column(name = "assoctype_id", columnDefinition = "int4", nullable = false)
    private Integer StudyPersonPK.assoctypeId;
    
    public StudyPersonPK.new(Integer personId, Integer studyId, Integer assoctypeId) {
        super();
        this.personId = personId;
        this.studyId = studyId;
        this.assoctypeId = assoctypeId;
    }

    private StudyPersonPK.new() {
        super();
    }

    public Integer StudyPersonPK.getPersonId() {
        return personId;
    }
    
    public Integer StudyPersonPK.getStudyId() {
        return studyId;
    }
    
    public Integer StudyPersonPK.getAssoctypeId() {
        return assoctypeId;
    }
    
}

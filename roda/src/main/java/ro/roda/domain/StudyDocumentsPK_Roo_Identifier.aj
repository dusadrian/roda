// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import ro.roda.domain.StudyDocumentsPK;

privileged aspect StudyDocumentsPK_Roo_Identifier {
    
    declare @type: StudyDocumentsPK: @Embeddable;
    
    @Column(name = "study_id", columnDefinition = "int4", nullable = false)
    private Integer StudyDocumentsPK.studyId;
    
    @Column(name = "document_id", columnDefinition = "int4", nullable = false)
    private Integer StudyDocumentsPK.documentId;
    
    public StudyDocumentsPK.new(Integer studyId, Integer documentId) {
        super();
        this.studyId = studyId;
        this.documentId = documentId;
    }

    private StudyDocumentsPK.new() {
        super();
    }

    public Integer StudyDocumentsPK.getStudyId() {
        return studyId;
    }
    
    public Integer StudyDocumentsPK.getDocumentId() {
        return documentId;
    }
    
}
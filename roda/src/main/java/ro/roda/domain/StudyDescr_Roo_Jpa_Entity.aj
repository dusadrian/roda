// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;
import ro.roda.domain.StudyDescr;
import ro.roda.domain.StudyDescrPK;

privileged aspect StudyDescr_Roo_Jpa_Entity {
    
    declare @type: StudyDescr: @Entity;
    
    declare @type: StudyDescr: @Table(schema = "public", name = "study_descr");
    
    @EmbeddedId
    private StudyDescrPK StudyDescr.id;
    
    public StudyDescrPK StudyDescr.getId() {
        return this.id;
    }
    
    public void StudyDescr.setId(StudyDescrPK id) {
        this.id = id;
    }
    
}
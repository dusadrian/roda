// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;
import ro.roda.domain.StudyOrg;
import ro.roda.domain.StudyOrgPK;

privileged aspect StudyOrg_Roo_Jpa_Entity {
    
    declare @type: StudyOrg: @Entity;
    
    declare @type: StudyOrg: @Table(schema = "public", name = "study_org");
    
    @EmbeddedId
    private StudyOrgPK StudyOrg.id;
    
    public StudyOrgPK StudyOrg.getId() {
        return this.id;
    }
    
    public void StudyOrg.setId(StudyOrgPK id) {
        this.id = id;
    }
    
}

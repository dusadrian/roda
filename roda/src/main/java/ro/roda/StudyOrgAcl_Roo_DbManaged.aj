// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import ro.roda.StudyOrg;
import ro.roda.StudyOrgAcl;

privileged aspect StudyOrgAcl_Roo_DbManaged {
    
    @ManyToOne
    @JoinColumn(name = "study_org_id", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    private StudyOrg StudyOrgAcl.studyOrgId;
    
    @Column(name = "read", columnDefinition = "bool")
    private Boolean StudyOrgAcl.read;
    
    @Column(name = "update", columnDefinition = "bool")
    private Boolean StudyOrgAcl.update;
    
    @Column(name = "delete", columnDefinition = "bool")
    private Boolean StudyOrgAcl.delete;
    
    @Column(name = "modacl", columnDefinition = "bool")
    private Boolean StudyOrgAcl.modacl;
    
    public StudyOrg StudyOrgAcl.getStudyOrgId() {
        return studyOrgId;
    }
    
    public void StudyOrgAcl.setStudyOrgId(StudyOrg studyOrgId) {
        this.studyOrgId = studyOrgId;
    }
    
    public Boolean StudyOrgAcl.getRead() {
        return read;
    }
    
    public void StudyOrgAcl.setRead(Boolean read) {
        this.read = read;
    }
    
    public Boolean StudyOrgAcl.getUpdate() {
        return update;
    }
    
    public void StudyOrgAcl.setUpdate(Boolean update) {
        this.update = update;
    }
    
    public Boolean StudyOrgAcl.getDelete() {
        return delete;
    }
    
    public void StudyOrgAcl.setDelete(Boolean delete) {
        this.delete = delete;
    }
    
    public Boolean StudyOrgAcl.getModacl() {
        return modacl;
    }
    
    public void StudyOrgAcl.setModacl(Boolean modacl) {
        this.modacl = modacl;
    }
    
}
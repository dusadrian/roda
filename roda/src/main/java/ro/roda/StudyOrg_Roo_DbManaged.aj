// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import java.util.Set;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import ro.roda.Org;
import ro.roda.Study;
import ro.roda.StudyOrg;
import ro.roda.StudyOrgAcl;
import ro.roda.StudyOrgAssoc;

privileged aspect StudyOrg_Roo_DbManaged {
    
    @OneToMany(mappedBy = "studyOrgId")
    private Set<StudyOrgAcl> StudyOrg.studyOrgAcls;
    
    @ManyToOne
    @JoinColumn(name = "org_id", referencedColumnName = "id", nullable = false)
    private Org StudyOrg.orgId;
    
    @ManyToOne
    @JoinColumn(name = "study_id", referencedColumnName = "id", nullable = false)
    private Study StudyOrg.studyId;
    
    @ManyToOne
    @JoinColumn(name = "assoctype_id", referencedColumnName = "id", nullable = false)
    private StudyOrgAssoc StudyOrg.assoctypeId;
    
    @Column(name = "citation", columnDefinition = "text")
    @NotNull
    private String StudyOrg.citation;
    
    public Set<StudyOrgAcl> StudyOrg.getStudyOrgAcls() {
        return studyOrgAcls;
    }
    
    public void StudyOrg.setStudyOrgAcls(Set<StudyOrgAcl> studyOrgAcls) {
        this.studyOrgAcls = studyOrgAcls;
    }
    
    public Org StudyOrg.getOrgId() {
        return orgId;
    }
    
    public void StudyOrg.setOrgId(Org orgId) {
        this.orgId = orgId;
    }
    
    public Study StudyOrg.getStudyId() {
        return studyId;
    }
    
    public void StudyOrg.setStudyId(Study studyId) {
        this.studyId = studyId;
    }
    
    public StudyOrgAssoc StudyOrg.getAssoctypeId() {
        return assoctypeId;
    }
    
    public void StudyOrg.setAssoctypeId(StudyOrgAssoc assoctypeId) {
        this.assoctypeId = assoctypeId;
    }
    
    public String StudyOrg.getCitation() {
        return citation;
    }
    
    public void StudyOrg.setCitation(String citation) {
        this.citation = citation;
    }
    
}
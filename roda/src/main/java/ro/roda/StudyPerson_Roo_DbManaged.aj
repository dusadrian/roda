// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import ro.roda.Person;
import ro.roda.Study;
import ro.roda.StudyPerson;
import ro.roda.StudyPersonAssoc;

privileged aspect StudyPerson_Roo_DbManaged {
    
    @ManyToOne
    @JoinColumn(name = "person_id", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    private Person StudyPerson.personId;
    
    @ManyToOne
    @JoinColumn(name = "study_id", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    private Study StudyPerson.studyId;
    
    @ManyToOne
    @JoinColumn(name = "assoctype_id", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    private StudyPersonAssoc StudyPerson.assoctypeId;
    
    @Column(name = "assoc_details", columnDefinition = "text")
    private String StudyPerson.assocDetails;
    
    public Person StudyPerson.getPersonId() {
        return personId;
    }
    
    public void StudyPerson.setPersonId(Person personId) {
        this.personId = personId;
    }
    
    public Study StudyPerson.getStudyId() {
        return studyId;
    }
    
    public void StudyPerson.setStudyId(Study studyId) {
        this.studyId = studyId;
    }
    
    public StudyPersonAssoc StudyPerson.getAssoctypeId() {
        return assoctypeId;
    }
    
    public void StudyPerson.setAssoctypeId(StudyPersonAssoc assoctypeId) {
        this.assoctypeId = assoctypeId;
    }
    
    public String StudyPerson.getAssocDetails() {
        return assocDetails;
    }
    
    public void StudyPerson.setAssocDetails(String assocDetails) {
        this.assocDetails = assocDetails;
    }
    
}

// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import java.util.Set;
import javax.persistence.Column;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import ro.roda.domain.Email;
import ro.roda.domain.OrgEmail;
import ro.roda.domain.PersonEmail;

privileged aspect Email_Roo_DbManaged {
    
    @OneToMany(mappedBy = "emailId")
    private Set<OrgEmail> Email.orgEmails;
    
    @OneToMany(mappedBy = "emailId")
    private Set<PersonEmail> Email.personEmails;
    
    @Column(name = "email", columnDefinition = "varchar", length = 200)
    @NotNull
    private String Email.email;
    
    public Set<OrgEmail> Email.getOrgEmails() {
        return orgEmails;
    }
    
    public void Email.setOrgEmails(Set<OrgEmail> orgEmails) {
        this.orgEmails = orgEmails;
    }
    
    public Set<PersonEmail> Email.getPersonEmails() {
        return personEmails;
    }
    
    public void Email.setPersonEmails(Set<PersonEmail> personEmails) {
        this.personEmails = personEmails;
    }
    
    public String Email.getEmail() {
        return email;
    }
    
    public void Email.setEmail(String email) {
        this.email = email;
    }
    
}
// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import java.util.Set;
import javax.persistence.Column;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import ro.roda.Internet;
import ro.roda.OrgInternet;
import ro.roda.PersonInternet;

privileged aspect Internet_Roo_DbManaged {
    
    @OneToMany(mappedBy = "internetId")
    private Set<OrgInternet> Internet.orgInternets;
    
    @OneToMany(mappedBy = "internetId")
    private Set<PersonInternet> Internet.personInternets;
    
    @Column(name = "internet_type", columnDefinition = "varchar", length = 50)
    private String Internet.internetType;
    
    @Column(name = "internet", columnDefinition = "text")
    @NotNull
    private String Internet.internet;
    
    public Set<OrgInternet> Internet.getOrgInternets() {
        return orgInternets;
    }
    
    public void Internet.setOrgInternets(Set<OrgInternet> orgInternets) {
        this.orgInternets = orgInternets;
    }
    
    public Set<PersonInternet> Internet.getPersonInternets() {
        return personInternets;
    }
    
    public void Internet.setPersonInternets(Set<PersonInternet> personInternets) {
        this.personInternets = personInternets;
    }
    
    public String Internet.getInternetType() {
        return internetType;
    }
    
    public void Internet.setInternetType(String internetType) {
        this.internetType = internetType;
    }
    
    public String Internet.getInternet() {
        return internet;
    }
    
    public void Internet.setInternet(String internet) {
        this.internet = internet;
    }
    
}

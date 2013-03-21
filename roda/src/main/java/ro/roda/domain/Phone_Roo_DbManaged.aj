// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import java.util.Set;
import javax.persistence.Column;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import ro.roda.domain.OrgPhone;
import ro.roda.domain.PersonPhone;
import ro.roda.domain.Phone;

privileged aspect Phone_Roo_DbManaged {
    
    @OneToMany(mappedBy = "phoneId")
    private Set<OrgPhone> Phone.orgPhones;
    
    @OneToMany(mappedBy = "phoneId")
    private Set<PersonPhone> Phone.personPhones;
    
    @Column(name = "phone", columnDefinition = "varchar", length = 30)
    @NotNull
    private String Phone.phone;
    
    @Column(name = "phone_type", columnDefinition = "varchar", length = 50)
    private String Phone.phoneType;
    
    public Set<OrgPhone> Phone.getOrgPhones() {
        return orgPhones;
    }
    
    public void Phone.setOrgPhones(Set<OrgPhone> orgPhones) {
        this.orgPhones = orgPhones;
    }
    
    public Set<PersonPhone> Phone.getPersonPhones() {
        return personPhones;
    }
    
    public void Phone.setPersonPhones(Set<PersonPhone> personPhones) {
        this.personPhones = personPhones;
    }
    
    public String Phone.getPhone() {
        return phone;
    }
    
    public void Phone.setPhone(String phone) {
        this.phone = phone;
    }
    
    public String Phone.getPhoneType() {
        return phoneType;
    }
    
    public void Phone.setPhoneType(String phoneType) {
        this.phoneType = phoneType;
    }
    
}

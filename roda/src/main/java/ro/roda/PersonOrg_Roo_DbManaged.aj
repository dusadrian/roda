// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import ro.roda.Org;
import ro.roda.Person;
import ro.roda.PersonOrg;
import ro.roda.PersonRole;

privileged aspect PersonOrg_Roo_DbManaged {
    
    @ManyToOne
    @JoinColumn(name = "org_id", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    private Org PersonOrg.orgId;
    
    @ManyToOne
    @JoinColumn(name = "person_id", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    private Person PersonOrg.personId;
    
    @ManyToOne
    @JoinColumn(name = "role_id", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    private PersonRole PersonOrg.roleId;
    
    @Column(name = "datestart", columnDefinition = "timestamp")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date PersonOrg.datestart;
    
    @Column(name = "dateend", columnDefinition = "timestamp")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date PersonOrg.dateend;
    
    public Org PersonOrg.getOrgId() {
        return orgId;
    }
    
    public void PersonOrg.setOrgId(Org orgId) {
        this.orgId = orgId;
    }
    
    public Person PersonOrg.getPersonId() {
        return personId;
    }
    
    public void PersonOrg.setPersonId(Person personId) {
        this.personId = personId;
    }
    
    public PersonRole PersonOrg.getRoleId() {
        return roleId;
    }
    
    public void PersonOrg.setRoleId(PersonRole roleId) {
        this.roleId = roleId;
    }
    
    public Date PersonOrg.getDatestart() {
        return datestart;
    }
    
    public void PersonOrg.setDatestart(Date datestart) {
        this.datestart = datestart;
    }
    
    public Date PersonOrg.getDateend() {
        return dateend;
    }
    
    public void PersonOrg.setDateend(Date dateend) {
        this.dateend = dateend;
    }
    
}

// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import ro.roda.domain.Org;
import ro.roda.domain.Person;
import ro.roda.domain.PersonOrg;
import ro.roda.domain.PersonRole;

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
    
    @Column(name = "date_start", columnDefinition = "date")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(style = "M-")
    private Date PersonOrg.dateStart;
    
    @Column(name = "date_end", columnDefinition = "date")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(style = "M-")
    private Date PersonOrg.dateEnd;
    
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
    
    public Date PersonOrg.getDateStart() {
        return dateStart;
    }
    
    public void PersonOrg.setDateStart(Date dateStart) {
        this.dateStart = dateStart;
    }
    
    public Date PersonOrg.getDateEnd() {
        return dateEnd;
    }
    
    public void PersonOrg.setDateEnd(Date dateEnd) {
        this.dateEnd = dateEnd;
    }
    
}

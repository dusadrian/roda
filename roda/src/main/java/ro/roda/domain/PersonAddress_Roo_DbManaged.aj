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
import ro.roda.domain.Address;
import ro.roda.domain.Person;
import ro.roda.domain.PersonAddress;

privileged aspect PersonAddress_Roo_DbManaged {
    
    @ManyToOne
    @JoinColumn(name = "address_id", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    private Address PersonAddress.addressId;
    
    @ManyToOne
    @JoinColumn(name = "person_id", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    private Person PersonAddress.personId;
    
    @Column(name = "date_start", columnDefinition = "date")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(style = "M-")
    private Date PersonAddress.dateStart;
    
    @Column(name = "date_end", columnDefinition = "date")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(style = "M-")
    private Date PersonAddress.dateEnd;
    
    public Address PersonAddress.getAddressId() {
        return addressId;
    }
    
    public void PersonAddress.setAddressId(Address addressId) {
        this.addressId = addressId;
    }
    
    public Person PersonAddress.getPersonId() {
        return personId;
    }
    
    public void PersonAddress.setPersonId(Person personId) {
        this.personId = personId;
    }
    
    public Date PersonAddress.getDateStart() {
        return dateStart;
    }
    
    public void PersonAddress.setDateStart(Date dateStart) {
        this.dateStart = dateStart;
    }
    
    public Date PersonAddress.getDateEnd() {
        return dateEnd;
    }
    
    public void PersonAddress.setDateEnd(Date dateEnd) {
        this.dateEnd = dateEnd;
    }
    
}

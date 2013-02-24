// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import java.util.Calendar;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import ro.roda.Address;
import ro.roda.Org;
import ro.roda.OrgAddress;

privileged aspect OrgAddress_Roo_DbManaged {
    
    @ManyToOne
    @JoinColumn(name = "address_id", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    private Address OrgAddress.addressId;
    
    @ManyToOne
    @JoinColumn(name = "org_id", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    private Org OrgAddress.orgId;
    
    @Column(name = "datestart", columnDefinition = "timestamp")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "MM")
    private Calendar OrgAddress.datestart;
    
    @Column(name = "dateend", columnDefinition = "timestamp")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "MM")
    private Calendar OrgAddress.dateend;
    
    public Address OrgAddress.getAddressId() {
        return addressId;
    }
    
    public void OrgAddress.setAddressId(Address addressId) {
        this.addressId = addressId;
    }
    
    public Org OrgAddress.getOrgId() {
        return orgId;
    }
    
    public void OrgAddress.setOrgId(Org orgId) {
        this.orgId = orgId;
    }
    
    public Calendar OrgAddress.getDatestart() {
        return datestart;
    }
    
    public void OrgAddress.setDatestart(Calendar datestart) {
        this.datestart = datestart;
    }
    
    public Calendar OrgAddress.getDateend() {
        return dateend;
    }
    
    public void OrgAddress.setDateend(Calendar dateend) {
        this.dateend = dateend;
    }
    
}

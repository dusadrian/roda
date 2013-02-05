// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import java.util.Set;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import ro.roda.Address;
import ro.roda.City;
import ro.roda.OrgAddress;
import ro.roda.PersonAddress;

privileged aspect Address_Roo_DbManaged {
    
    @OneToMany(mappedBy = "addressId")
    private Set<OrgAddress> Address.orgAddresses;
    
    @OneToMany(mappedBy = "addressId")
    private Set<PersonAddress> Address.personAddresses;
    
    @ManyToOne
    @JoinColumn(name = "city_id", referencedColumnName = "id", nullable = false)
    private City Address.cityId;
    
    @Column(name = "country_id", columnDefinition = "bpchar", length = 2)
    @NotNull
    private String Address.countryId;
    
    @Column(name = "address1", columnDefinition = "text")
    @NotNull
    private String Address.address1;
    
    @Column(name = "address2", columnDefinition = "text")
    private String Address.address2;
    
    @Column(name = "subdiv_name", columnDefinition = "varchar", length = 200)
    private String Address.subdivName;
    
    @Column(name = "subdiv_code", columnDefinition = "varchar", length = 50)
    private String Address.subdivCode;
    
    @Column(name = "postal_code", columnDefinition = "varchar", length = 30)
    private String Address.postalCode;
    
    public Set<OrgAddress> Address.getOrgAddresses() {
        return orgAddresses;
    }
    
    public void Address.setOrgAddresses(Set<OrgAddress> orgAddresses) {
        this.orgAddresses = orgAddresses;
    }
    
    public Set<PersonAddress> Address.getPersonAddresses() {
        return personAddresses;
    }
    
    public void Address.setPersonAddresses(Set<PersonAddress> personAddresses) {
        this.personAddresses = personAddresses;
    }
    
    public City Address.getCityId() {
        return cityId;
    }
    
    public void Address.setCityId(City cityId) {
        this.cityId = cityId;
    }
    
    public String Address.getCountryId() {
        return countryId;
    }
    
    public void Address.setCountryId(String countryId) {
        this.countryId = countryId;
    }
    
    public String Address.getAddress1() {
        return address1;
    }
    
    public void Address.setAddress1(String address1) {
        this.address1 = address1;
    }
    
    public String Address.getAddress2() {
        return address2;
    }
    
    public void Address.setAddress2(String address2) {
        this.address2 = address2;
    }
    
    public String Address.getSubdivName() {
        return subdivName;
    }
    
    public void Address.setSubdivName(String subdivName) {
        this.subdivName = subdivName;
    }
    
    public String Address.getSubdivCode() {
        return subdivCode;
    }
    
    public void Address.setSubdivCode(String subdivCode) {
        this.subdivCode = subdivCode;
    }
    
    public String Address.getPostalCode() {
        return postalCode;
    }
    
    public void Address.setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }
    
}

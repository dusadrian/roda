// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import ro.roda.domain.PersonInternetPK;

privileged aspect PersonInternetPK_Roo_Identifier {
    
    declare @type: PersonInternetPK: @Embeddable;
    
    @Column(name = "person_id", columnDefinition = "int4", nullable = false)
    private Integer PersonInternetPK.personId;
    
    @Column(name = "internet_id", columnDefinition = "int4", nullable = false)
    private Integer PersonInternetPK.internetId;
    
    public PersonInternetPK.new(Integer personId, Integer internetId) {
        super();
        this.personId = personId;
        this.internetId = internetId;
    }

    private PersonInternetPK.new() {
        super();
    }

    public Integer PersonInternetPK.getPersonId() {
        return personId;
    }
    
    public Integer PersonInternetPK.getInternetId() {
        return internetId;
    }
    
}

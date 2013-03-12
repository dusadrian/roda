// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import ro.roda.domain.PersonEmailPK;

privileged aspect PersonEmailPK_Roo_Identifier {
    
    declare @type: PersonEmailPK: @Embeddable;
    
    @Column(name = "person_id", columnDefinition = "int4", nullable = false)
    private Integer PersonEmailPK.personId;
    
    @Column(name = "email_id", columnDefinition = "int4", nullable = false)
    private Integer PersonEmailPK.emailId;
    
    public PersonEmailPK.new(Integer personId, Integer emailId) {
        super();
        this.personId = personId;
        this.emailId = emailId;
    }

    private PersonEmailPK.new() {
        super();
    }

    public Integer PersonEmailPK.getPersonId() {
        return personId;
    }
    
    public Integer PersonEmailPK.getEmailId() {
        return emailId;
    }
    
}
// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import ro.roda.OrgEmailPK;

privileged aspect OrgEmailPK_Roo_Identifier {
    
    declare @type: OrgEmailPK: @Embeddable;
    
    @Column(name = "org_id", columnDefinition = "int4", nullable = false)
    private Integer OrgEmailPK.orgId;
    
    @Column(name = "email_id", columnDefinition = "int4", nullable = false)
    private Integer OrgEmailPK.emailId;
    
    public OrgEmailPK.new(Integer orgId, Integer emailId) {
        super();
        this.orgId = orgId;
        this.emailId = emailId;
    }

    private OrgEmailPK.new() {
        super();
    }

    public Integer OrgEmailPK.getOrgId() {
        return orgId;
    }
    
    public Integer OrgEmailPK.getEmailId() {
        return emailId;
    }
    
}

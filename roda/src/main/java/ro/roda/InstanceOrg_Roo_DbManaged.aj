// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import ro.roda.Instance;
import ro.roda.InstanceOrg;
import ro.roda.InstanceOrgAssoc;
import ro.roda.Org;

privileged aspect InstanceOrg_Roo_DbManaged {
    
    @ManyToOne
    @JoinColumn(name = "instance_id", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    private Instance InstanceOrg.instanceId;
    
    @ManyToOne
    @JoinColumn(name = "assoc_type_id", referencedColumnName = "id", nullable = false)
    private InstanceOrgAssoc InstanceOrg.assocTypeId;
    
    @ManyToOne
    @JoinColumn(name = "org_id", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    private Org InstanceOrg.orgId;
    
    @Column(name = "assoc_details", columnDefinition = "text")
    private String InstanceOrg.assocDetails;
    
    @Column(name = "citation", columnDefinition = "text")
    @NotNull
    private String InstanceOrg.citation;
    
    public Instance InstanceOrg.getInstanceId() {
        return instanceId;
    }
    
    public void InstanceOrg.setInstanceId(Instance instanceId) {
        this.instanceId = instanceId;
    }
    
    public InstanceOrgAssoc InstanceOrg.getAssocTypeId() {
        return assocTypeId;
    }
    
    public void InstanceOrg.setAssocTypeId(InstanceOrgAssoc assocTypeId) {
        this.assocTypeId = assocTypeId;
    }
    
    public Org InstanceOrg.getOrgId() {
        return orgId;
    }
    
    public void InstanceOrg.setOrgId(Org orgId) {
        this.orgId = orgId;
    }
    
    public String InstanceOrg.getAssocDetails() {
        return assocDetails;
    }
    
    public void InstanceOrg.setAssocDetails(String assocDetails) {
        this.assocDetails = assocDetails;
    }
    
    public String InstanceOrg.getCitation() {
        return citation;
    }
    
    public void InstanceOrg.setCitation(String citation) {
        this.citation = citation;
    }
    
}
// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import java.util.Set;
import javax.persistence.Column;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import ro.roda.domain.InstanceOrg;
import ro.roda.domain.InstanceOrgAssoc;

privileged aspect InstanceOrgAssoc_Roo_DbManaged {
    
    @OneToMany(mappedBy = "assocTypeId")
    private Set<InstanceOrg> InstanceOrgAssoc.instanceOrgs;
    
    @Column(name = "assoc_name", columnDefinition = "varchar", length = 100)
    @NotNull
    private String InstanceOrgAssoc.assocName;
    
    @Column(name = "assoc_description", columnDefinition = "text")
    private String InstanceOrgAssoc.assocDescription;
    
    public Set<InstanceOrg> InstanceOrgAssoc.getInstanceOrgs() {
        return instanceOrgs;
    }
    
    public void InstanceOrgAssoc.setInstanceOrgs(Set<InstanceOrg> instanceOrgs) {
        this.instanceOrgs = instanceOrgs;
    }
    
    public String InstanceOrgAssoc.getAssocName() {
        return assocName;
    }
    
    public void InstanceOrgAssoc.setAssocName(String assocName) {
        this.assocName = assocName;
    }
    
    public String InstanceOrgAssoc.getAssocDescription() {
        return assocDescription;
    }
    
    public void InstanceOrgAssoc.setAssocDescription(String assocDescription) {
        this.assocDescription = assocDescription;
    }
    
}
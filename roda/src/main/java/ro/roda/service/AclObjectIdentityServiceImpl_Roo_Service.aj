// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ro.roda.domain.AclObjectIdentity;
import ro.roda.service.AclObjectIdentityServiceImpl;

privileged aspect AclObjectIdentityServiceImpl_Roo_Service {
    
    declare @type: AclObjectIdentityServiceImpl: @Service;
    
    declare @type: AclObjectIdentityServiceImpl: @Transactional;
    
    public long AclObjectIdentityServiceImpl.countAllAclObjectIdentitys() {
        return AclObjectIdentity.countAclObjectIdentitys();
    }
    
    public void AclObjectIdentityServiceImpl.deleteAclObjectIdentity(AclObjectIdentity aclObjectIdentity) {
        aclObjectIdentity.remove();
    }
    
    public AclObjectIdentity AclObjectIdentityServiceImpl.findAclObjectIdentity(Long id) {
        return AclObjectIdentity.findAclObjectIdentity(id);
    }
    
    public List<AclObjectIdentity> AclObjectIdentityServiceImpl.findAllAclObjectIdentitys() {
        return AclObjectIdentity.findAllAclObjectIdentitys();
    }
    
    public List<AclObjectIdentity> AclObjectIdentityServiceImpl.findAclObjectIdentityEntries(int firstResult, int maxResults) {
        return AclObjectIdentity.findAclObjectIdentityEntries(firstResult, maxResults);
    }
    
    public void AclObjectIdentityServiceImpl.saveAclObjectIdentity(AclObjectIdentity aclObjectIdentity) {
        aclObjectIdentity.persist();
    }
    
    public AclObjectIdentity AclObjectIdentityServiceImpl.updateAclObjectIdentity(AclObjectIdentity aclObjectIdentity) {
        return aclObjectIdentity.merge();
    }
    
}

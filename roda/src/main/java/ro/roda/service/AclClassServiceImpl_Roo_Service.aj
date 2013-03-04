// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ro.roda.domain.AclClass;
import ro.roda.service.AclClassServiceImpl;

privileged aspect AclClassServiceImpl_Roo_Service {
    
    declare @type: AclClassServiceImpl: @Service;
    
    declare @type: AclClassServiceImpl: @Transactional;
    
    public long AclClassServiceImpl.countAllAclClasses() {
        return AclClass.countAclClasses();
    }
    
    public void AclClassServiceImpl.deleteAclClass(AclClass aclClass) {
        aclClass.remove();
    }
    
    public AclClass AclClassServiceImpl.findAclClass(Long id) {
        return AclClass.findAclClass(id);
    }
    
    public List<AclClass> AclClassServiceImpl.findAllAclClasses() {
        return AclClass.findAllAclClasses();
    }
    
    public List<AclClass> AclClassServiceImpl.findAclClassEntries(int firstResult, int maxResults) {
        return AclClass.findAclClassEntries(firstResult, maxResults);
    }
    
    public void AclClassServiceImpl.saveAclClass(AclClass aclClass) {
        aclClass.persist();
    }
    
    public AclClass AclClassServiceImpl.updateAclClass(AclClass aclClass) {
        return aclClass.merge();
    }
    
}

// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ro.roda.domain.SourceContactMethod;
import ro.roda.service.SourceContactMethodServiceImpl;

privileged aspect SourceContactMethodServiceImpl_Roo_Service {
    
    declare @type: SourceContactMethodServiceImpl: @Service;
    
    declare @type: SourceContactMethodServiceImpl: @Transactional;
    
    public long SourceContactMethodServiceImpl.countAllSourceContactMethods() {
        return SourceContactMethod.countSourceContactMethods();
    }
    
    public void SourceContactMethodServiceImpl.deleteSourceContactMethod(SourceContactMethod sourceContactMethod) {
        sourceContactMethod.remove();
    }
    
    public SourceContactMethod SourceContactMethodServiceImpl.findSourceContactMethod(Integer id) {
        return SourceContactMethod.findSourceContactMethod(id);
    }
    
    public List<SourceContactMethod> SourceContactMethodServiceImpl.findAllSourceContactMethods() {
        return SourceContactMethod.findAllSourceContactMethods();
    }
    
    public List<SourceContactMethod> SourceContactMethodServiceImpl.findSourceContactMethodEntries(int firstResult, int maxResults) {
        return SourceContactMethod.findSourceContactMethodEntries(firstResult, maxResults);
    }
    
    public void SourceContactMethodServiceImpl.saveSourceContactMethod(SourceContactMethod sourceContactMethod) {
        sourceContactMethod.persist();
    }
    
    public SourceContactMethod SourceContactMethodServiceImpl.updateSourceContactMethod(SourceContactMethod sourceContactMethod) {
        return sourceContactMethod.merge();
    }
    
}

// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ro.roda.Audit;
import ro.roda.service.AuditServiceImpl;

privileged aspect AuditServiceImpl_Roo_Service {
    
    declare @type: AuditServiceImpl: @Service;
    
    declare @type: AuditServiceImpl: @Transactional;
    
    public long AuditServiceImpl.countAllAudits() {
        return Audit.countAudits();
    }
    
    public void AuditServiceImpl.deleteAudit(Audit audit) {
        audit.remove();
    }
    
    public Audit AuditServiceImpl.findAudit(Long id) {
        return Audit.findAudit(id);
    }
    
    public List<Audit> AuditServiceImpl.findAllAudits() {
        return Audit.findAllAudits();
    }
    
    public List<Audit> AuditServiceImpl.findAuditEntries(int firstResult, int maxResults) {
        return Audit.findAuditEntries(firstResult, maxResults);
    }
    
    public void AuditServiceImpl.saveAudit(Audit audit) {
        audit.persist();
    }
    
    public Audit AuditServiceImpl.updateAudit(Audit audit) {
        return audit.merge();
    }
    
}
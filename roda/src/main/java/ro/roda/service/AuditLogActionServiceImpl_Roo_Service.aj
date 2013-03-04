// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ro.roda.domain.AuditLogAction;
import ro.roda.service.AuditLogActionServiceImpl;

privileged aspect AuditLogActionServiceImpl_Roo_Service {
    
    declare @type: AuditLogActionServiceImpl: @Service;
    
    declare @type: AuditLogActionServiceImpl: @Transactional;
    
    public long AuditLogActionServiceImpl.countAllAuditLogActions() {
        return AuditLogAction.countAuditLogActions();
    }
    
    public void AuditLogActionServiceImpl.deleteAuditLogAction(AuditLogAction auditLogAction) {
        auditLogAction.remove();
    }
    
    public AuditLogAction AuditLogActionServiceImpl.findAuditLogAction(Integer id) {
        return AuditLogAction.findAuditLogAction(id);
    }
    
    public List<AuditLogAction> AuditLogActionServiceImpl.findAllAuditLogActions() {
        return AuditLogAction.findAllAuditLogActions();
    }
    
    public List<AuditLogAction> AuditLogActionServiceImpl.findAuditLogActionEntries(int firstResult, int maxResults) {
        return AuditLogAction.findAuditLogActionEntries(firstResult, maxResults);
    }
    
    public void AuditLogActionServiceImpl.saveAuditLogAction(AuditLogAction auditLogAction) {
        auditLogAction.persist();
    }
    
    public AuditLogAction AuditLogActionServiceImpl.updateAuditLogAction(AuditLogAction auditLogAction) {
        return auditLogAction.merge();
    }
    
}

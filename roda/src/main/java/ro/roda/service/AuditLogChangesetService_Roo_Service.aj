// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import ro.roda.domain.AuditLogChangeset;
import ro.roda.service.AuditLogChangesetService;

privileged aspect AuditLogChangesetService_Roo_Service {
    
    public abstract long AuditLogChangesetService.countAllAuditLogChangesets();    
    public abstract void AuditLogChangesetService.deleteAuditLogChangeset(AuditLogChangeset auditLogChangeset);    
    public abstract AuditLogChangeset AuditLogChangesetService.findAuditLogChangeset(Integer id);    
    public abstract List<AuditLogChangeset> AuditLogChangesetService.findAllAuditLogChangesets();    
    public abstract List<AuditLogChangeset> AuditLogChangesetService.findAuditLogChangesetEntries(int firstResult, int maxResults);    
    public abstract void AuditLogChangesetService.saveAuditLogChangeset(AuditLogChangeset auditLogChangeset);    
    public abstract AuditLogChangeset AuditLogChangesetService.updateAuditLogChangeset(AuditLogChangeset auditLogChangeset);    
}

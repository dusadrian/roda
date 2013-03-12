// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ro.roda.domain.AuditLogChangeset;
import ro.roda.service.AuditLogChangesetServiceImpl;

privileged aspect AuditLogChangesetServiceImpl_Roo_Service {
    
    declare @type: AuditLogChangesetServiceImpl: @Service;
    
    declare @type: AuditLogChangesetServiceImpl: @Transactional;
    
    public long AuditLogChangesetServiceImpl.countAllAuditLogChangesets() {
        return AuditLogChangeset.countAuditLogChangesets();
    }
    
    public void AuditLogChangesetServiceImpl.deleteAuditLogChangeset(AuditLogChangeset auditLogChangeset) {
        auditLogChangeset.remove();
    }
    
    public AuditLogChangeset AuditLogChangesetServiceImpl.findAuditLogChangeset(Integer id) {
        return AuditLogChangeset.findAuditLogChangeset(id);
    }
    
    public List<AuditLogChangeset> AuditLogChangesetServiceImpl.findAllAuditLogChangesets() {
        return AuditLogChangeset.findAllAuditLogChangesets();
    }
    
    public List<AuditLogChangeset> AuditLogChangesetServiceImpl.findAuditLogChangesetEntries(int firstResult, int maxResults) {
        return AuditLogChangeset.findAuditLogChangesetEntries(firstResult, maxResults);
    }
    
    public void AuditLogChangesetServiceImpl.saveAuditLogChangeset(AuditLogChangeset auditLogChangeset) {
        auditLogChangeset.persist();
    }
    
    public AuditLogChangeset AuditLogChangesetServiceImpl.updateAuditLogChangeset(AuditLogChangeset auditLogChangeset) {
        return auditLogChangeset.merge();
    }
    
}
// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import ro.roda.domain.SourcestudyTypeHistory;
import ro.roda.service.SourcestudyTypeHistoryService;

privileged aspect SourcestudyTypeHistoryService_Roo_Service {
    
    public abstract long SourcestudyTypeHistoryService.countAllSourcestudyTypeHistorys();    
    public abstract void SourcestudyTypeHistoryService.deleteSourcestudyTypeHistory(SourcestudyTypeHistory sourcestudyTypeHistory);    
    public abstract SourcestudyTypeHistory SourcestudyTypeHistoryService.findSourcestudyTypeHistory(Integer id);    
    public abstract List<SourcestudyTypeHistory> SourcestudyTypeHistoryService.findAllSourcestudyTypeHistorys();    
    public abstract List<SourcestudyTypeHistory> SourcestudyTypeHistoryService.findSourcestudyTypeHistoryEntries(int firstResult, int maxResults);    
    public abstract void SourcestudyTypeHistoryService.saveSourcestudyTypeHistory(SourcestudyTypeHistory sourcestudyTypeHistory);    
    public abstract SourcestudyTypeHistory SourcestudyTypeHistoryService.updateSourcestudyTypeHistory(SourcestudyTypeHistory sourcestudyTypeHistory);    
}

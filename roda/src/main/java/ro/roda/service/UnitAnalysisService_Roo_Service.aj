// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import ro.roda.UnitAnalysis;
import ro.roda.service.UnitAnalysisService;

privileged aspect UnitAnalysisService_Roo_Service {
    
    public abstract long UnitAnalysisService.countAllUnitAnalyses();    
    public abstract void UnitAnalysisService.deleteUnitAnalysis(UnitAnalysis unitAnalysis);    
    public abstract UnitAnalysis UnitAnalysisService.findUnitAnalysis(Integer id);    
    public abstract List<UnitAnalysis> UnitAnalysisService.findAllUnitAnalyses();    
    public abstract List<UnitAnalysis> UnitAnalysisService.findUnitAnalysisEntries(int firstResult, int maxResults);    
    public abstract void UnitAnalysisService.saveUnitAnalysis(UnitAnalysis unitAnalysis);    
    public abstract UnitAnalysis UnitAnalysisService.updateUnitAnalysis(UnitAnalysis unitAnalysis);    
}
// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import ro.roda.SamplingProcedure;
import ro.roda.service.SamplingProcedureService;

privileged aspect SamplingProcedureService_Roo_Service {
    
    public abstract long SamplingProcedureService.countAllSamplingProcedures();    
    public abstract void SamplingProcedureService.deleteSamplingProcedure(SamplingProcedure samplingProcedure);    
    public abstract SamplingProcedure SamplingProcedureService.findSamplingProcedure(Integer id);    
    public abstract List<SamplingProcedure> SamplingProcedureService.findAllSamplingProcedures();    
    public abstract List<SamplingProcedure> SamplingProcedureService.findSamplingProcedureEntries(int firstResult, int maxResults);    
    public abstract void SamplingProcedureService.saveSamplingProcedure(SamplingProcedure samplingProcedure);    
    public abstract SamplingProcedure SamplingProcedureService.updateSamplingProcedure(SamplingProcedure samplingProcedure);    
}
// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import ro.roda.domain.SeriesDescr;
import ro.roda.domain.SeriesDescrPK;
import ro.roda.service.SeriesDescrService;

privileged aspect SeriesDescrService_Roo_Service {
    
    public abstract long SeriesDescrService.countAllSeriesDescrs();    
    public abstract void SeriesDescrService.deleteSeriesDescr(SeriesDescr seriesDescr);    
    public abstract SeriesDescr SeriesDescrService.findSeriesDescr(SeriesDescrPK id);    
    public abstract List<SeriesDescr> SeriesDescrService.findAllSeriesDescrs();    
    public abstract List<SeriesDescr> SeriesDescrService.findSeriesDescrEntries(int firstResult, int maxResults);    
    public abstract void SeriesDescrService.saveSeriesDescr(SeriesDescr seriesDescr);    
    public abstract SeriesDescr SeriesDescrService.updateSeriesDescr(SeriesDescr seriesDescr);    
}
// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import ro.roda.CatalogStudy;
import ro.roda.CatalogStudyPK;
import ro.roda.service.CatalogStudyService;

privileged aspect CatalogStudyService_Roo_Service {
    
    public abstract long CatalogStudyService.countAllCatalogStudys();    
    public abstract void CatalogStudyService.deleteCatalogStudy(CatalogStudy catalogStudy);    
    public abstract CatalogStudy CatalogStudyService.findCatalogStudy(CatalogStudyPK id);    
    public abstract List<CatalogStudy> CatalogStudyService.findAllCatalogStudys();    
    public abstract List<CatalogStudy> CatalogStudyService.findCatalogStudyEntries(int firstResult, int maxResults);    
    public abstract void CatalogStudyService.saveCatalogStudy(CatalogStudy catalogStudy);    
    public abstract CatalogStudy CatalogStudyService.updateCatalogStudy(CatalogStudy catalogStudy);    
}

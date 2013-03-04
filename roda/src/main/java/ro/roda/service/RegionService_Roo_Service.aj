// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import ro.roda.domain.Region;
import ro.roda.service.RegionService;

privileged aspect RegionService_Roo_Service {
    
    public abstract long RegionService.countAllRegions();    
    public abstract void RegionService.deleteRegion(Region region);    
    public abstract Region RegionService.findRegion(Integer id);    
    public abstract List<Region> RegionService.findAllRegions();    
    public abstract List<Region> RegionService.findRegionEntries(int firstResult, int maxResults);    
    public abstract void RegionService.saveRegion(Region region);    
    public abstract Region RegionService.updateRegion(Region region);    
}

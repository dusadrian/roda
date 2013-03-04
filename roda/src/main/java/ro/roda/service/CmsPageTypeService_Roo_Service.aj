// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import ro.roda.domain.CmsPageType;
import ro.roda.service.CmsPageTypeService;

privileged aspect CmsPageTypeService_Roo_Service {
    
    public abstract long CmsPageTypeService.countAllCmsPageTypes();    
    public abstract void CmsPageTypeService.deleteCmsPageType(CmsPageType cmsPageType);    
    public abstract CmsPageType CmsPageTypeService.findCmsPageType(Integer id);    
    public abstract List<CmsPageType> CmsPageTypeService.findAllCmsPageTypes();    
    public abstract List<CmsPageType> CmsPageTypeService.findCmsPageTypeEntries(int firstResult, int maxResults);    
    public abstract void CmsPageTypeService.saveCmsPageType(CmsPageType cmsPageType);    
    public abstract CmsPageType CmsPageTypeService.updateCmsPageType(CmsPageType cmsPageType);    
}

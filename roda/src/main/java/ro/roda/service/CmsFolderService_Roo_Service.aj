// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import ro.roda.CmsFolder;
import ro.roda.service.CmsFolderService;

privileged aspect CmsFolderService_Roo_Service {
    
    public abstract long CmsFolderService.countAllCmsFolders();    
    public abstract void CmsFolderService.deleteCmsFolder(CmsFolder cmsFolder);    
    public abstract CmsFolder CmsFolderService.findCmsFolder(Integer id);    
    public abstract List<CmsFolder> CmsFolderService.findAllCmsFolders();    
    public abstract List<CmsFolder> CmsFolderService.findCmsFolderEntries(int firstResult, int maxResults);    
    public abstract void CmsFolderService.saveCmsFolder(CmsFolder cmsFolder);    
    public abstract CmsFolder CmsFolderService.updateCmsFolder(CmsFolder cmsFolder);    
}

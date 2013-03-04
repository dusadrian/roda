// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import ro.roda.domain.CatalogAcl;
import ro.roda.domain.CatalogAclPK;
import ro.roda.service.CatalogAclService;

privileged aspect CatalogAclService_Roo_Service {
    
    public abstract long CatalogAclService.countAllCatalogAcls();    
    public abstract void CatalogAclService.deleteCatalogAcl(CatalogAcl catalogAcl);    
    public abstract CatalogAcl CatalogAclService.findCatalogAcl(CatalogAclPK id);    
    public abstract List<CatalogAcl> CatalogAclService.findAllCatalogAcls();    
    public abstract List<CatalogAcl> CatalogAclService.findCatalogAclEntries(int firstResult, int maxResults);    
    public abstract void CatalogAclService.saveCatalogAcl(CatalogAcl catalogAcl);    
    public abstract CatalogAcl CatalogAclService.updateCatalogAcl(CatalogAcl catalogAcl);    
}

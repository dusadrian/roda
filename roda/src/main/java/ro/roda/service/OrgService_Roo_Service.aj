// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import ro.roda.Org;
import ro.roda.service.OrgService;

privileged aspect OrgService_Roo_Service {
    
    public abstract long OrgService.countAllOrgs();    
    public abstract void OrgService.deleteOrg(Org org);    
    public abstract Org OrgService.findOrg(Integer id);    
    public abstract List<Org> OrgService.findAllOrgs();    
    public abstract List<Org> OrgService.findOrgEntries(int firstResult, int maxResults);    
    public abstract void OrgService.saveOrg(Org org);    
    public abstract Org OrgService.updateOrg(Org org);    
}

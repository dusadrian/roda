// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import ro.roda.InstancePersonAssoc;
import ro.roda.service.InstancePersonAssocService;

privileged aspect InstancePersonAssocService_Roo_Service {
    
    public abstract long InstancePersonAssocService.countAllInstancePersonAssocs();    
    public abstract void InstancePersonAssocService.deleteInstancePersonAssoc(InstancePersonAssoc instancePersonAssoc);    
    public abstract InstancePersonAssoc InstancePersonAssocService.findInstancePersonAssoc(Integer id);    
    public abstract List<InstancePersonAssoc> InstancePersonAssocService.findAllInstancePersonAssocs();    
    public abstract List<InstancePersonAssoc> InstancePersonAssocService.findInstancePersonAssocEntries(int firstResult, int maxResults);    
    public abstract void InstancePersonAssocService.saveInstancePersonAssoc(InstancePersonAssoc instancePersonAssoc);    
    public abstract InstancePersonAssoc InstancePersonAssocService.updateInstancePersonAssoc(InstancePersonAssoc instancePersonAssoc);    
}
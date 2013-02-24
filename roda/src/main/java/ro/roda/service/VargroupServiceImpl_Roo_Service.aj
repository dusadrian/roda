// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ro.roda.Vargroup;
import ro.roda.service.VargroupServiceImpl;

privileged aspect VargroupServiceImpl_Roo_Service {
    
    declare @type: VargroupServiceImpl: @Service;
    
    declare @type: VargroupServiceImpl: @Transactional;
    
    public long VargroupServiceImpl.countAllVargroups() {
        return Vargroup.countVargroups();
    }
    
    public void VargroupServiceImpl.deleteVargroup(Vargroup vargroup) {
        vargroup.remove();
    }
    
    public Vargroup VargroupServiceImpl.findVargroup(Long id) {
        return Vargroup.findVargroup(id);
    }
    
    public List<Vargroup> VargroupServiceImpl.findAllVargroups() {
        return Vargroup.findAllVargroups();
    }
    
    public List<Vargroup> VargroupServiceImpl.findVargroupEntries(int firstResult, int maxResults) {
        return Vargroup.findVargroupEntries(firstResult, maxResults);
    }
    
    public void VargroupServiceImpl.saveVargroup(Vargroup vargroup) {
        vargroup.persist();
    }
    
    public Vargroup VargroupServiceImpl.updateVargroup(Vargroup vargroup) {
        return vargroup.merge();
    }
    
}

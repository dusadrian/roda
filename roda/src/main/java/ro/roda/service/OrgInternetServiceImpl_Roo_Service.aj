// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ro.roda.OrgInternet;
import ro.roda.OrgInternetPK;
import ro.roda.service.OrgInternetServiceImpl;

privileged aspect OrgInternetServiceImpl_Roo_Service {
    
    declare @type: OrgInternetServiceImpl: @Service;
    
    declare @type: OrgInternetServiceImpl: @Transactional;
    
    public long OrgInternetServiceImpl.countAllOrgInternets() {
        return OrgInternet.countOrgInternets();
    }
    
    public void OrgInternetServiceImpl.deleteOrgInternet(OrgInternet orgInternet) {
        orgInternet.remove();
    }
    
    public OrgInternet OrgInternetServiceImpl.findOrgInternet(OrgInternetPK id) {
        return OrgInternet.findOrgInternet(id);
    }
    
    public List<OrgInternet> OrgInternetServiceImpl.findAllOrgInternets() {
        return OrgInternet.findAllOrgInternets();
    }
    
    public List<OrgInternet> OrgInternetServiceImpl.findOrgInternetEntries(int firstResult, int maxResults) {
        return OrgInternet.findOrgInternetEntries(firstResult, maxResults);
    }
    
    public void OrgInternetServiceImpl.saveOrgInternet(OrgInternet orgInternet) {
        orgInternet.persist();
    }
    
    public OrgInternet OrgInternetServiceImpl.updateOrgInternet(OrgInternet orgInternet) {
        return orgInternet.merge();
    }
    
}

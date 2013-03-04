// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ro.roda.domain.OrgSufix;
import ro.roda.service.OrgSufixServiceImpl;

privileged aspect OrgSufixServiceImpl_Roo_Service {
    
    declare @type: OrgSufixServiceImpl: @Service;
    
    declare @type: OrgSufixServiceImpl: @Transactional;
    
    public long OrgSufixServiceImpl.countAllOrgSufixes() {
        return OrgSufix.countOrgSufixes();
    }
    
    public void OrgSufixServiceImpl.deleteOrgSufix(OrgSufix orgSufix) {
        orgSufix.remove();
    }
    
    public OrgSufix OrgSufixServiceImpl.findOrgSufix(Integer id) {
        return OrgSufix.findOrgSufix(id);
    }
    
    public List<OrgSufix> OrgSufixServiceImpl.findAllOrgSufixes() {
        return OrgSufix.findAllOrgSufixes();
    }
    
    public List<OrgSufix> OrgSufixServiceImpl.findOrgSufixEntries(int firstResult, int maxResults) {
        return OrgSufix.findOrgSufixEntries(firstResult, maxResults);
    }
    
    public void OrgSufixServiceImpl.saveOrgSufix(OrgSufix orgSufix) {
        orgSufix.persist();
    }
    
    public OrgSufix OrgSufixServiceImpl.updateOrgSufix(OrgSufix orgSufix) {
        return orgSufix.merge();
    }
    
}

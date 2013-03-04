// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import ro.roda.domain.PersonRole;
import ro.roda.service.PersonRoleService;

privileged aspect PersonRoleService_Roo_Service {
    
    public abstract long PersonRoleService.countAllPersonRoles();    
    public abstract void PersonRoleService.deletePersonRole(PersonRole personRole);    
    public abstract PersonRole PersonRoleService.findPersonRole(Integer id);    
    public abstract List<PersonRole> PersonRoleService.findAllPersonRoles();    
    public abstract List<PersonRole> PersonRoleService.findPersonRoleEntries(int firstResult, int maxResults);    
    public abstract void PersonRoleService.savePersonRole(PersonRole personRole);    
    public abstract PersonRole PersonRoleService.updatePersonRole(PersonRole personRole);    
}

// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import ro.roda.domain.Authorities;
import ro.roda.domain.AuthoritiesPK;
import ro.roda.service.AuthoritiesService;

privileged aspect AuthoritiesService_Roo_Service {
    
    public abstract long AuthoritiesService.countAllAuthoritieses();    
    public abstract void AuthoritiesService.deleteAuthorities(Authorities authorities);    
    public abstract Authorities AuthoritiesService.findAuthorities(AuthoritiesPK id);    
    public abstract List<Authorities> AuthoritiesService.findAllAuthoritieses();    
    public abstract List<Authorities> AuthoritiesService.findAuthoritiesEntries(int firstResult, int maxResults);    
    public abstract void AuthoritiesService.saveAuthorities(Authorities authorities);    
    public abstract Authorities AuthoritiesService.updateAuthorities(Authorities authorities);    
}
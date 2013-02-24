// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import ro.roda.AuthData;
import ro.roda.service.AuthDataService;

privileged aspect AuthDataService_Roo_Service {
    
    public abstract long AuthDataService.countAllAuthDatas();    
    public abstract void AuthDataService.deleteAuthData(AuthData authData);    
    public abstract AuthData AuthDataService.findAuthData(Integer id);    
    public abstract List<AuthData> AuthDataService.findAllAuthDatas();    
    public abstract List<AuthData> AuthDataService.findAuthDataEntries(int firstResult, int maxResults);    
    public abstract void AuthDataService.saveAuthData(AuthData authData);    
    public abstract AuthData AuthDataService.updateAuthData(AuthData authData);    
}

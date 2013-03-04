// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ro.roda.PersonInternet;
import ro.roda.PersonInternetPK;
import ro.roda.service.PersonInternetServiceImpl;

privileged aspect PersonInternetServiceImpl_Roo_Service {
    
    declare @type: PersonInternetServiceImpl: @Service;
    
    declare @type: PersonInternetServiceImpl: @Transactional;
    
    public long PersonInternetServiceImpl.countAllPersonInternets() {
        return PersonInternet.countPersonInternets();
    }
    
    public void PersonInternetServiceImpl.deletePersonInternet(PersonInternet personInternet) {
        personInternet.remove();
    }
    
    public PersonInternet PersonInternetServiceImpl.findPersonInternet(PersonInternetPK id) {
        return PersonInternet.findPersonInternet(id);
    }
    
    public List<PersonInternet> PersonInternetServiceImpl.findAllPersonInternets() {
        return PersonInternet.findAllPersonInternets();
    }
    
    public List<PersonInternet> PersonInternetServiceImpl.findPersonInternetEntries(int firstResult, int maxResults) {
        return PersonInternet.findPersonInternetEntries(firstResult, maxResults);
    }
    
    public void PersonInternetServiceImpl.savePersonInternet(PersonInternet personInternet) {
        personInternet.persist();
    }
    
    public PersonInternet PersonInternetServiceImpl.updatePersonInternet(PersonInternet personInternet) {
        return personInternet.merge();
    }
    
}
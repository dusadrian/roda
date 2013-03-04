// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ro.roda.domain.PersonEmail;
import ro.roda.domain.PersonEmailPK;
import ro.roda.service.PersonEmailServiceImpl;

privileged aspect PersonEmailServiceImpl_Roo_Service {
    
    declare @type: PersonEmailServiceImpl: @Service;
    
    declare @type: PersonEmailServiceImpl: @Transactional;
    
    public long PersonEmailServiceImpl.countAllPersonEmails() {
        return PersonEmail.countPersonEmails();
    }
    
    public void PersonEmailServiceImpl.deletePersonEmail(PersonEmail personEmail) {
        personEmail.remove();
    }
    
    public PersonEmail PersonEmailServiceImpl.findPersonEmail(PersonEmailPK id) {
        return PersonEmail.findPersonEmail(id);
    }
    
    public List<PersonEmail> PersonEmailServiceImpl.findAllPersonEmails() {
        return PersonEmail.findAllPersonEmails();
    }
    
    public List<PersonEmail> PersonEmailServiceImpl.findPersonEmailEntries(int firstResult, int maxResults) {
        return PersonEmail.findPersonEmailEntries(firstResult, maxResults);
    }
    
    public void PersonEmailServiceImpl.savePersonEmail(PersonEmail personEmail) {
        personEmail.persist();
    }
    
    public PersonEmail PersonEmailServiceImpl.updatePersonEmail(PersonEmail personEmail) {
        return personEmail.merge();
    }
    
}

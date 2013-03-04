// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ro.roda.domain.PersonPhone;
import ro.roda.domain.PersonPhonePK;
import ro.roda.service.PersonPhoneServiceImpl;

privileged aspect PersonPhoneServiceImpl_Roo_Service {
    
    declare @type: PersonPhoneServiceImpl: @Service;
    
    declare @type: PersonPhoneServiceImpl: @Transactional;
    
    public long PersonPhoneServiceImpl.countAllPersonPhones() {
        return PersonPhone.countPersonPhones();
    }
    
    public void PersonPhoneServiceImpl.deletePersonPhone(PersonPhone personPhone) {
        personPhone.remove();
    }
    
    public PersonPhone PersonPhoneServiceImpl.findPersonPhone(PersonPhonePK id) {
        return PersonPhone.findPersonPhone(id);
    }
    
    public List<PersonPhone> PersonPhoneServiceImpl.findAllPersonPhones() {
        return PersonPhone.findAllPersonPhones();
    }
    
    public List<PersonPhone> PersonPhoneServiceImpl.findPersonPhoneEntries(int firstResult, int maxResults) {
        return PersonPhone.findPersonPhoneEntries(firstResult, maxResults);
    }
    
    public void PersonPhoneServiceImpl.savePersonPhone(PersonPhone personPhone) {
        personPhone.persist();
    }
    
    public PersonPhone PersonPhoneServiceImpl.updatePersonPhone(PersonPhone personPhone) {
        return personPhone.merge();
    }
    
}

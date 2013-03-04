// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import ro.roda.PersonPhone;
import ro.roda.PersonPhonePK;
import ro.roda.service.PersonPhoneService;

privileged aspect PersonPhoneService_Roo_Service {
    
    public abstract long PersonPhoneService.countAllPersonPhones();    
    public abstract void PersonPhoneService.deletePersonPhone(PersonPhone personPhone);    
    public abstract PersonPhone PersonPhoneService.findPersonPhone(PersonPhonePK id);    
    public abstract List<PersonPhone> PersonPhoneService.findAllPersonPhones();    
    public abstract List<PersonPhone> PersonPhoneService.findPersonPhoneEntries(int firstResult, int maxResults);    
    public abstract void PersonPhoneService.savePersonPhone(PersonPhone personPhone);    
    public abstract PersonPhone PersonPhoneService.updatePersonPhone(PersonPhone personPhone);    
}
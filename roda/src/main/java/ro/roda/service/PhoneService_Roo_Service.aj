// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import ro.roda.Phone;
import ro.roda.service.PhoneService;

privileged aspect PhoneService_Roo_Service {
    
    public abstract long PhoneService.countAllPhones();    
    public abstract void PhoneService.deletePhone(Phone phone);    
    public abstract Phone PhoneService.findPhone(Integer id);    
    public abstract List<Phone> PhoneService.findAllPhones();    
    public abstract List<Phone> PhoneService.findPhoneEntries(int firstResult, int maxResults);    
    public abstract void PhoneService.savePhone(Phone phone);    
    public abstract Phone PhoneService.updatePhone(Phone phone);    
}

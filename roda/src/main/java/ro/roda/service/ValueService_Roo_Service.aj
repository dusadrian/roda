// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import ro.roda.Value;
import ro.roda.service.ValueService;

privileged aspect ValueService_Roo_Service {
    
    public abstract long ValueService.countAllValues();    
    public abstract void ValueService.deleteValue(Value value);    
    public abstract Value ValueService.findValue(Long id);    
    public abstract List<Value> ValueService.findAllValues();    
    public abstract List<Value> ValueService.findValueEntries(int firstResult, int maxResults);    
    public abstract void ValueService.saveValue(Value value);    
    public abstract Value ValueService.updateValue(Value value);    
}

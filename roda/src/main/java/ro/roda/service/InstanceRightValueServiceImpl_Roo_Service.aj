// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ro.roda.domain.InstanceRightValue;
import ro.roda.service.InstanceRightValueServiceImpl;

privileged aspect InstanceRightValueServiceImpl_Roo_Service {
    
    declare @type: InstanceRightValueServiceImpl: @Service;
    
    declare @type: InstanceRightValueServiceImpl: @Transactional;
    
    public long InstanceRightValueServiceImpl.countAllInstanceRightValues() {
        return InstanceRightValue.countInstanceRightValues();
    }
    
    public void InstanceRightValueServiceImpl.deleteInstanceRightValue(InstanceRightValue instanceRightValue) {
        instanceRightValue.remove();
    }
    
    public InstanceRightValue InstanceRightValueServiceImpl.findInstanceRightValue(Integer id) {
        return InstanceRightValue.findInstanceRightValue(id);
    }
    
    public List<InstanceRightValue> InstanceRightValueServiceImpl.findAllInstanceRightValues() {
        return InstanceRightValue.findAllInstanceRightValues();
    }
    
    public List<InstanceRightValue> InstanceRightValueServiceImpl.findInstanceRightValueEntries(int firstResult, int maxResults) {
        return InstanceRightValue.findInstanceRightValueEntries(firstResult, maxResults);
    }
    
    public void InstanceRightValueServiceImpl.saveInstanceRightValue(InstanceRightValue instanceRightValue) {
        instanceRightValue.persist();
    }
    
    public InstanceRightValue InstanceRightValueServiceImpl.updateInstanceRightValue(InstanceRightValue instanceRightValue) {
        return instanceRightValue.merge();
    }
    
}
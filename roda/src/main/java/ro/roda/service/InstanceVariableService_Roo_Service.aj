// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import ro.roda.domain.InstanceVariable;
import ro.roda.domain.InstanceVariablePK;
import ro.roda.service.InstanceVariableService;

privileged aspect InstanceVariableService_Roo_Service {
    
    public abstract long InstanceVariableService.countAllInstanceVariables();    
    public abstract void InstanceVariableService.deleteInstanceVariable(InstanceVariable instanceVariable);    
    public abstract InstanceVariable InstanceVariableService.findInstanceVariable(InstanceVariablePK id);    
    public abstract List<InstanceVariable> InstanceVariableService.findAllInstanceVariables();    
    public abstract List<InstanceVariable> InstanceVariableService.findInstanceVariableEntries(int firstResult, int maxResults);    
    public abstract void InstanceVariableService.saveInstanceVariable(InstanceVariable instanceVariable);    
    public abstract InstanceVariable InstanceVariableService.updateInstanceVariable(InstanceVariable instanceVariable);    
}
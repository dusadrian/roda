// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import ro.roda.domain.FormEditedNumberVar;
import ro.roda.domain.FormEditedNumberVarPK;
import ro.roda.service.FormEditedNumberVarService;

privileged aspect FormEditedNumberVarService_Roo_Service {
    
    public abstract long FormEditedNumberVarService.countAllFormEditedNumberVars();    
    public abstract void FormEditedNumberVarService.deleteFormEditedNumberVar(FormEditedNumberVar formEditedNumberVar);    
    public abstract FormEditedNumberVar FormEditedNumberVarService.findFormEditedNumberVar(FormEditedNumberVarPK id);    
    public abstract List<FormEditedNumberVar> FormEditedNumberVarService.findAllFormEditedNumberVars();    
    public abstract List<FormEditedNumberVar> FormEditedNumberVarService.findFormEditedNumberVarEntries(int firstResult, int maxResults);    
    public abstract void FormEditedNumberVarService.saveFormEditedNumberVar(FormEditedNumberVar formEditedNumberVar);    
    public abstract FormEditedNumberVar FormEditedNumberVarService.updateFormEditedNumberVar(FormEditedNumberVar formEditedNumberVar);    
}

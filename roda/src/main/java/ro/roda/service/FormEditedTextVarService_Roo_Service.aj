// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import ro.roda.FormEditedTextVar;
import ro.roda.FormEditedTextVarPK;
import ro.roda.service.FormEditedTextVarService;

privileged aspect FormEditedTextVarService_Roo_Service {
    
    public abstract long FormEditedTextVarService.countAllFormEditedTextVars();    
    public abstract void FormEditedTextVarService.deleteFormEditedTextVar(FormEditedTextVar formEditedTextVar);    
    public abstract FormEditedTextVar FormEditedTextVarService.findFormEditedTextVar(FormEditedTextVarPK id);    
    public abstract List<FormEditedTextVar> FormEditedTextVarService.findAllFormEditedTextVars();    
    public abstract List<FormEditedTextVar> FormEditedTextVarService.findFormEditedTextVarEntries(int firstResult, int maxResults);    
    public abstract void FormEditedTextVarService.saveFormEditedTextVar(FormEditedTextVar formEditedTextVar);    
    public abstract FormEditedTextVar FormEditedTextVarService.updateFormEditedTextVar(FormEditedTextVar formEditedTextVar);    
}

// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ro.roda.domain.FormSelectionVar;
import ro.roda.domain.FormSelectionVarPK;
import ro.roda.service.FormSelectionVarServiceImpl;

privileged aspect FormSelectionVarServiceImpl_Roo_Service {
    
    declare @type: FormSelectionVarServiceImpl: @Service;
    
    declare @type: FormSelectionVarServiceImpl: @Transactional;
    
    public long FormSelectionVarServiceImpl.countAllFormSelectionVars() {
        return FormSelectionVar.countFormSelectionVars();
    }
    
    public void FormSelectionVarServiceImpl.deleteFormSelectionVar(FormSelectionVar formSelectionVar) {
        formSelectionVar.remove();
    }
    
    public FormSelectionVar FormSelectionVarServiceImpl.findFormSelectionVar(FormSelectionVarPK id) {
        return FormSelectionVar.findFormSelectionVar(id);
    }
    
    public List<FormSelectionVar> FormSelectionVarServiceImpl.findAllFormSelectionVars() {
        return FormSelectionVar.findAllFormSelectionVars();
    }
    
    public List<FormSelectionVar> FormSelectionVarServiceImpl.findFormSelectionVarEntries(int firstResult, int maxResults) {
        return FormSelectionVar.findFormSelectionVarEntries(firstResult, maxResults);
    }
    
    public void FormSelectionVarServiceImpl.saveFormSelectionVar(FormSelectionVar formSelectionVar) {
        formSelectionVar.persist();
    }
    
    public FormSelectionVar FormSelectionVarServiceImpl.updateFormSelectionVar(FormSelectionVar formSelectionVar) {
        return formSelectionVar.merge();
    }
    
}

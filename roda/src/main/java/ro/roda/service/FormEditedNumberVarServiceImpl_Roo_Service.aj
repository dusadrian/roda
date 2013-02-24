// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ro.roda.FormEditedNumberVar;
import ro.roda.FormEditedNumberVarPK;
import ro.roda.service.FormEditedNumberVarServiceImpl;

privileged aspect FormEditedNumberVarServiceImpl_Roo_Service {
    
    declare @type: FormEditedNumberVarServiceImpl: @Service;
    
    declare @type: FormEditedNumberVarServiceImpl: @Transactional;
    
    public long FormEditedNumberVarServiceImpl.countAllFormEditedNumberVars() {
        return FormEditedNumberVar.countFormEditedNumberVars();
    }
    
    public void FormEditedNumberVarServiceImpl.deleteFormEditedNumberVar(FormEditedNumberVar formEditedNumberVar) {
        formEditedNumberVar.remove();
    }
    
    public FormEditedNumberVar FormEditedNumberVarServiceImpl.findFormEditedNumberVar(FormEditedNumberVarPK id) {
        return FormEditedNumberVar.findFormEditedNumberVar(id);
    }
    
    public List<FormEditedNumberVar> FormEditedNumberVarServiceImpl.findAllFormEditedNumberVars() {
        return FormEditedNumberVar.findAllFormEditedNumberVars();
    }
    
    public List<FormEditedNumberVar> FormEditedNumberVarServiceImpl.findFormEditedNumberVarEntries(int firstResult, int maxResults) {
        return FormEditedNumberVar.findFormEditedNumberVarEntries(firstResult, maxResults);
    }
    
    public void FormEditedNumberVarServiceImpl.saveFormEditedNumberVar(FormEditedNumberVar formEditedNumberVar) {
        formEditedNumberVar.persist();
    }
    
    public FormEditedNumberVar FormEditedNumberVarServiceImpl.updateFormEditedNumberVar(FormEditedNumberVar formEditedNumberVar) {
        return formEditedNumberVar.merge();
    }
    
}

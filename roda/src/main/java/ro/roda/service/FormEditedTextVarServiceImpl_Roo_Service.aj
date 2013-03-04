// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ro.roda.domain.FormEditedTextVar;
import ro.roda.domain.FormEditedTextVarPK;
import ro.roda.service.FormEditedTextVarServiceImpl;

privileged aspect FormEditedTextVarServiceImpl_Roo_Service {
    
    declare @type: FormEditedTextVarServiceImpl: @Service;
    
    declare @type: FormEditedTextVarServiceImpl: @Transactional;
    
    public long FormEditedTextVarServiceImpl.countAllFormEditedTextVars() {
        return FormEditedTextVar.countFormEditedTextVars();
    }
    
    public void FormEditedTextVarServiceImpl.deleteFormEditedTextVar(FormEditedTextVar formEditedTextVar) {
        formEditedTextVar.remove();
    }
    
    public FormEditedTextVar FormEditedTextVarServiceImpl.findFormEditedTextVar(FormEditedTextVarPK id) {
        return FormEditedTextVar.findFormEditedTextVar(id);
    }
    
    public List<FormEditedTextVar> FormEditedTextVarServiceImpl.findAllFormEditedTextVars() {
        return FormEditedTextVar.findAllFormEditedTextVars();
    }
    
    public List<FormEditedTextVar> FormEditedTextVarServiceImpl.findFormEditedTextVarEntries(int firstResult, int maxResults) {
        return FormEditedTextVar.findFormEditedTextVarEntries(firstResult, maxResults);
    }
    
    public void FormEditedTextVarServiceImpl.saveFormEditedTextVar(FormEditedTextVar formEditedTextVar) {
        formEditedTextVar.persist();
    }
    
    public FormEditedTextVar FormEditedTextVarServiceImpl.updateFormEditedTextVar(FormEditedTextVar formEditedTextVar) {
        return formEditedTextVar.merge();
    }
    
}

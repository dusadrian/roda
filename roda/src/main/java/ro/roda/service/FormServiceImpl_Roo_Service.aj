// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ro.roda.domain.Form;
import ro.roda.service.FormServiceImpl;

privileged aspect FormServiceImpl_Roo_Service {
    
    declare @type: FormServiceImpl: @Service;
    
    declare @type: FormServiceImpl: @Transactional;
    
    public long FormServiceImpl.countAllForms() {
        return Form.countForms();
    }
    
    public void FormServiceImpl.deleteForm(Form form) {
        form.remove();
    }
    
    public Form FormServiceImpl.findForm(Long id) {
        return Form.findForm(id);
    }
    
    public List<Form> FormServiceImpl.findAllForms() {
        return Form.findAllForms();
    }
    
    public List<Form> FormServiceImpl.findFormEntries(int firstResult, int maxResults) {
        return Form.findFormEntries(firstResult, maxResults);
    }
    
    public void FormServiceImpl.saveForm(Form form) {
        form.persist();
    }
    
    public Form FormServiceImpl.updateForm(Form form) {
        return form.merge();
    }
    
}

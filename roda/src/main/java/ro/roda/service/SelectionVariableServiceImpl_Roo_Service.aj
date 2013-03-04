// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ro.roda.SelectionVariable;
import ro.roda.service.SelectionVariableServiceImpl;

privileged aspect SelectionVariableServiceImpl_Roo_Service {
    
    declare @type: SelectionVariableServiceImpl: @Service;
    
    declare @type: SelectionVariableServiceImpl: @Transactional;
    
    public long SelectionVariableServiceImpl.countAllSelectionVariables() {
        return SelectionVariable.countSelectionVariables();
    }
    
    public void SelectionVariableServiceImpl.deleteSelectionVariable(SelectionVariable selectionVariable) {
        selectionVariable.remove();
    }
    
    public SelectionVariable SelectionVariableServiceImpl.findSelectionVariable(Long id) {
        return SelectionVariable.findSelectionVariable(id);
    }
    
    public List<SelectionVariable> SelectionVariableServiceImpl.findAllSelectionVariables() {
        return SelectionVariable.findAllSelectionVariables();
    }
    
    public List<SelectionVariable> SelectionVariableServiceImpl.findSelectionVariableEntries(int firstResult, int maxResults) {
        return SelectionVariable.findSelectionVariableEntries(firstResult, maxResults);
    }
    
    public void SelectionVariableServiceImpl.saveSelectionVariable(SelectionVariable selectionVariable) {
        selectionVariable.persist();
    }
    
    public SelectionVariable SelectionVariableServiceImpl.updateSelectionVariable(SelectionVariable selectionVariable) {
        return selectionVariable.merge();
    }
    
}
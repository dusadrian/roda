// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import ro.roda.domain.Skip;
import ro.roda.domain.Variable;

privileged aspect Skip_Roo_DbManaged {
    
    @ManyToOne
    @JoinColumn(name = "next_variable_id", referencedColumnName = "id", nullable = false)
    private Variable Skip.nextVariableId;
    
    @ManyToOne
    @JoinColumn(name = "variable_id", referencedColumnName = "id", nullable = false)
    private Variable Skip.variableId;
    
    @Column(name = "condition", columnDefinition = "text")
    @NotNull
    private String Skip.condition;
    
    public Variable Skip.getNextVariableId() {
        return nextVariableId;
    }
    
    public void Skip.setNextVariableId(Variable nextVariableId) {
        this.nextVariableId = nextVariableId;
    }
    
    public Variable Skip.getVariableId() {
        return variableId;
    }
    
    public void Skip.setVariableId(Variable variableId) {
        this.variableId = variableId;
    }
    
    public String Skip.getCondition() {
        return condition;
    }
    
    public void Skip.setCondition(String condition) {
        this.condition = condition;
    }
    
}
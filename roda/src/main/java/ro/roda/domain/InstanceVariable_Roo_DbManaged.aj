// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import ro.roda.domain.Instance;
import ro.roda.domain.InstanceVariable;
import ro.roda.domain.Variable;

privileged aspect InstanceVariable_Roo_DbManaged {
    
    @ManyToOne
    @JoinColumn(name = "instance_id", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    private Instance InstanceVariable.instanceId;
    
    @ManyToOne
    @JoinColumn(name = "variable_id", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    private Variable InstanceVariable.variableId;
    
    @Column(name = "order_variable_in_instance", columnDefinition = "int4", unique = true)
    @NotNull
    private Integer InstanceVariable.orderVariableInInstance;
    
    public Instance InstanceVariable.getInstanceId() {
        return instanceId;
    }
    
    public void InstanceVariable.setInstanceId(Instance instanceId) {
        this.instanceId = instanceId;
    }
    
    public Variable InstanceVariable.getVariableId() {
        return variableId;
    }
    
    public void InstanceVariable.setVariableId(Variable variableId) {
        this.variableId = variableId;
    }
    
    public Integer InstanceVariable.getOrderVariableInInstance() {
        return orderVariableInInstance;
    }
    
    public void InstanceVariable.setOrderVariableInInstance(Integer orderVariableInInstance) {
        this.orderVariableInInstance = orderVariableInInstance;
    }
    
}
// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import ro.roda.domain.Form;
import ro.roda.domain.Instance;
import ro.roda.domain.InstanceForm;

privileged aspect InstanceForm_Roo_DbManaged {
    
    @ManyToOne
    @JoinColumn(name = "form_id", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    private Form InstanceForm.formId;
    
    @ManyToOne
    @JoinColumn(name = "instance_id", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    private Instance InstanceForm.instanceId;
    
    @Column(name = "order_form_in_instance", columnDefinition = "int4", unique = true)
    @NotNull
    private Integer InstanceForm.orderFormInInstance;
    
    public Form InstanceForm.getFormId() {
        return formId;
    }
    
    public void InstanceForm.setFormId(Form formId) {
        this.formId = formId;
    }
    
    public Instance InstanceForm.getInstanceId() {
        return instanceId;
    }
    
    public void InstanceForm.setInstanceId(Instance instanceId) {
        this.instanceId = instanceId;
    }
    
    public Integer InstanceForm.getOrderFormInInstance() {
        return orderFormInInstance;
    }
    
    public void InstanceForm.setOrderFormInInstance(Integer orderFormInInstance) {
        this.orderFormInInstance = orderFormInInstance;
    }
    
}
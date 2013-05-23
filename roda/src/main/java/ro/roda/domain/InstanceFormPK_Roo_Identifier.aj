// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import ro.roda.domain.InstanceFormPK;

privileged aspect InstanceFormPK_Roo_Identifier {
    
    declare @type: InstanceFormPK: @Embeddable;
    
    @Column(name = "instance_id", columnDefinition = "int4", nullable = false)
    private Integer InstanceFormPK.instanceId;
    
    @Column(name = "form_id", columnDefinition = "int8", nullable = false)
    private Long InstanceFormPK.formId;
    
    public InstanceFormPK.new(Integer instanceId, Long formId) {
        super();
        this.instanceId = instanceId;
        this.formId = formId;
    }

    private InstanceFormPK.new() {
        super();
    }

    public Integer InstanceFormPK.getInstanceId() {
        return instanceId;
    }
    
    public Long InstanceFormPK.getFormId() {
        return formId;
    }
    
}
// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import ro.roda.InstanceDescrPK;

privileged aspect InstanceDescrPK_Roo_Identifier {
    
    declare @type: InstanceDescrPK: @Embeddable;
    
    @Column(name = "instance_id", columnDefinition = "int4", nullable = false)
    private Integer InstanceDescrPK.instanceId;
    
    @Column(name = "lang_id", columnDefinition = "bpchar", nullable = false, length = 2)
    private String InstanceDescrPK.langId;
    
    public InstanceDescrPK.new(Integer instanceId, String langId) {
        super();
        this.instanceId = instanceId;
        this.langId = langId;
    }

    private InstanceDescrPK.new() {
        super();
    }

    public Integer InstanceDescrPK.getInstanceId() {
        return instanceId;
    }
    
    public String InstanceDescrPK.getLangId() {
        return langId;
    }
    
}

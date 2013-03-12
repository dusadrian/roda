// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import ro.roda.domain.InstancePersonPK;

privileged aspect InstancePersonPK_Roo_Identifier {
    
    declare @type: InstancePersonPK: @Embeddable;
    
    @Column(name = "person_id", columnDefinition = "int4", nullable = false)
    private Integer InstancePersonPK.personId;
    
    @Column(name = "instance_id", columnDefinition = "int4", nullable = false)
    private Integer InstancePersonPK.instanceId;
    
    @Column(name = "assoc_type_id", columnDefinition = "int4", nullable = false)
    private Integer InstancePersonPK.assocTypeId;
    
    public InstancePersonPK.new(Integer personId, Integer instanceId, Integer assocTypeId) {
        super();
        this.personId = personId;
        this.instanceId = instanceId;
        this.assocTypeId = assocTypeId;
    }

    private InstancePersonPK.new() {
        super();
    }

    public Integer InstancePersonPK.getPersonId() {
        return personId;
    }
    
    public Integer InstancePersonPK.getInstanceId() {
        return instanceId;
    }
    
    public Integer InstancePersonPK.getAssocTypeId() {
        return assocTypeId;
    }
    
}
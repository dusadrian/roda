// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import ro.roda.domain.InstanceRightValue;

privileged aspect InstanceRightValue_Roo_Jpa_Entity {
    
    declare @type: InstanceRightValue: @Entity;
    
    declare @type: InstanceRightValue: @Table(schema = "public", name = "instance_right_value");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", columnDefinition = "serial")
    private Integer InstanceRightValue.id;
    
    public Integer InstanceRightValue.getId() {
        return this.id;
    }
    
    public void InstanceRightValue.setId(Integer id) {
        this.id = id;
    }
    
}
// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import ro.roda.InstancePersonAssoc;

privileged aspect InstancePersonAssoc_Roo_Jpa_Entity {
    
    declare @type: InstancePersonAssoc: @Entity;
    
    declare @type: InstancePersonAssoc: @Table(schema = "public", name = "instance_person_assoc");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", columnDefinition = "serial")
    private Integer InstancePersonAssoc.id;
    
    public Integer InstancePersonAssoc.getId() {
        return this.id;
    }
    
    public void InstancePersonAssoc.setId(Integer id) {
        this.id = id;
    }
    
}

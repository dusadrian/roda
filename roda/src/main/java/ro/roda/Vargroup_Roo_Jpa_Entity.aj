// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import ro.roda.Vargroup;

privileged aspect Vargroup_Roo_Jpa_Entity {
    
    declare @type: Vargroup: @Entity;
    
    declare @type: Vargroup: @Table(schema = "public", name = "vargroup");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", columnDefinition = "int4")
    private Integer Vargroup.id;
    
    public Integer Vargroup.getId() {
        return this.id;
    }
    
    public void Vargroup.setId(Integer id) {
        this.id = id;
    }
    
}
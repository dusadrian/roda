// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import ro.roda.domain.Rodauser;

privileged aspect Rodauser_Roo_Jpa_Entity {
    
    declare @type: Rodauser: @Entity;
    
    declare @type: Rodauser: @Table(schema = "public", name = "rodauser");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", columnDefinition = "serial")
    private Integer Rodauser.id;
    
    public Integer Rodauser.getId() {
        return this.id;
    }
    
    public void Rodauser.setId(Integer id) {
        this.id = id;
    }
    
}
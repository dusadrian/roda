// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import ro.roda.Study;

privileged aspect Study_Roo_Jpa_Entity {
    
    declare @type: Study: @Entity;
    
    declare @type: Study: @Table(schema = "public", name = "study");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", columnDefinition = "serial")
    private Integer Study.id;
    
    public Integer Study.getId() {
        return this.id;
    }
    
    public void Study.setId(Integer id) {
        this.id = id;
    }
    
}

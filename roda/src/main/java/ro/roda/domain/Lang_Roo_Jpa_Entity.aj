// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import ro.roda.domain.Lang;

privileged aspect Lang_Roo_Jpa_Entity {
    
    declare @type: Lang: @Entity;
    
    declare @type: Lang: @Table(schema = "public", name = "lang");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", columnDefinition = "serial")
    private Integer Lang.id;
    
    public Integer Lang.getId() {
        return this.id;
    }
    
    public void Lang.setId(Integer id) {
        this.id = id;
    }
    
}

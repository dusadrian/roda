// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import ro.roda.Sourcestudy;

privileged aspect Sourcestudy_Roo_Jpa_Entity {
    
    declare @type: Sourcestudy: @Entity;
    
    declare @type: Sourcestudy: @Table(schema = "public", name = "sourcestudy");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", columnDefinition = "int4")
    private Integer Sourcestudy.id;
    
    public Integer Sourcestudy.getId() {
        return this.id;
    }
    
    public void Sourcestudy.setId(Integer id) {
        this.id = id;
    }
    
}
// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import ro.roda.domain.Keyword;

privileged aspect Keyword_Roo_Jpa_Entity {
    
    declare @type: Keyword: @Entity;
    
    declare @type: Keyword: @Table(schema = "public", name = "keyword");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", columnDefinition = "serial")
    private Integer Keyword.id;
    
    public Integer Keyword.getId() {
        return this.id;
    }
    
    public void Keyword.setId(Integer id) {
        this.id = id;
    }
    
}
// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import ro.roda.domain.Concept;

privileged aspect Concept_Roo_Jpa_Entity {
    
    declare @type: Concept: @Entity;
    
    declare @type: Concept: @Table(schema = "public", name = "concept");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", columnDefinition = "bigserial")
    private Long Concept.id;
    
    public Long Concept.getId() {
        return this.id;
    }
    
    public void Concept.setId(Long id) {
        this.id = id;
    }
    
}

// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import ro.roda.domain.OrgRelationType;

privileged aspect OrgRelationType_Roo_Jpa_Entity {
    
    declare @type: OrgRelationType: @Entity;
    
    declare @type: OrgRelationType: @Table(schema = "public", name = "org_relation_type");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", columnDefinition = "serial")
    private Integer OrgRelationType.id;
    
    public Integer OrgRelationType.getId() {
        return this.id;
    }
    
    public void OrgRelationType.setId(Integer id) {
        this.id = id;
    }
    
}

// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import ro.roda.AclClass;

privileged aspect AclClass_Roo_Jpa_Entity {
    
    declare @type: AclClass: @Entity;
    
    declare @type: AclClass: @Table(schema = "public", name = "acl_class");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", columnDefinition = "bigserial")
    private Long AclClass.id;
    
    public Long AclClass.getId() {
        return this.id;
    }
    
    public void AclClass.setId(Long id) {
        this.id = id;
    }
    
}

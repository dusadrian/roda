// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import ro.roda.AuditLogChange;

privileged aspect AuditLogChange_Roo_Jpa_Entity {
    
    declare @type: AuditLogChange: @Entity;
    
    declare @type: AuditLogChange: @Table(schema = "public", name = "audit_log_change");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", columnDefinition = "serial")
    private Integer AuditLogChange.id;
    
    public Integer AuditLogChange.getId() {
        return this.id;
    }
    
    public void AuditLogChange.setId(Integer id) {
        this.id = id;
    }
    
}

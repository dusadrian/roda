// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import ro.roda.AuditLogAction;
import ro.roda.AuditLogField;
import ro.roda.AuditLogTable;

privileged aspect AuditLogTable_Roo_DbManaged {
    
    @OneToMany(mappedBy = "auditedTable", cascade = CascadeType.ALL)
    private Set<AuditLogAction> AuditLogTable.auditLogActions;
    
    @OneToMany(mappedBy = "auditedTable", cascade = CascadeType.ALL)
    private Set<AuditLogField> AuditLogTable.auditLogFields;
    
    @Column(name = "name", columnDefinition = "varchar", length = 40, unique = true)
    @NotNull
    private String AuditLogTable.name;
    
    public Set<AuditLogAction> AuditLogTable.getAuditLogActions() {
        return auditLogActions;
    }
    
    public void AuditLogTable.setAuditLogActions(Set<AuditLogAction> auditLogActions) {
        this.auditLogActions = auditLogActions;
    }
    
    public Set<AuditLogField> AuditLogTable.getAuditLogFields() {
        return auditLogFields;
    }
    
    public void AuditLogTable.setAuditLogFields(Set<AuditLogField> auditLogFields) {
        this.auditLogFields = auditLogFields;
    }
    
    public String AuditLogTable.getName() {
        return name;
    }
    
    public void AuditLogTable.setName(String name) {
        this.name = name;
    }
    
}

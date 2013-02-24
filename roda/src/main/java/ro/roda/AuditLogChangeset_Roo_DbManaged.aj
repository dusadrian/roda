// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import java.util.Calendar;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import org.springframework.format.annotation.DateTimeFormat;
import ro.roda.AuditLogAction;
import ro.roda.AuditLogChangeset;
import ro.roda.Rodauser;

privileged aspect AuditLogChangeset_Roo_DbManaged {
    
    @OneToMany(mappedBy = "changeset", cascade = CascadeType.ALL)
    private Set<AuditLogAction> AuditLogChangeset.auditLogActions;
    
    @ManyToOne
    @JoinColumn(name = "rodauser", referencedColumnName = "id", nullable = false)
    private Rodauser AuditLogChangeset.rodauser;
    
    @Column(name = "description", columnDefinition = "varchar", length = 255)
    private String AuditLogChangeset.description;
    
    @Column(name = "timestamp", columnDefinition = "timestamp")
    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "MM")
    private Calendar AuditLogChangeset.timestamp;
    
    public Set<AuditLogAction> AuditLogChangeset.getAuditLogActions() {
        return auditLogActions;
    }
    
    public void AuditLogChangeset.setAuditLogActions(Set<AuditLogAction> auditLogActions) {
        this.auditLogActions = auditLogActions;
    }
    
    public Rodauser AuditLogChangeset.getRodauser() {
        return rodauser;
    }
    
    public void AuditLogChangeset.setRodauser(Rodauser rodauser) {
        this.rodauser = rodauser;
    }
    
    public String AuditLogChangeset.getDescription() {
        return description;
    }
    
    public void AuditLogChangeset.setDescription(String description) {
        this.description = description;
    }
    
    public Calendar AuditLogChangeset.getTimestamp() {
        return timestamp;
    }
    
    public void AuditLogChangeset.setTimestamp(Calendar timestamp) {
        this.timestamp = timestamp;
    }
    
}

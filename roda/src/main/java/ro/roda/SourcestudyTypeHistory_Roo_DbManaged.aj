// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import org.springframework.format.annotation.DateTimeFormat;
import ro.roda.Sourcestudy;
import ro.roda.SourcestudyType;
import ro.roda.SourcestudyTypeHistory;

privileged aspect SourcestudyTypeHistory_Roo_DbManaged {
    
    @ManyToOne
    @JoinColumn(name = "sourcesstudy_id", referencedColumnName = "id", nullable = false)
    private Sourcestudy SourcestudyTypeHistory.sourcesstudyId;
    
    @ManyToOne
    @JoinColumn(name = "sourcestudy_type_id", referencedColumnName = "id", nullable = false)
    private SourcestudyType SourcestudyTypeHistory.sourcestudyTypeId;
    
    @Column(name = "datestart", columnDefinition = "timestamp")
    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date SourcestudyTypeHistory.datestart;
    
    @Column(name = "dateend", columnDefinition = "timestamp")
    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date SourcestudyTypeHistory.dateend;
    
    @Column(name = "addedBy", columnDefinition = "int4")
    @NotNull
    private Integer SourcestudyTypeHistory.addedBy;
    
    public Sourcestudy SourcestudyTypeHistory.getSourcesstudyId() {
        return sourcesstudyId;
    }
    
    public void SourcestudyTypeHistory.setSourcesstudyId(Sourcestudy sourcesstudyId) {
        this.sourcesstudyId = sourcesstudyId;
    }
    
    public SourcestudyType SourcestudyTypeHistory.getSourcestudyTypeId() {
        return sourcestudyTypeId;
    }
    
    public void SourcestudyTypeHistory.setSourcestudyTypeId(SourcestudyType sourcestudyTypeId) {
        this.sourcestudyTypeId = sourcestudyTypeId;
    }
    
    public Date SourcestudyTypeHistory.getDatestart() {
        return datestart;
    }
    
    public void SourcestudyTypeHistory.setDatestart(Date datestart) {
        this.datestart = datestart;
    }
    
    public Date SourcestudyTypeHistory.getDateend() {
        return dateend;
    }
    
    public void SourcestudyTypeHistory.setDateend(Date dateend) {
        this.dateend = dateend;
    }
    
    public Integer SourcestudyTypeHistory.getAddedBy() {
        return addedBy;
    }
    
    public void SourcestudyTypeHistory.setAddedBy(Integer addedBy) {
        this.addedBy = addedBy;
    }
    
}
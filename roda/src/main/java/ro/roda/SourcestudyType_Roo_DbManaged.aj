// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import java.util.Set;
import javax.persistence.Column;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import ro.roda.Sourcestudy;
import ro.roda.SourcestudyType;
import ro.roda.SourcestudyTypeHistory;

privileged aspect SourcestudyType_Roo_DbManaged {
    
    @OneToMany(mappedBy = "type")
    private Set<Sourcestudy> SourcestudyType.sourcestudies;
    
    @OneToMany(mappedBy = "sourcestudyTypeId")
    private Set<SourcestudyTypeHistory> SourcestudyType.sourcestudyTypeHistories;
    
    @Column(name = "name", columnDefinition = "varchar", length = 150)
    @NotNull
    private String SourcestudyType.name;
    
    @Column(name = "description", columnDefinition = "text")
    private String SourcestudyType.description;
    
    public Set<Sourcestudy> SourcestudyType.getSourcestudies() {
        return sourcestudies;
    }
    
    public void SourcestudyType.setSourcestudies(Set<Sourcestudy> sourcestudies) {
        this.sourcestudies = sourcestudies;
    }
    
    public Set<SourcestudyTypeHistory> SourcestudyType.getSourcestudyTypeHistories() {
        return sourcestudyTypeHistories;
    }
    
    public void SourcestudyType.setSourcestudyTypeHistories(Set<SourcestudyTypeHistory> sourcestudyTypeHistories) {
        this.sourcestudyTypeHistories = sourcestudyTypeHistories;
    }
    
    public String SourcestudyType.getName() {
        return name;
    }
    
    public void SourcestudyType.setName(String name) {
        this.name = name;
    }
    
    public String SourcestudyType.getDescription() {
        return description;
    }
    
    public void SourcestudyType.setDescription(String description) {
        this.description = description;
    }
    
}
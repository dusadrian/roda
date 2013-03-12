// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import java.util.Set;
import javax.persistence.Column;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import ro.roda.domain.Instance;
import ro.roda.domain.UnitAnalysis;

privileged aspect UnitAnalysis_Roo_DbManaged {
    
    @OneToMany(mappedBy = "unitAnalysisId")
    private Set<Instance> UnitAnalysis.instances;
    
    @Column(name = "name", columnDefinition = "varchar", length = 100)
    @NotNull
    private String UnitAnalysis.name;
    
    @Column(name = "description", columnDefinition = "text")
    private String UnitAnalysis.description;
    
    public Set<Instance> UnitAnalysis.getInstances() {
        return instances;
    }
    
    public void UnitAnalysis.setInstances(Set<Instance> instances) {
        this.instances = instances;
    }
    
    public String UnitAnalysis.getName() {
        return name;
    }
    
    public void UnitAnalysis.setName(String name) {
        this.name = name;
    }
    
    public String UnitAnalysis.getDescription() {
        return description;
    }
    
    public void UnitAnalysis.setDescription(String description) {
        this.description = description;
    }
    
}
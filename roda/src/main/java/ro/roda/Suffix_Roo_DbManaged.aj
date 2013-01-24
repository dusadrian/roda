// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import java.util.Set;
import javax.persistence.Column;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import ro.roda.Person;
import ro.roda.Suffix;

privileged aspect Suffix_Roo_DbManaged {
    
    @OneToMany(mappedBy = "suffixId")
    private Set<Person> Suffix.people;
    
    @Column(name = "name", columnDefinition = "varchar", length = 50)
    @NotNull
    private String Suffix.name;
    
    public Set<Person> Suffix.getPeople() {
        return people;
    }
    
    public void Suffix.setPeople(Set<Person> people) {
        this.people = people;
    }
    
    public String Suffix.getName() {
        return name;
    }
    
    public void Suffix.setName(String name) {
        this.name = name;
    }
    
}
// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import ro.roda.Variable;

privileged aspect Variable_Roo_Jpa_Entity {
    
    declare @type: Variable: @Entity;
    
    declare @type: Variable: @Table(schema = "public", name = "variable");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", columnDefinition = "bigserial")
    private Long Variable.id;
    
    public Long Variable.getId() {
        return this.id;
    }
    
    public void Variable.setId(Long id) {
        this.id = id;
    }
    
}

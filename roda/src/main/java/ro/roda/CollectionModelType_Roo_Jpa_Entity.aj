// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import ro.roda.CollectionModelType;

privileged aspect CollectionModelType_Roo_Jpa_Entity {
    
    declare @type: CollectionModelType: @Entity;
    
    declare @type: CollectionModelType: @Table(schema = "public", name = "collection_model_type");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", columnDefinition = "serial")
    private Integer CollectionModelType.id;
    
    public Integer CollectionModelType.getId() {
        return this.id;
    }
    
    public void CollectionModelType.setId(Integer id) {
        this.id = id;
    }
    
}

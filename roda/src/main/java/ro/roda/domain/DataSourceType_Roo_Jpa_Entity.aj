// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import ro.roda.domain.DataSourceType;

privileged aspect DataSourceType_Roo_Jpa_Entity {
    
    declare @type: DataSourceType: @Entity;
    
    declare @type: DataSourceType: @Table(schema = "public", name = "data_source_type");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", columnDefinition = "serial")
    private Integer DataSourceType.id;
    
    public Integer DataSourceType.getId() {
        return this.id;
    }
    
    public void DataSourceType.setId(Integer id) {
        this.id = id;
    }
    
}
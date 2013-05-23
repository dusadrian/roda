// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import ro.roda.domain.Series;

privileged aspect Series_Roo_Jpa_Entity {
    
    declare @type: Series: @Entity;
    
    declare @type: Series: @Table(schema = "public", name = "series");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "catalog_id", columnDefinition = "int4")
    private Integer Series.catalogId;
    
    public Integer Series.getCatalogId() {
        return this.catalogId;
    }
    
    public void Series.setCatalogId(Integer id) {
        this.catalogId = id;
    }
    
}
// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import ro.roda.OtherStatistic;

privileged aspect OtherStatistic_Roo_Jpa_Entity {
    
    declare @type: OtherStatistic: @Entity;
    
    declare @type: OtherStatistic: @Table(schema = "public", name = "other_statistic");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", columnDefinition = "bigserial")
    private Long OtherStatistic.id;
    
    public Long OtherStatistic.getId() {
        return this.id;
    }
    
    public void OtherStatistic.setId(Long id) {
        this.id = id;
    }
    
}

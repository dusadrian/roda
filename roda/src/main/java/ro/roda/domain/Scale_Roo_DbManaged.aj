// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.validation.constraints.NotNull;
import ro.roda.domain.Item;
import ro.roda.domain.Scale;
import ro.roda.domain.Value;

privileged aspect Scale_Roo_DbManaged {
    
    @OneToOne
    @JoinColumn(name = "item_id", nullable = false, insertable = false, updatable = false)
    private Item Scale.item;
    
    @ManyToOne
    @JoinColumn(name = "maxvalue_id", referencedColumnName = "item_id", nullable = false)
    private Value Scale.maxvalueId;
    
    @ManyToOne
    @JoinColumn(name = "minvalue_id", referencedColumnName = "item_id", nullable = false)
    private Value Scale.minvalueId;
    
    @ManyToOne
    @JoinColumn(name = "min_value_id", referencedColumnName = "item_id", nullable = false)
    private Value Scale.minValueId;
    
    @ManyToOne
    @JoinColumn(name = "max_value_id", referencedColumnName = "item_id", nullable = false)
    private Value Scale.maxValueId;
    
    @Column(name = "units", columnDefinition = "int2")
    @NotNull
    private Short Scale.units;
    
    public Item Scale.getItem() {
        return item;
    }
    
    public void Scale.setItem(Item item) {
        this.item = item;
    }
    
    public Value Scale.getMaxvalueId() {
        return maxvalueId;
    }
    
    public void Scale.setMaxvalueId(Value maxvalueId) {
        this.maxvalueId = maxvalueId;
    }
    
    public Value Scale.getMinvalueId() {
        return minvalueId;
    }
    
    public void Scale.setMinvalueId(Value minvalueId) {
        this.minvalueId = minvalueId;
    }
    
    public Value Scale.getMinValueId() {
        return minValueId;
    }
    
    public void Scale.setMinValueId(Value minValueId) {
        this.minValueId = minValueId;
    }
    
    public Value Scale.getMaxValueId() {
        return maxValueId;
    }
    
    public void Scale.setMaxValueId(Value maxValueId) {
        this.maxValueId = maxValueId;
    }
    
    public Short Scale.getUnits() {
        return units;
    }
    
    public void Scale.setUnits(Short units) {
        this.units = units;
    }
    
}

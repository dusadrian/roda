// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import ro.roda.CmsFile;
import ro.roda.CmsFilePropertyNameValue;
import ro.roda.PropertyName;
import ro.roda.PropertyValue;

privileged aspect CmsFilePropertyNameValue_Roo_DbManaged {
    
    @ManyToOne
    @JoinColumn(name = "cms_file_id", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    private CmsFile CmsFilePropertyNameValue.cmsFileId;
    
    @ManyToOne
    @JoinColumn(name = "property_name_id", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    private PropertyName CmsFilePropertyNameValue.propertyNameId;
    
    @ManyToOne
    @JoinColumn(name = "property_value_id", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    private PropertyValue CmsFilePropertyNameValue.propertyValueId;
    
    public CmsFile CmsFilePropertyNameValue.getCmsFileId() {
        return cmsFileId;
    }
    
    public void CmsFilePropertyNameValue.setCmsFileId(CmsFile cmsFileId) {
        this.cmsFileId = cmsFileId;
    }
    
    public PropertyName CmsFilePropertyNameValue.getPropertyNameId() {
        return propertyNameId;
    }
    
    public void CmsFilePropertyNameValue.setPropertyNameId(PropertyName propertyNameId) {
        this.propertyNameId = propertyNameId;
    }
    
    public PropertyValue CmsFilePropertyNameValue.getPropertyValueId() {
        return propertyValueId;
    }
    
    public void CmsFilePropertyNameValue.setPropertyValueId(PropertyValue propertyValueId) {
        this.propertyValueId = propertyValueId;
    }
    
}

// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;
import ro.roda.FilePropertyNameValue;
import ro.roda.FilePropertyNameValuePK;

privileged aspect FilePropertyNameValue_Roo_Jpa_Entity {
    
    declare @type: FilePropertyNameValue: @Entity;
    
    declare @type: FilePropertyNameValue: @Table(schema = "public", name = "file_property_name_value");
    
    @EmbeddedId
    private FilePropertyNameValuePK FilePropertyNameValue.id;
    
    public FilePropertyNameValuePK FilePropertyNameValue.getId() {
        return this.id;
    }
    
    public void FilePropertyNameValue.setId(FilePropertyNameValuePK id) {
        this.id = id;
    }
    
}

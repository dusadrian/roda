// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;
import ro.roda.domain.Authorities;
import ro.roda.domain.AuthoritiesPK;

privileged aspect Authorities_Roo_Jpa_Entity {
    
    declare @type: Authorities: @Entity;
    
    declare @type: Authorities: @Table(schema = "public", name = "authorities");
    
    @EmbeddedId
    private AuthoritiesPK Authorities.id;
    
    public AuthoritiesPK Authorities.getId() {
        return this.id;
    }
    
    public void Authorities.setId(AuthoritiesPK id) {
        this.id = id;
    }
    
}

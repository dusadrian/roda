// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import ro.roda.domain.Users;

privileged aspect Users_Roo_Jpa_Entity {
    
    declare @type: Users: @Entity;
    
    declare @type: Users: @Table(schema = "public", name = "users");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "username", columnDefinition = "varchar", length = 64)
    private String Users.username;
    
    public String Users.getUsername() {
        return this.username;
    }
    
    public void Users.setUsername(String id) {
        this.username = id;
    }
    
}

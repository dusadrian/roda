// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import ro.roda.UserMessage;

privileged aspect UserMessage_Roo_Jpa_Entity {
    
    declare @type: UserMessage: @Entity;
    
    declare @type: UserMessage: @Table(schema = "public", name = "user_message");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", columnDefinition = "serial")
    private Integer UserMessage.id;
    
    public Integer UserMessage.getId() {
        return this.id;
    }
    
    public void UserMessage.setId(Integer id) {
        this.id = id;
    }
    
}

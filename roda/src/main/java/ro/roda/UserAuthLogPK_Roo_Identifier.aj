// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import java.util.Calendar;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import ro.roda.UserAuthLogPK;

privileged aspect UserAuthLogPK_Roo_Identifier {
    
    declare @type: UserAuthLogPK: @Embeddable;
    
    @Column(name = "user_id", columnDefinition = "int4", nullable = false)
    private Integer UserAuthLogPK.userId;
    
    @Column(name = "timestamp", columnDefinition = "timestamp", nullable = false)
    private Calendar UserAuthLogPK.timestamp;
    
    public UserAuthLogPK.new(Integer userId, Calendar timestamp) {
        super();
        this.userId = userId;
        this.timestamp = timestamp;
    }

    private UserAuthLogPK.new() {
        super();
    }

    public Integer UserAuthLogPK.getUserId() {
        return userId;
    }
    
    public Calendar UserAuthLogPK.getTimestamp() {
        return timestamp;
    }
    
}

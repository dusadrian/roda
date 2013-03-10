// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import java.util.Set;
import javax.persistence.Column;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import ro.roda.domain.GroupAuthorities;
import ro.roda.domain.GroupMembers;
import ro.roda.domain.Groups;

privileged aspect Groups_Roo_DbManaged {
    
    @OneToMany(mappedBy = "groupId")
    private Set<GroupAuthorities> Groups.groupAuthoritieses;
    
    @OneToMany(mappedBy = "groupId")
    private Set<GroupMembers> Groups.groupMemberss;
    
    @Column(name = "group_name", columnDefinition = "varchar", length = 64)
    @NotNull
    private String Groups.groupName;
    
    public Set<GroupAuthorities> Groups.getGroupAuthoritieses() {
        return groupAuthoritieses;
    }
    
    public void Groups.setGroupAuthoritieses(Set<GroupAuthorities> groupAuthoritieses) {
        this.groupAuthoritieses = groupAuthoritieses;
    }
    
    public Set<GroupMembers> Groups.getGroupMemberss() {
        return groupMemberss;
    }
    
    public void Groups.setGroupMemberss(Set<GroupMembers> groupMemberss) {
        this.groupMemberss = groupMemberss;
    }
    
    public String Groups.getGroupName() {
        return groupName;
    }
    
    public void Groups.setGroupName(String groupName) {
        this.groupName = groupName;
    }
    
}

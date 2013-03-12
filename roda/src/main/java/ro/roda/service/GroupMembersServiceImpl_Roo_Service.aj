// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ro.roda.domain.GroupMembers;
import ro.roda.service.GroupMembersServiceImpl;

privileged aspect GroupMembersServiceImpl_Roo_Service {
    
    declare @type: GroupMembersServiceImpl: @Service;
    
    declare @type: GroupMembersServiceImpl: @Transactional;
    
    public long GroupMembersServiceImpl.countAllGroupMemberses() {
        return GroupMembers.countGroupMemberses();
    }
    
    public void GroupMembersServiceImpl.deleteGroupMembers(GroupMembers groupMembers) {
        groupMembers.remove();
    }
    
    public GroupMembers GroupMembersServiceImpl.findGroupMembers(Long id) {
        return GroupMembers.findGroupMembers(id);
    }
    
    public List<GroupMembers> GroupMembersServiceImpl.findAllGroupMemberses() {
        return GroupMembers.findAllGroupMemberses();
    }
    
    public List<GroupMembers> GroupMembersServiceImpl.findGroupMembersEntries(int firstResult, int maxResults) {
        return GroupMembers.findGroupMembersEntries(firstResult, maxResults);
    }
    
    public void GroupMembersServiceImpl.saveGroupMembers(GroupMembers groupMembers) {
        groupMembers.persist();
    }
    
    public GroupMembers GroupMembersServiceImpl.updateGroupMembers(GroupMembers groupMembers) {
        return groupMembers.merge();
    }
    
}

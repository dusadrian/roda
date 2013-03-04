// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ro.roda.domain.UserMessage;
import ro.roda.service.UserMessageServiceImpl;

privileged aspect UserMessageServiceImpl_Roo_Service {
    
    declare @type: UserMessageServiceImpl: @Service;
    
    declare @type: UserMessageServiceImpl: @Transactional;
    
    public long UserMessageServiceImpl.countAllUserMessages() {
        return UserMessage.countUserMessages();
    }
    
    public void UserMessageServiceImpl.deleteUserMessage(UserMessage userMessage) {
        userMessage.remove();
    }
    
    public UserMessage UserMessageServiceImpl.findUserMessage(Integer id) {
        return UserMessage.findUserMessage(id);
    }
    
    public List<UserMessage> UserMessageServiceImpl.findAllUserMessages() {
        return UserMessage.findAllUserMessages();
    }
    
    public List<UserMessage> UserMessageServiceImpl.findUserMessageEntries(int firstResult, int maxResults) {
        return UserMessage.findUserMessageEntries(firstResult, maxResults);
    }
    
    public void UserMessageServiceImpl.saveUserMessage(UserMessage userMessage) {
        userMessage.persist();
    }
    
    public UserMessage UserMessageServiceImpl.updateUserMessage(UserMessage userMessage) {
        return userMessage.merge();
    }
    
}

// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import ro.roda.domain.UserMessage;
import ro.roda.service.UserMessageService;

privileged aspect UserMessageService_Roo_Service {
    
    public abstract long UserMessageService.countAllUserMessages();    
    public abstract void UserMessageService.deleteUserMessage(UserMessage userMessage);    
    public abstract UserMessage UserMessageService.findUserMessage(Integer id);    
    public abstract List<UserMessage> UserMessageService.findAllUserMessages();    
    public abstract List<UserMessage> UserMessageService.findUserMessageEntries(int firstResult, int maxResults);    
    public abstract void UserMessageService.saveUserMessage(UserMessage userMessage);    
    public abstract UserMessage UserMessageService.updateUserMessage(UserMessage userMessage);    
}

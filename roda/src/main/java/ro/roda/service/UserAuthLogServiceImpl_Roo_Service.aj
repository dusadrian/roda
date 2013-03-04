// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ro.roda.UserAuthLog;
import ro.roda.UserAuthLogPK;
import ro.roda.service.UserAuthLogServiceImpl;

privileged aspect UserAuthLogServiceImpl_Roo_Service {
    
    declare @type: UserAuthLogServiceImpl: @Service;
    
    declare @type: UserAuthLogServiceImpl: @Transactional;
    
    public long UserAuthLogServiceImpl.countAllUserAuthLogs() {
        return UserAuthLog.countUserAuthLogs();
    }
    
    public void UserAuthLogServiceImpl.deleteUserAuthLog(UserAuthLog userAuthLog) {
        userAuthLog.remove();
    }
    
    public UserAuthLog UserAuthLogServiceImpl.findUserAuthLog(UserAuthLogPK id) {
        return UserAuthLog.findUserAuthLog(id);
    }
    
    public List<UserAuthLog> UserAuthLogServiceImpl.findAllUserAuthLogs() {
        return UserAuthLog.findAllUserAuthLogs();
    }
    
    public List<UserAuthLog> UserAuthLogServiceImpl.findUserAuthLogEntries(int firstResult, int maxResults) {
        return UserAuthLog.findUserAuthLogEntries(firstResult, maxResults);
    }
    
    public void UserAuthLogServiceImpl.saveUserAuthLog(UserAuthLog userAuthLog) {
        userAuthLog.persist();
    }
    
    public UserAuthLog UserAuthLogServiceImpl.updateUserAuthLog(UserAuthLog userAuthLog) {
        return userAuthLog.merge();
    }
    
}
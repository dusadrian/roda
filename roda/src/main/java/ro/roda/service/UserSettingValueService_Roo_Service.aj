// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import ro.roda.UserSettingValue;
import ro.roda.UserSettingValuePK;
import ro.roda.service.UserSettingValueService;

privileged aspect UserSettingValueService_Roo_Service {
    
    public abstract long UserSettingValueService.countAllUserSettingValues();    
    public abstract void UserSettingValueService.deleteUserSettingValue(UserSettingValue userSettingValue);    
    public abstract UserSettingValue UserSettingValueService.findUserSettingValue(UserSettingValuePK id);    
    public abstract List<UserSettingValue> UserSettingValueService.findAllUserSettingValues();    
    public abstract List<UserSettingValue> UserSettingValueService.findUserSettingValueEntries(int firstResult, int maxResults);    
    public abstract void UserSettingValueService.saveUserSettingValue(UserSettingValue userSettingValue);    
    public abstract UserSettingValue UserSettingValueService.updateUserSettingValue(UserSettingValue userSettingValue);    
}

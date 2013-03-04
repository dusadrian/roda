// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import ro.roda.domain.Setting;
import ro.roda.service.SettingService;

privileged aspect SettingService_Roo_Service {
    
    public abstract long SettingService.countAllSettings();    
    public abstract void SettingService.deleteSetting(Setting setting);    
    public abstract Setting SettingService.findSetting(Integer id);    
    public abstract List<Setting> SettingService.findAllSettings();    
    public abstract List<Setting> SettingService.findSettingEntries(int firstResult, int maxResults);    
    public abstract void SettingService.saveSetting(Setting setting);    
    public abstract Setting SettingService.updateSetting(Setting setting);    
}

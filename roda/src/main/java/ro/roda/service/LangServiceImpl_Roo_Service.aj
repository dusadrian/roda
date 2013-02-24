// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ro.roda.Lang;
import ro.roda.service.LangServiceImpl;

privileged aspect LangServiceImpl_Roo_Service {
    
    declare @type: LangServiceImpl: @Service;
    
    declare @type: LangServiceImpl: @Transactional;
    
    public long LangServiceImpl.countAllLangs() {
        return Lang.countLangs();
    }
    
    public void LangServiceImpl.deleteLang(Lang lang) {
        lang.remove();
    }
    
    public Lang LangServiceImpl.findLang(String id) {
        return Lang.findLang(id);
    }
    
    public List<Lang> LangServiceImpl.findAllLangs() {
        return Lang.findAllLangs();
    }
    
    public List<Lang> LangServiceImpl.findLangEntries(int firstResult, int maxResults) {
        return Lang.findLangEntries(firstResult, maxResults);
    }
    
    public void LangServiceImpl.saveLang(Lang lang) {
        lang.persist();
    }
    
    public Lang LangServiceImpl.updateLang(Lang lang) {
        return lang.merge();
    }
    
}

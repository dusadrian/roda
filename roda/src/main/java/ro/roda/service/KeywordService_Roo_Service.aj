// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import ro.roda.Keyword;
import ro.roda.service.KeywordService;

privileged aspect KeywordService_Roo_Service {
    
    public abstract long KeywordService.countAllKeywords();    
    public abstract void KeywordService.deleteKeyword(Keyword keyword);    
    public abstract Keyword KeywordService.findKeyword(Integer id);    
    public abstract List<Keyword> KeywordService.findAllKeywords();    
    public abstract List<Keyword> KeywordService.findKeywordEntries(int firstResult, int maxResults);    
    public abstract void KeywordService.saveKeyword(Keyword keyword);    
    public abstract Keyword KeywordService.updateKeyword(Keyword keyword);    
}
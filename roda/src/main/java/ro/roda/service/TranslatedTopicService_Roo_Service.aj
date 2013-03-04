// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import ro.roda.TranslatedTopic;
import ro.roda.TranslatedTopicPK;
import ro.roda.service.TranslatedTopicService;

privileged aspect TranslatedTopicService_Roo_Service {
    
    public abstract long TranslatedTopicService.countAllTranslatedTopics();    
    public abstract void TranslatedTopicService.deleteTranslatedTopic(TranslatedTopic translatedTopic);    
    public abstract TranslatedTopic TranslatedTopicService.findTranslatedTopic(TranslatedTopicPK id);    
    public abstract List<TranslatedTopic> TranslatedTopicService.findAllTranslatedTopics();    
    public abstract List<TranslatedTopic> TranslatedTopicService.findTranslatedTopicEntries(int firstResult, int maxResults);    
    public abstract void TranslatedTopicService.saveTranslatedTopic(TranslatedTopic translatedTopic);    
    public abstract TranslatedTopic TranslatedTopicService.updateTranslatedTopic(TranslatedTopic translatedTopic);    
}
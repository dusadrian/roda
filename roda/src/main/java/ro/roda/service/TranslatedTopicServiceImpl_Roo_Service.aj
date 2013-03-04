// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ro.roda.domain.TranslatedTopic;
import ro.roda.domain.TranslatedTopicPK;
import ro.roda.service.TranslatedTopicServiceImpl;

privileged aspect TranslatedTopicServiceImpl_Roo_Service {
    
    declare @type: TranslatedTopicServiceImpl: @Service;
    
    declare @type: TranslatedTopicServiceImpl: @Transactional;
    
    public long TranslatedTopicServiceImpl.countAllTranslatedTopics() {
        return TranslatedTopic.countTranslatedTopics();
    }
    
    public void TranslatedTopicServiceImpl.deleteTranslatedTopic(TranslatedTopic translatedTopic) {
        translatedTopic.remove();
    }
    
    public TranslatedTopic TranslatedTopicServiceImpl.findTranslatedTopic(TranslatedTopicPK id) {
        return TranslatedTopic.findTranslatedTopic(id);
    }
    
    public List<TranslatedTopic> TranslatedTopicServiceImpl.findAllTranslatedTopics() {
        return TranslatedTopic.findAllTranslatedTopics();
    }
    
    public List<TranslatedTopic> TranslatedTopicServiceImpl.findTranslatedTopicEntries(int firstResult, int maxResults) {
        return TranslatedTopic.findTranslatedTopicEntries(firstResult, maxResults);
    }
    
    public void TranslatedTopicServiceImpl.saveTranslatedTopic(TranslatedTopic translatedTopic) {
        translatedTopic.persist();
    }
    
    public TranslatedTopic TranslatedTopicServiceImpl.updateTranslatedTopic(TranslatedTopic translatedTopic) {
        return translatedTopic.merge();
    }
    
}

// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import ro.roda.Lang;
import ro.roda.LangDataOnDemand;
import ro.roda.Topic;
import ro.roda.TopicDataOnDemand;
import ro.roda.TranslatedTopic;
import ro.roda.TranslatedTopicDataOnDemand;
import ro.roda.TranslatedTopicPK;
import ro.roda.service.TranslatedTopicService;

privileged aspect TranslatedTopicDataOnDemand_Roo_DataOnDemand {
    
    declare @type: TranslatedTopicDataOnDemand: @Component;
    
    private Random TranslatedTopicDataOnDemand.rnd = new SecureRandom();
    
    private List<TranslatedTopic> TranslatedTopicDataOnDemand.data;
    
    @Autowired
    LangDataOnDemand TranslatedTopicDataOnDemand.langDataOnDemand;
    
    @Autowired
    TopicDataOnDemand TranslatedTopicDataOnDemand.topicDataOnDemand;
    
    @Autowired
    TranslatedTopicService TranslatedTopicDataOnDemand.translatedTopicService;
    
    public TranslatedTopic TranslatedTopicDataOnDemand.getNewTransientTranslatedTopic(int index) {
        TranslatedTopic obj = new TranslatedTopic();
        setEmbeddedIdClass(obj, index);
        setLangId(obj, index);
        setTopicId(obj, index);
        setTranslation(obj, index);
        return obj;
    }
    
    public void TranslatedTopicDataOnDemand.setEmbeddedIdClass(TranslatedTopic obj, int index) {
        String langId = "l" + index;
        if (langId.length() > 2) {
            langId = new Random().nextInt(10) + langId.substring(1, 2);
        }
        Integer topicId = new Integer(index);
        
        TranslatedTopicPK embeddedIdClass = new TranslatedTopicPK(langId, topicId);
        obj.setId(embeddedIdClass);
    }
    
    public void TranslatedTopicDataOnDemand.setLangId(TranslatedTopic obj, int index) {
        Lang langId = langDataOnDemand.getRandomLang();
        obj.setLangId(langId);
    }
    
    public void TranslatedTopicDataOnDemand.setTopicId(TranslatedTopic obj, int index) {
        Topic topicId = topicDataOnDemand.getRandomTopic();
        obj.setTopicId(topicId);
    }
    
    public void TranslatedTopicDataOnDemand.setTranslation(TranslatedTopic obj, int index) {
        String translation = "translation_" + index;
        obj.setTranslation(translation);
    }
    
    public TranslatedTopic TranslatedTopicDataOnDemand.getSpecificTranslatedTopic(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        TranslatedTopic obj = data.get(index);
        TranslatedTopicPK id = obj.getId();
        return translatedTopicService.findTranslatedTopic(id);
    }
    
    public TranslatedTopic TranslatedTopicDataOnDemand.getRandomTranslatedTopic() {
        init();
        TranslatedTopic obj = data.get(rnd.nextInt(data.size()));
        TranslatedTopicPK id = obj.getId();
        return translatedTopicService.findTranslatedTopic(id);
    }
    
    public boolean TranslatedTopicDataOnDemand.modifyTranslatedTopic(TranslatedTopic obj) {
        return false;
    }
    
    public void TranslatedTopicDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = translatedTopicService.findTranslatedTopicEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'TranslatedTopic' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<TranslatedTopic>();
        for (int i = 0; i < 10; i++) {
            TranslatedTopic obj = getNewTransientTranslatedTopic(i);
            try {
                translatedTopicService.saveTranslatedTopic(obj);
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}

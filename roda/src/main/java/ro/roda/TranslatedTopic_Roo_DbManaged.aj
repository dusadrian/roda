// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import ro.roda.Lang;
import ro.roda.Topic;
import ro.roda.TranslatedTopic;

privileged aspect TranslatedTopic_Roo_DbManaged {
    
    @ManyToOne
    @JoinColumn(name = "lang_id", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    private Lang TranslatedTopic.langId;
    
    @ManyToOne
    @JoinColumn(name = "topic_id", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    private Topic TranslatedTopic.topicId;
    
    @Column(name = "translation", columnDefinition = "text")
    @NotNull
    private String TranslatedTopic.translation;
    
    public Lang TranslatedTopic.getLangId() {
        return langId;
    }
    
    public void TranslatedTopic.setLangId(Lang langId) {
        this.langId = langId;
    }
    
    public Topic TranslatedTopic.getTopicId() {
        return topicId;
    }
    
    public void TranslatedTopic.setTopicId(Topic topicId) {
        this.topicId = topicId;
    }
    
    public String TranslatedTopic.getTranslation() {
        return translation;
    }
    
    public void TranslatedTopic.setTranslation(String translation) {
        this.translation = translation;
    }
    
}

// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import ro.roda.domain.TranslatedTopicPK;

privileged aspect TranslatedTopicPK_Roo_Identifier {
    
    declare @type: TranslatedTopicPK: @Embeddable;
    
    @Column(name = "lang_id", columnDefinition = "int4", nullable = false)
    private Integer TranslatedTopicPK.langId;
    
    @Column(name = "topic_id", columnDefinition = "int4", nullable = false)
    private Integer TranslatedTopicPK.topicId;
    
    public TranslatedTopicPK.new(Integer langId, Integer topicId) {
        super();
        this.langId = langId;
        this.topicId = topicId;
    }

    private TranslatedTopicPK.new() {
        super();
    }

    public Integer TranslatedTopicPK.getLangId() {
        return langId;
    }
    
    public Integer TranslatedTopicPK.getTopicId() {
        return topicId;
    }
    
}

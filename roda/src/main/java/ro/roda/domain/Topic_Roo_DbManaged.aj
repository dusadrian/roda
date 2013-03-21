// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import java.util.Set;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import ro.roda.domain.Instance;
import ro.roda.domain.Study;
import ro.roda.domain.Topic;
import ro.roda.domain.TranslatedTopic;

privileged aspect Topic_Roo_DbManaged {
    
    @ManyToMany(mappedBy = "topics1")
    private Set<Instance> Topic.instances1;
    
    @ManyToMany(mappedBy = "topics")
    private Set<Study> Topic.studies;
    
    @OneToMany(mappedBy = "parentId")
    private Set<Topic> Topic.topics;
    
    @OneToMany(mappedBy = "preferredSynonymTopicId")
    private Set<Topic> Topic.topics1;
    
    @OneToMany(mappedBy = "topicId")
    private Set<TranslatedTopic> Topic.translatedTopics;
    
    @ManyToOne
    @JoinColumn(name = "parent_id", referencedColumnName = "id", insertable = false, updatable = false)
    private Topic Topic.parentId;
    
    @ManyToOne
    @JoinColumn(name = "preferred_synonym_topic_id", referencedColumnName = "id", insertable = false, updatable = false)
    private Topic Topic.preferredSynonymTopicId;
    
    @Column(name = "name", columnDefinition = "varchar", length = 100)
    @NotNull
    private String Topic.name;
    
    @Column(name = "description", columnDefinition = "text")
    private String Topic.description;
    
    public Set<Instance> Topic.getInstances1() {
        return instances1;
    }
    
    public void Topic.setInstances1(Set<Instance> instances1) {
        this.instances1 = instances1;
    }
    
    public Set<Study> Topic.getStudies() {
        return studies;
    }
    
    public void Topic.setStudies(Set<Study> studies) {
        this.studies = studies;
    }
    
    public Set<Topic> Topic.getTopics() {
        return topics;
    }
    
    public void Topic.setTopics(Set<Topic> topics) {
        this.topics = topics;
    }
    
    public Set<Topic> Topic.getTopics1() {
        return topics1;
    }
    
    public void Topic.setTopics1(Set<Topic> topics1) {
        this.topics1 = topics1;
    }
    
    public Set<TranslatedTopic> Topic.getTranslatedTopics() {
        return translatedTopics;
    }
    
    public void Topic.setTranslatedTopics(Set<TranslatedTopic> translatedTopics) {
        this.translatedTopics = translatedTopics;
    }
    
    public Topic Topic.getParentId() {
        return parentId;
    }
    
    public void Topic.setParentId(Topic parentId) {
        this.parentId = parentId;
    }
    
    public Topic Topic.getPreferredSynonymTopicId() {
        return preferredSynonymTopicId;
    }
    
    public void Topic.setPreferredSynonymTopicId(Topic preferredSynonymTopicId) {
        this.preferredSynonymTopicId = preferredSynonymTopicId;
    }
    
    public String Topic.getName() {
        return name;
    }
    
    public void Topic.setName(String name) {
        this.name = name;
    }
    
    public String Topic.getDescription() {
        return description;
    }
    
    public void Topic.setDescription(String description) {
        this.description = description;
    }
    
}

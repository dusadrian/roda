// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;
import ro.roda.domain.Study;

privileged aspect Study_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Study.entityManager;
    
    public static final EntityManager Study.entityManager() {
        EntityManager em = new Study().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Study.countStudys() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Study o", Long.class).getSingleResult();
    }
    
    public static List<Study> Study.findAllStudys() {
        return entityManager().createQuery("SELECT o FROM Study o", Study.class).getResultList();
    }
    
    public static Study Study.findStudy(Integer id) {
        if (id == null) return null;
        return entityManager().find(Study.class, id);
    }
    
    public static List<Study> Study.findStudyEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Study o", Study.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Study.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Study.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Study attached = Study.findStudy(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Study.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Study.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Study Study.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Study merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}

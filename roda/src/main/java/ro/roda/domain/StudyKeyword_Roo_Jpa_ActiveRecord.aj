// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;
import ro.roda.domain.StudyKeyword;
import ro.roda.domain.StudyKeywordPK;

privileged aspect StudyKeyword_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager StudyKeyword.entityManager;
    
    public static final EntityManager StudyKeyword.entityManager() {
        EntityManager em = new StudyKeyword().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long StudyKeyword.countStudyKeywords() {
        return entityManager().createQuery("SELECT COUNT(o) FROM StudyKeyword o", Long.class).getSingleResult();
    }
    
    public static List<StudyKeyword> StudyKeyword.findAllStudyKeywords() {
        return entityManager().createQuery("SELECT o FROM StudyKeyword o", StudyKeyword.class).getResultList();
    }
    
    public static StudyKeyword StudyKeyword.findStudyKeyword(StudyKeywordPK id) {
        if (id == null) return null;
        return entityManager().find(StudyKeyword.class, id);
    }
    
    public static List<StudyKeyword> StudyKeyword.findStudyKeywordEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM StudyKeyword o", StudyKeyword.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void StudyKeyword.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void StudyKeyword.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            StudyKeyword attached = StudyKeyword.findStudyKeyword(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void StudyKeyword.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void StudyKeyword.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public StudyKeyword StudyKeyword.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        StudyKeyword merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}

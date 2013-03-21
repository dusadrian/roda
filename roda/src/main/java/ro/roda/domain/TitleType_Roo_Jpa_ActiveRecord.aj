// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;
import ro.roda.domain.TitleType;

privileged aspect TitleType_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager TitleType.entityManager;
    
    public static final EntityManager TitleType.entityManager() {
        EntityManager em = new TitleType().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long TitleType.countTitleTypes() {
        return entityManager().createQuery("SELECT COUNT(o) FROM TitleType o", Long.class).getSingleResult();
    }
    
    public static List<TitleType> TitleType.findAllTitleTypes() {
        return entityManager().createQuery("SELECT o FROM TitleType o", TitleType.class).getResultList();
    }
    
    public static TitleType TitleType.findTitleType(Integer id) {
        if (id == null) return null;
        return entityManager().find(TitleType.class, id);
    }
    
    public static List<TitleType> TitleType.findTitleTypeEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM TitleType o", TitleType.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void TitleType.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void TitleType.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            TitleType attached = TitleType.findTitleType(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void TitleType.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void TitleType.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public TitleType TitleType.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        TitleType merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}

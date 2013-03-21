// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;
import ro.roda.domain.Scale;

privileged aspect Scale_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Scale.entityManager;
    
    public static final EntityManager Scale.entityManager() {
        EntityManager em = new Scale().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Scale.countScales() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Scale o", Long.class).getSingleResult();
    }
    
    public static List<Scale> Scale.findAllScales() {
        return entityManager().createQuery("SELECT o FROM Scale o", Scale.class).getResultList();
    }
    
    public static Scale Scale.findScale(Long itemId) {
        if (itemId == null) return null;
        return entityManager().find(Scale.class, itemId);
    }
    
    public static List<Scale> Scale.findScaleEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Scale o", Scale.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Scale.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Scale.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Scale attached = Scale.findScale(this.itemId);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Scale.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Scale.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Scale Scale.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Scale merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}

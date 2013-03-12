// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;
import ro.roda.domain.Source;

privileged aspect Source_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Source.entityManager;
    
    public static final EntityManager Source.entityManager() {
        EntityManager em = new Source().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Source.countSources() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Source o", Long.class).getSingleResult();
    }
    
    public static List<Source> Source.findAllSources() {
        return entityManager().createQuery("SELECT o FROM Source o", Source.class).getResultList();
    }
    
    public static Source Source.findSource(Integer orgId) {
        if (orgId == null) return null;
        return entityManager().find(Source.class, orgId);
    }
    
    public static List<Source> Source.findSourceEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Source o", Source.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Source.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Source.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Source attached = Source.findSource(this.orgId);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Source.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Source.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Source Source.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Source merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
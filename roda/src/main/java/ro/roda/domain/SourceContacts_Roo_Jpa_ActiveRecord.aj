// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;
import ro.roda.domain.SourceContacts;

privileged aspect SourceContacts_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager SourceContacts.entityManager;
    
    public static final EntityManager SourceContacts.entityManager() {
        EntityManager em = new SourceContacts().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long SourceContacts.countSourceContactses() {
        return entityManager().createQuery("SELECT COUNT(o) FROM SourceContacts o", Long.class).getSingleResult();
    }
    
    public static List<SourceContacts> SourceContacts.findAllSourceContactses() {
        return entityManager().createQuery("SELECT o FROM SourceContacts o", SourceContacts.class).getResultList();
    }
    
    public static SourceContacts SourceContacts.findSourceContacts(Integer id) {
        if (id == null) return null;
        return entityManager().find(SourceContacts.class, id);
    }
    
    public static List<SourceContacts> SourceContacts.findSourceContactsEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM SourceContacts o", SourceContacts.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void SourceContacts.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void SourceContacts.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            SourceContacts attached = SourceContacts.findSourceContacts(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void SourceContacts.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void SourceContacts.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public SourceContacts SourceContacts.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        SourceContacts merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
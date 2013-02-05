// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;
import ro.roda.InstanceDescr;
import ro.roda.InstanceDescrPK;

privileged aspect InstanceDescr_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager InstanceDescr.entityManager;
    
    public static final EntityManager InstanceDescr.entityManager() {
        EntityManager em = new InstanceDescr().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long InstanceDescr.countInstanceDescrs() {
        return entityManager().createQuery("SELECT COUNT(o) FROM InstanceDescr o", Long.class).getSingleResult();
    }
    
    public static List<InstanceDescr> InstanceDescr.findAllInstanceDescrs() {
        return entityManager().createQuery("SELECT o FROM InstanceDescr o", InstanceDescr.class).getResultList();
    }
    
    public static InstanceDescr InstanceDescr.findInstanceDescr(InstanceDescrPK id) {
        if (id == null) return null;
        return entityManager().find(InstanceDescr.class, id);
    }
    
    public static List<InstanceDescr> InstanceDescr.findInstanceDescrEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM InstanceDescr o", InstanceDescr.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void InstanceDescr.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void InstanceDescr.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            InstanceDescr attached = InstanceDescr.findInstanceDescr(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void InstanceDescr.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void InstanceDescr.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public InstanceDescr InstanceDescr.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        InstanceDescr merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}

// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;
import ro.roda.domain.Rodauser;

privileged aspect Rodauser_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Rodauser.entityManager;
    
    public static final EntityManager Rodauser.entityManager() {
        EntityManager em = new Rodauser().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Rodauser.countRodausers() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Rodauser o", Long.class).getSingleResult();
    }
    
    public static List<Rodauser> Rodauser.findAllRodausers() {
        return entityManager().createQuery("SELECT o FROM Rodauser o", Rodauser.class).getResultList();
    }
    
    public static Rodauser Rodauser.findRodauser(Integer id) {
        if (id == null) return null;
        return entityManager().find(Rodauser.class, id);
    }
    
    public static List<Rodauser> Rodauser.findRodauserEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Rodauser o", Rodauser.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Rodauser.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Rodauser.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Rodauser attached = Rodauser.findRodauser(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Rodauser.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Rodauser.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Rodauser Rodauser.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Rodauser merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
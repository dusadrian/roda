// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;
import ro.roda.AclSid;

privileged aspect AclSid_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager AclSid.entityManager;
    
    public static final EntityManager AclSid.entityManager() {
        EntityManager em = new AclSid().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long AclSid.countAclSids() {
        return entityManager().createQuery("SELECT COUNT(o) FROM AclSid o", Long.class).getSingleResult();
    }
    
    public static List<AclSid> AclSid.findAllAclSids() {
        return entityManager().createQuery("SELECT o FROM AclSid o", AclSid.class).getResultList();
    }
    
    public static AclSid AclSid.findAclSid(Long id) {
        if (id == null) return null;
        return entityManager().find(AclSid.class, id);
    }
    
    public static List<AclSid> AclSid.findAclSidEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM AclSid o", AclSid.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void AclSid.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void AclSid.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            AclSid attached = AclSid.findAclSid(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void AclSid.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void AclSid.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public AclSid AclSid.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        AclSid merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}

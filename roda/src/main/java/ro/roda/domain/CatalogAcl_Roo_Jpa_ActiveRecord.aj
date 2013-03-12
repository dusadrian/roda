// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;
import ro.roda.domain.CatalogAcl;
import ro.roda.domain.CatalogAclPK;

privileged aspect CatalogAcl_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager CatalogAcl.entityManager;
    
    public static final EntityManager CatalogAcl.entityManager() {
        EntityManager em = new CatalogAcl().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long CatalogAcl.countCatalogAcls() {
        return entityManager().createQuery("SELECT COUNT(o) FROM CatalogAcl o", Long.class).getSingleResult();
    }
    
    public static List<CatalogAcl> CatalogAcl.findAllCatalogAcls() {
        return entityManager().createQuery("SELECT o FROM CatalogAcl o", CatalogAcl.class).getResultList();
    }
    
    public static CatalogAcl CatalogAcl.findCatalogAcl(CatalogAclPK id) {
        if (id == null) return null;
        return entityManager().find(CatalogAcl.class, id);
    }
    
    public static List<CatalogAcl> CatalogAcl.findCatalogAclEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM CatalogAcl o", CatalogAcl.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void CatalogAcl.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void CatalogAcl.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            CatalogAcl attached = CatalogAcl.findCatalogAcl(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void CatalogAcl.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void CatalogAcl.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public CatalogAcl CatalogAcl.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        CatalogAcl merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
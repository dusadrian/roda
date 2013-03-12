// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;
import ro.roda.domain.CmsLayoutGroup;

privileged aspect CmsLayoutGroup_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager CmsLayoutGroup.entityManager;
    
    public static final EntityManager CmsLayoutGroup.entityManager() {
        EntityManager em = new CmsLayoutGroup().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long CmsLayoutGroup.countCmsLayoutGroups() {
        return entityManager().createQuery("SELECT COUNT(o) FROM CmsLayoutGroup o", Long.class).getSingleResult();
    }
    
    public static List<CmsLayoutGroup> CmsLayoutGroup.findAllCmsLayoutGroups() {
        return entityManager().createQuery("SELECT o FROM CmsLayoutGroup o", CmsLayoutGroup.class).getResultList();
    }
    
    public static CmsLayoutGroup CmsLayoutGroup.findCmsLayoutGroup(Integer id) {
        if (id == null) return null;
        return entityManager().find(CmsLayoutGroup.class, id);
    }
    
    public static List<CmsLayoutGroup> CmsLayoutGroup.findCmsLayoutGroupEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM CmsLayoutGroup o", CmsLayoutGroup.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void CmsLayoutGroup.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void CmsLayoutGroup.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            CmsLayoutGroup attached = CmsLayoutGroup.findCmsLayoutGroup(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void CmsLayoutGroup.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void CmsLayoutGroup.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public CmsLayoutGroup CmsLayoutGroup.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        CmsLayoutGroup merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
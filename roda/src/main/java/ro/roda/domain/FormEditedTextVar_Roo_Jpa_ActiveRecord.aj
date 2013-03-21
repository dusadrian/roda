// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;
import ro.roda.domain.FormEditedTextVar;
import ro.roda.domain.FormEditedTextVarPK;

privileged aspect FormEditedTextVar_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager FormEditedTextVar.entityManager;
    
    public static final EntityManager FormEditedTextVar.entityManager() {
        EntityManager em = new FormEditedTextVar().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long FormEditedTextVar.countFormEditedTextVars() {
        return entityManager().createQuery("SELECT COUNT(o) FROM FormEditedTextVar o", Long.class).getSingleResult();
    }
    
    public static List<FormEditedTextVar> FormEditedTextVar.findAllFormEditedTextVars() {
        return entityManager().createQuery("SELECT o FROM FormEditedTextVar o", FormEditedTextVar.class).getResultList();
    }
    
    public static FormEditedTextVar FormEditedTextVar.findFormEditedTextVar(FormEditedTextVarPK id) {
        if (id == null) return null;
        return entityManager().find(FormEditedTextVar.class, id);
    }
    
    public static List<FormEditedTextVar> FormEditedTextVar.findFormEditedTextVarEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM FormEditedTextVar o", FormEditedTextVar.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void FormEditedTextVar.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void FormEditedTextVar.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            FormEditedTextVar attached = FormEditedTextVar.findFormEditedTextVar(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void FormEditedTextVar.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void FormEditedTextVar.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public FormEditedTextVar FormEditedTextVar.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        FormEditedTextVar merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}

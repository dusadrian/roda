// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;
import ro.roda.Concept;

privileged aspect Concept_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Concept.entityManager;
    
    public static final EntityManager Concept.entityManager() {
        EntityManager em = new Concept().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Concept.countConcepts() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Concept o", Long.class).getSingleResult();
    }
    
    public static List<Concept> Concept.findAllConcepts() {
        return entityManager().createQuery("SELECT o FROM Concept o", Concept.class).getResultList();
    }
    
    public static Concept Concept.findConcept(Integer id) {
        if (id == null) return null;
        return entityManager().find(Concept.class, id);
    }
    
    public static List<Concept> Concept.findConceptEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Concept o", Concept.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Concept.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Concept.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Concept attached = Concept.findConcept(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Concept.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Concept.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Concept Concept.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Concept merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
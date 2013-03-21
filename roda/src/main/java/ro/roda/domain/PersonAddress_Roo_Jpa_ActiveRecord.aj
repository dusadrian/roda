// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;
import ro.roda.domain.PersonAddress;
import ro.roda.domain.PersonAddressPK;

privileged aspect PersonAddress_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager PersonAddress.entityManager;
    
    public static final EntityManager PersonAddress.entityManager() {
        EntityManager em = new PersonAddress().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long PersonAddress.countPersonAddresses() {
        return entityManager().createQuery("SELECT COUNT(o) FROM PersonAddress o", Long.class).getSingleResult();
    }
    
    public static List<PersonAddress> PersonAddress.findAllPersonAddresses() {
        return entityManager().createQuery("SELECT o FROM PersonAddress o", PersonAddress.class).getResultList();
    }
    
    public static PersonAddress PersonAddress.findPersonAddress(PersonAddressPK id) {
        if (id == null) return null;
        return entityManager().find(PersonAddress.class, id);
    }
    
    public static List<PersonAddress> PersonAddress.findPersonAddressEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM PersonAddress o", PersonAddress.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void PersonAddress.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void PersonAddress.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            PersonAddress attached = PersonAddress.findPersonAddress(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void PersonAddress.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void PersonAddress.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public PersonAddress PersonAddress.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        PersonAddress merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}

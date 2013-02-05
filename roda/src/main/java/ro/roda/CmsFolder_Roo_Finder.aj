// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import ro.roda.CmsFolder;

privileged aspect CmsFolder_Roo_Finder {
    
    public static TypedQuery<CmsFolder> CmsFolder.findCmsFoldersByNameEquals(String name) {
        if (name == null || name.length() == 0) throw new IllegalArgumentException("The name argument is required");
        EntityManager em = CmsFolder.entityManager();
        TypedQuery<CmsFolder> q = em.createQuery("SELECT o FROM CmsFolder AS o WHERE o.name = :name", CmsFolder.class);
        q.setParameter("name", name);
        return q;
    }
    
}

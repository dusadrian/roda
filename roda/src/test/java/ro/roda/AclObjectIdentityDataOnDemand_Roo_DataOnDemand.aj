// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import ro.roda.AclClassDataOnDemand;
import ro.roda.AclObjectIdentity;
import ro.roda.AclObjectIdentityDataOnDemand;
import ro.roda.AclSidDataOnDemand;

privileged aspect AclObjectIdentityDataOnDemand_Roo_DataOnDemand {
    
    declare @type: AclObjectIdentityDataOnDemand: @Component;
    
    private Random AclObjectIdentityDataOnDemand.rnd = new SecureRandom();
    
    private List<AclObjectIdentity> AclObjectIdentityDataOnDemand.data;
    
    @Autowired
    private AclClassDataOnDemand AclObjectIdentityDataOnDemand.aclClassDataOnDemand;
    
    @Autowired
    private AclSidDataOnDemand AclObjectIdentityDataOnDemand.aclSidDataOnDemand;
    
    public AclObjectIdentity AclObjectIdentityDataOnDemand.getNewTransientAclObjectIdentity(int index) {
        AclObjectIdentity obj = new AclObjectIdentity();
        setEntriesInheriting(obj, index);
        setObjectIdIdentity(obj, index);
        setParentObject(obj, index);
        return obj;
    }
    
    public void AclObjectIdentityDataOnDemand.setEntriesInheriting(AclObjectIdentity obj, int index) {
        Boolean entriesInheriting = true;
        obj.setEntriesInheriting(entriesInheriting);
    }
    
    public void AclObjectIdentityDataOnDemand.setObjectIdIdentity(AclObjectIdentity obj, int index) {
        Long objectIdIdentity = new Integer(index).longValue();
        obj.setObjectIdIdentity(objectIdIdentity);
    }
    
    public void AclObjectIdentityDataOnDemand.setParentObject(AclObjectIdentity obj, int index) {
        AclObjectIdentity parentObject = obj;
        obj.setParentObject(parentObject);
    }
    
    public AclObjectIdentity AclObjectIdentityDataOnDemand.getSpecificAclObjectIdentity(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        AclObjectIdentity obj = data.get(index);
        Long id = obj.getId();
        return AclObjectIdentity.findAclObjectIdentity(id);
    }
    
    public AclObjectIdentity AclObjectIdentityDataOnDemand.getRandomAclObjectIdentity() {
        init();
        AclObjectIdentity obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return AclObjectIdentity.findAclObjectIdentity(id);
    }
    
    public boolean AclObjectIdentityDataOnDemand.modifyAclObjectIdentity(AclObjectIdentity obj) {
        return false;
    }
    
    public void AclObjectIdentityDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = AclObjectIdentity.findAclObjectIdentityEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'AclObjectIdentity' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<AclObjectIdentity>();
        for (int i = 0; i < 10; i++) {
            AclObjectIdentity obj = getNewTransientAclObjectIdentity(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
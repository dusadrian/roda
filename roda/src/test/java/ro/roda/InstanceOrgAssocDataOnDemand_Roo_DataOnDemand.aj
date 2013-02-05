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
import org.springframework.stereotype.Component;
import ro.roda.InstanceOrgAssoc;
import ro.roda.InstanceOrgAssocDataOnDemand;

privileged aspect InstanceOrgAssocDataOnDemand_Roo_DataOnDemand {
    
    declare @type: InstanceOrgAssocDataOnDemand: @Component;
    
    private Random InstanceOrgAssocDataOnDemand.rnd = new SecureRandom();
    
    private List<InstanceOrgAssoc> InstanceOrgAssocDataOnDemand.data;
    
    public InstanceOrgAssoc InstanceOrgAssocDataOnDemand.getNewTransientInstanceOrgAssoc(int index) {
        InstanceOrgAssoc obj = new InstanceOrgAssoc();
        setAssocDescription(obj, index);
        setAssocName(obj, index);
        return obj;
    }
    
    public void InstanceOrgAssocDataOnDemand.setAssocDescription(InstanceOrgAssoc obj, int index) {
        String assocDescription = "assocDescription_" + index;
        obj.setAssocDescription(assocDescription);
    }
    
    public void InstanceOrgAssocDataOnDemand.setAssocName(InstanceOrgAssoc obj, int index) {
        String assocName = "assocName_" + index;
        if (assocName.length() > 100) {
            assocName = assocName.substring(0, 100);
        }
        obj.setAssocName(assocName);
    }
    
    public InstanceOrgAssoc InstanceOrgAssocDataOnDemand.getSpecificInstanceOrgAssoc(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        InstanceOrgAssoc obj = data.get(index);
        Integer id = obj.getId();
        return InstanceOrgAssoc.findInstanceOrgAssoc(id);
    }
    
    public InstanceOrgAssoc InstanceOrgAssocDataOnDemand.getRandomInstanceOrgAssoc() {
        init();
        InstanceOrgAssoc obj = data.get(rnd.nextInt(data.size()));
        Integer id = obj.getId();
        return InstanceOrgAssoc.findInstanceOrgAssoc(id);
    }
    
    public boolean InstanceOrgAssocDataOnDemand.modifyInstanceOrgAssoc(InstanceOrgAssoc obj) {
        return false;
    }
    
    public void InstanceOrgAssocDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = InstanceOrgAssoc.findInstanceOrgAssocEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'InstanceOrgAssoc' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<InstanceOrgAssoc>();
        for (int i = 0; i < 10; i++) {
            InstanceOrgAssoc obj = getNewTransientInstanceOrgAssoc(i);
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

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
import ro.roda.AclSid;
import ro.roda.AclSidDataOnDemand;
import ro.roda.service.AclSidService;

privileged aspect AclSidDataOnDemand_Roo_DataOnDemand {
    
    declare @type: AclSidDataOnDemand: @Component;
    
    private Random AclSidDataOnDemand.rnd = new SecureRandom();
    
    private List<AclSid> AclSidDataOnDemand.data;
    
    @Autowired
    AclSidService AclSidDataOnDemand.aclSidService;
    
    public AclSid AclSidDataOnDemand.getNewTransientAclSid(int index) {
        AclSid obj = new AclSid();
        setPrincipal(obj, index);
        setSid(obj, index);
        return obj;
    }
    
    public void AclSidDataOnDemand.setPrincipal(AclSid obj, int index) {
        Boolean principal = true;
        obj.setPrincipal(principal);
    }
    
    public void AclSidDataOnDemand.setSid(AclSid obj, int index) {
        String sid = "sid_" + index;
        obj.setSid(sid);
    }
    
    public AclSid AclSidDataOnDemand.getSpecificAclSid(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        AclSid obj = data.get(index);
        Long id = obj.getId();
        return aclSidService.findAclSid(id);
    }
    
    public AclSid AclSidDataOnDemand.getRandomAclSid() {
        init();
        AclSid obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return aclSidService.findAclSid(id);
    }
    
    public boolean AclSidDataOnDemand.modifyAclSid(AclSid obj) {
        return false;
    }
    
    public void AclSidDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = aclSidService.findAclSidEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'AclSid' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<AclSid>();
        for (int i = 0; i < 10; i++) {
            AclSid obj = getNewTransientAclSid(i);
            try {
                aclSidService.saveAclSid(obj);
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

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
import ro.roda.OrgPrefix;
import ro.roda.OrgPrefixDataOnDemand;
import ro.roda.service.OrgPrefixService;

privileged aspect OrgPrefixDataOnDemand_Roo_DataOnDemand {
    
    declare @type: OrgPrefixDataOnDemand: @Component;
    
    private Random OrgPrefixDataOnDemand.rnd = new SecureRandom();
    
    private List<OrgPrefix> OrgPrefixDataOnDemand.data;
    
    @Autowired
    OrgPrefixService OrgPrefixDataOnDemand.orgPrefixService;
    
    public OrgPrefix OrgPrefixDataOnDemand.getNewTransientOrgPrefix(int index) {
        OrgPrefix obj = new OrgPrefix();
        setDescription(obj, index);
        setName(obj, index);
        return obj;
    }
    
    public void OrgPrefixDataOnDemand.setDescription(OrgPrefix obj, int index) {
        String description = "description_" + index;
        obj.setDescription(description);
    }
    
    public void OrgPrefixDataOnDemand.setName(OrgPrefix obj, int index) {
        String name = "name_" + index;
        if (name.length() > 100) {
            name = name.substring(0, 100);
        }
        obj.setName(name);
    }
    
    public OrgPrefix OrgPrefixDataOnDemand.getSpecificOrgPrefix(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        OrgPrefix obj = data.get(index);
        Integer id = obj.getId();
        return orgPrefixService.findOrgPrefix(id);
    }
    
    public OrgPrefix OrgPrefixDataOnDemand.getRandomOrgPrefix() {
        init();
        OrgPrefix obj = data.get(rnd.nextInt(data.size()));
        Integer id = obj.getId();
        return orgPrefixService.findOrgPrefix(id);
    }
    
    public boolean OrgPrefixDataOnDemand.modifyOrgPrefix(OrgPrefix obj) {
        return false;
    }
    
    public void OrgPrefixDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = orgPrefixService.findOrgPrefixEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'OrgPrefix' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<OrgPrefix>();
        for (int i = 0; i < 10; i++) {
            OrgPrefix obj = getNewTransientOrgPrefix(i);
            try {
                orgPrefixService.saveOrgPrefix(obj);
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

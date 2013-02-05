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
import ro.roda.InstanceDataOnDemand;
import ro.roda.InstanceOrg;
import ro.roda.InstanceOrgAssocDataOnDemand;
import ro.roda.InstanceOrgDataOnDemand;
import ro.roda.InstanceOrgPK;
import ro.roda.OrgDataOnDemand;

privileged aspect InstanceOrgDataOnDemand_Roo_DataOnDemand {
    
    declare @type: InstanceOrgDataOnDemand: @Component;
    
    private Random InstanceOrgDataOnDemand.rnd = new SecureRandom();
    
    private List<InstanceOrg> InstanceOrgDataOnDemand.data;
    
    @Autowired
    private InstanceOrgAssocDataOnDemand InstanceOrgDataOnDemand.instanceOrgAssocDataOnDemand;
    
    @Autowired
    private InstanceDataOnDemand InstanceOrgDataOnDemand.instanceDataOnDemand;
    
    @Autowired
    private OrgDataOnDemand InstanceOrgDataOnDemand.orgDataOnDemand;
    
    public InstanceOrg InstanceOrgDataOnDemand.getNewTransientInstanceOrg(int index) {
        InstanceOrg obj = new InstanceOrg();
        setEmbeddedIdClass(obj, index);
        setAssocDetails(obj, index);
        setCitation(obj, index);
        return obj;
    }
    
    public void InstanceOrgDataOnDemand.setEmbeddedIdClass(InstanceOrg obj, int index) {
        Integer orgId = new Integer(index);
        Integer instanceId = new Integer(index);
        Integer assocTypeId = new Integer(index);
        
        InstanceOrgPK embeddedIdClass = new InstanceOrgPK(orgId, instanceId, assocTypeId);
        obj.setId(embeddedIdClass);
    }
    
    public void InstanceOrgDataOnDemand.setAssocDetails(InstanceOrg obj, int index) {
        String assocDetails = "assocDetails_" + index;
        obj.setAssocDetails(assocDetails);
    }
    
    public void InstanceOrgDataOnDemand.setCitation(InstanceOrg obj, int index) {
        String citation = "citation_" + index;
        obj.setCitation(citation);
    }
    
    public InstanceOrg InstanceOrgDataOnDemand.getSpecificInstanceOrg(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        InstanceOrg obj = data.get(index);
        InstanceOrgPK id = obj.getId();
        return InstanceOrg.findInstanceOrg(id);
    }
    
    public InstanceOrg InstanceOrgDataOnDemand.getRandomInstanceOrg() {
        init();
        InstanceOrg obj = data.get(rnd.nextInt(data.size()));
        InstanceOrgPK id = obj.getId();
        return InstanceOrg.findInstanceOrg(id);
    }
    
    public boolean InstanceOrgDataOnDemand.modifyInstanceOrg(InstanceOrg obj) {
        return false;
    }
    
    public void InstanceOrgDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = InstanceOrg.findInstanceOrgEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'InstanceOrg' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<InstanceOrg>();
        for (int i = 0; i < 10; i++) {
            InstanceOrg obj = getNewTransientInstanceOrg(i);
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
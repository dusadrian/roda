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
import ro.roda.InstanceDescr;
import ro.roda.InstanceDescrDataOnDemand;
import ro.roda.InstanceDescrPK;
import ro.roda.LangDataOnDemand;

privileged aspect InstanceDescrDataOnDemand_Roo_DataOnDemand {
    
    declare @type: InstanceDescrDataOnDemand: @Component;
    
    private Random InstanceDescrDataOnDemand.rnd = new SecureRandom();
    
    private List<InstanceDescr> InstanceDescrDataOnDemand.data;
    
    @Autowired
    private InstanceDataOnDemand InstanceDescrDataOnDemand.instanceDataOnDemand;
    
    @Autowired
    private LangDataOnDemand InstanceDescrDataOnDemand.langDataOnDemand;
    
    public InstanceDescr InstanceDescrDataOnDemand.getNewTransientInstanceDescr(int index) {
        InstanceDescr obj = new InstanceDescr();
        setEmbeddedIdClass(obj, index);
        setAbstract1(obj, index);
        setResearchInstrument(obj, index);
        setScope(obj, index);
        setTitle(obj, index);
        setUniverse(obj, index);
        setWeighting(obj, index);
        return obj;
    }
    
    public void InstanceDescrDataOnDemand.setEmbeddedIdClass(InstanceDescr obj, int index) {
        Integer instanceId = new Integer(index);
        String langId = "l" + index;
        if (langId.length() > 2) {
            langId = new Random().nextInt(10) + langId.substring(1, 2);
        }
        
        InstanceDescrPK embeddedIdClass = new InstanceDescrPK(instanceId, langId);
        obj.setId(embeddedIdClass);
    }
    
    public void InstanceDescrDataOnDemand.setAbstract1(InstanceDescr obj, int index) {
        String abstract1 = "abstract1_" + index;
        obj.setAbstract1(abstract1);
    }
    
    public void InstanceDescrDataOnDemand.setResearchInstrument(InstanceDescr obj, int index) {
        String researchInstrument = "researchInstrument_" + index;
        obj.setResearchInstrument(researchInstrument);
    }
    
    public void InstanceDescrDataOnDemand.setScope(InstanceDescr obj, int index) {
        String scope = "scope_" + index;
        obj.setScope(scope);
    }
    
    public void InstanceDescrDataOnDemand.setTitle(InstanceDescr obj, int index) {
        String title = "title_" + index;
        obj.setTitle(title);
    }
    
    public void InstanceDescrDataOnDemand.setUniverse(InstanceDescr obj, int index) {
        String universe = "universe_" + index;
        obj.setUniverse(universe);
    }
    
    public void InstanceDescrDataOnDemand.setWeighting(InstanceDescr obj, int index) {
        String weighting = "weighting_" + index;
        obj.setWeighting(weighting);
    }
    
    public InstanceDescr InstanceDescrDataOnDemand.getSpecificInstanceDescr(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        InstanceDescr obj = data.get(index);
        InstanceDescrPK id = obj.getId();
        return InstanceDescr.findInstanceDescr(id);
    }
    
    public InstanceDescr InstanceDescrDataOnDemand.getRandomInstanceDescr() {
        init();
        InstanceDescr obj = data.get(rnd.nextInt(data.size()));
        InstanceDescrPK id = obj.getId();
        return InstanceDescr.findInstanceDescr(id);
    }
    
    public boolean InstanceDescrDataOnDemand.modifyInstanceDescr(InstanceDescr obj) {
        return false;
    }
    
    public void InstanceDescrDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = InstanceDescr.findInstanceDescrEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'InstanceDescr' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<InstanceDescr>();
        for (int i = 0; i < 10; i++) {
            InstanceDescr obj = getNewTransientInstanceDescr(i);
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

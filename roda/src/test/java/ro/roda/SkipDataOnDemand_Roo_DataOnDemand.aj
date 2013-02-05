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
import ro.roda.Skip;
import ro.roda.SkipDataOnDemand;
import ro.roda.VariableDataOnDemand;

privileged aspect SkipDataOnDemand_Roo_DataOnDemand {
    
    declare @type: SkipDataOnDemand: @Component;
    
    private Random SkipDataOnDemand.rnd = new SecureRandom();
    
    private List<Skip> SkipDataOnDemand.data;
    
    @Autowired
    private VariableDataOnDemand SkipDataOnDemand.variableDataOnDemand;
    
    public Skip SkipDataOnDemand.getNewTransientSkip(int index) {
        Skip obj = new Skip();
        setCondition(obj, index);
        return obj;
    }
    
    public void SkipDataOnDemand.setCondition(Skip obj, int index) {
        String condition = "condition_" + index;
        obj.setCondition(condition);
    }
    
    public Skip SkipDataOnDemand.getSpecificSkip(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Skip obj = data.get(index);
        Long id = obj.getId();
        return Skip.findSkip(id);
    }
    
    public Skip SkipDataOnDemand.getRandomSkip() {
        init();
        Skip obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Skip.findSkip(id);
    }
    
    public boolean SkipDataOnDemand.modifySkip(Skip obj) {
        return false;
    }
    
    public void SkipDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Skip.findSkipEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Skip' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Skip>();
        for (int i = 0; i < 10; i++) {
            Skip obj = getNewTransientSkip(i);
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

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
import ro.roda.SamplingProcedure;
import ro.roda.SamplingProcedureDataOnDemand;

privileged aspect SamplingProcedureDataOnDemand_Roo_DataOnDemand {
    
    declare @type: SamplingProcedureDataOnDemand: @Component;
    
    private Random SamplingProcedureDataOnDemand.rnd = new SecureRandom();
    
    private List<SamplingProcedure> SamplingProcedureDataOnDemand.data;
    
    public SamplingProcedure SamplingProcedureDataOnDemand.getNewTransientSamplingProcedure(int index) {
        SamplingProcedure obj = new SamplingProcedure();
        setDescription(obj, index);
        setName(obj, index);
        return obj;
    }
    
    public void SamplingProcedureDataOnDemand.setDescription(SamplingProcedure obj, int index) {
        String description = "description_" + index;
        obj.setDescription(description);
    }
    
    public void SamplingProcedureDataOnDemand.setName(SamplingProcedure obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public SamplingProcedure SamplingProcedureDataOnDemand.getSpecificSamplingProcedure(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        SamplingProcedure obj = data.get(index);
        Integer id = obj.getId();
        return SamplingProcedure.findSamplingProcedure(id);
    }
    
    public SamplingProcedure SamplingProcedureDataOnDemand.getRandomSamplingProcedure() {
        init();
        SamplingProcedure obj = data.get(rnd.nextInt(data.size()));
        Integer id = obj.getId();
        return SamplingProcedure.findSamplingProcedure(id);
    }
    
    public boolean SamplingProcedureDataOnDemand.modifySamplingProcedure(SamplingProcedure obj) {
        return false;
    }
    
    public void SamplingProcedureDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = SamplingProcedure.findSamplingProcedureEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'SamplingProcedure' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<SamplingProcedure>();
        for (int i = 0; i < 10; i++) {
            SamplingProcedure obj = getNewTransientSamplingProcedure(i);
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
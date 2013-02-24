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
import ro.roda.Sourcetype;
import ro.roda.SourcetypeDataOnDemand;
import ro.roda.service.SourcetypeService;

privileged aspect SourcetypeDataOnDemand_Roo_DataOnDemand {
    
    declare @type: SourcetypeDataOnDemand: @Component;
    
    private Random SourcetypeDataOnDemand.rnd = new SecureRandom();
    
    private List<Sourcetype> SourcetypeDataOnDemand.data;
    
    @Autowired
    SourcetypeService SourcetypeDataOnDemand.sourcetypeService;
    
    public Sourcetype SourcetypeDataOnDemand.getNewTransientSourcetype(int index) {
        Sourcetype obj = new Sourcetype();
        setDescription(obj, index);
        setName(obj, index);
        return obj;
    }
    
    public void SourcetypeDataOnDemand.setDescription(Sourcetype obj, int index) {
        String description = "description_" + index;
        obj.setDescription(description);
    }
    
    public void SourcetypeDataOnDemand.setName(Sourcetype obj, int index) {
        String name = "name_" + index;
        if (name.length() > 150) {
            name = name.substring(0, 150);
        }
        obj.setName(name);
    }
    
    public Sourcetype SourcetypeDataOnDemand.getSpecificSourcetype(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Sourcetype obj = data.get(index);
        Integer id = obj.getId();
        return sourcetypeService.findSourcetype(id);
    }
    
    public Sourcetype SourcetypeDataOnDemand.getRandomSourcetype() {
        init();
        Sourcetype obj = data.get(rnd.nextInt(data.size()));
        Integer id = obj.getId();
        return sourcetypeService.findSourcetype(id);
    }
    
    public boolean SourcetypeDataOnDemand.modifySourcetype(Sourcetype obj) {
        return false;
    }
    
    public void SourcetypeDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = sourcetypeService.findSourcetypeEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Sourcetype' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Sourcetype>();
        for (int i = 0; i < 10; i++) {
            Sourcetype obj = getNewTransientSourcetype(i);
            try {
                sourcetypeService.saveSourcetype(obj);
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

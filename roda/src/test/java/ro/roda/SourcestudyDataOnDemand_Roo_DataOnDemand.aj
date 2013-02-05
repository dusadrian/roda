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
import ro.roda.SourceDataOnDemand;
import ro.roda.Sourcestudy;
import ro.roda.SourcestudyDataOnDemand;
import ro.roda.SourcestudyTypeDataOnDemand;

privileged aspect SourcestudyDataOnDemand_Roo_DataOnDemand {
    
    declare @type: SourcestudyDataOnDemand: @Component;
    
    private Random SourcestudyDataOnDemand.rnd = new SecureRandom();
    
    private List<Sourcestudy> SourcestudyDataOnDemand.data;
    
    @Autowired
    private SourceDataOnDemand SourcestudyDataOnDemand.sourceDataOnDemand;
    
    @Autowired
    private SourcestudyTypeDataOnDemand SourcestudyDataOnDemand.sourcestudyTypeDataOnDemand;
    
    public Sourcestudy SourcestudyDataOnDemand.getNewTransientSourcestudy(int index) {
        Sourcestudy obj = new Sourcestudy();
        setDetails(obj, index);
        setName(obj, index);
        return obj;
    }
    
    public void SourcestudyDataOnDemand.setDetails(Sourcestudy obj, int index) {
        String details = "details_" + index;
        obj.setDetails(details);
    }
    
    public void SourcestudyDataOnDemand.setName(Sourcestudy obj, int index) {
        String name = "name_" + index;
        if (name.length() > 150) {
            name = name.substring(0, 150);
        }
        obj.setName(name);
    }
    
    public Sourcestudy SourcestudyDataOnDemand.getSpecificSourcestudy(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Sourcestudy obj = data.get(index);
        Integer id = obj.getId();
        return Sourcestudy.findSourcestudy(id);
    }
    
    public Sourcestudy SourcestudyDataOnDemand.getRandomSourcestudy() {
        init();
        Sourcestudy obj = data.get(rnd.nextInt(data.size()));
        Integer id = obj.getId();
        return Sourcestudy.findSourcestudy(id);
    }
    
    public boolean SourcestudyDataOnDemand.modifySourcestudy(Sourcestudy obj) {
        return false;
    }
    
    public void SourcestudyDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Sourcestudy.findSourcestudyEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Sourcestudy' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Sourcestudy>();
        for (int i = 0; i < 10; i++) {
            Sourcestudy obj = getNewTransientSourcestudy(i);
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
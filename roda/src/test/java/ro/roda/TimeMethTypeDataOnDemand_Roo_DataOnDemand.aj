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
import ro.roda.TimeMethType;
import ro.roda.TimeMethTypeDataOnDemand;
import ro.roda.service.TimeMethTypeService;

privileged aspect TimeMethTypeDataOnDemand_Roo_DataOnDemand {
    
    declare @type: TimeMethTypeDataOnDemand: @Component;
    
    private Random TimeMethTypeDataOnDemand.rnd = new SecureRandom();
    
    private List<TimeMethType> TimeMethTypeDataOnDemand.data;
    
    @Autowired
    TimeMethTypeService TimeMethTypeDataOnDemand.timeMethTypeService;
    
    public TimeMethType TimeMethTypeDataOnDemand.getNewTransientTimeMethType(int index) {
        TimeMethType obj = new TimeMethType();
        setDescription(obj, index);
        setName(obj, index);
        return obj;
    }
    
    public void TimeMethTypeDataOnDemand.setDescription(TimeMethType obj, int index) {
        String description = "description_" + index;
        obj.setDescription(description);
    }
    
    public void TimeMethTypeDataOnDemand.setName(TimeMethType obj, int index) {
        String name = "name_" + index;
        if (name.length() > 100) {
            name = name.substring(0, 100);
        }
        obj.setName(name);
    }
    
    public TimeMethType TimeMethTypeDataOnDemand.getSpecificTimeMethType(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        TimeMethType obj = data.get(index);
        Integer id = obj.getId();
        return timeMethTypeService.findTimeMethType(id);
    }
    
    public TimeMethType TimeMethTypeDataOnDemand.getRandomTimeMethType() {
        init();
        TimeMethType obj = data.get(rnd.nextInt(data.size()));
        Integer id = obj.getId();
        return timeMethTypeService.findTimeMethType(id);
    }
    
    public boolean TimeMethTypeDataOnDemand.modifyTimeMethType(TimeMethType obj) {
        return false;
    }
    
    public void TimeMethTypeDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = timeMethTypeService.findTimeMethTypeEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'TimeMethType' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<TimeMethType>();
        for (int i = 0; i < 10; i++) {
            TimeMethType obj = getNewTransientTimeMethType(i);
            try {
                timeMethTypeService.saveTimeMethType(obj);
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

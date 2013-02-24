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
import ro.roda.PropertyName;
import ro.roda.PropertyNameDataOnDemand;
import ro.roda.service.PropertyNameService;

privileged aspect PropertyNameDataOnDemand_Roo_DataOnDemand {
    
    declare @type: PropertyNameDataOnDemand: @Component;
    
    private Random PropertyNameDataOnDemand.rnd = new SecureRandom();
    
    private List<PropertyName> PropertyNameDataOnDemand.data;
    
    @Autowired
    PropertyNameService PropertyNameDataOnDemand.propertyNameService;
    
    public PropertyName PropertyNameDataOnDemand.getNewTransientPropertyName(int index) {
        PropertyName obj = new PropertyName();
        setDescription(obj, index);
        setName(obj, index);
        return obj;
    }
    
    public void PropertyNameDataOnDemand.setDescription(PropertyName obj, int index) {
        String description = "description_" + index;
        obj.setDescription(description);
    }
    
    public void PropertyNameDataOnDemand.setName(PropertyName obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public PropertyName PropertyNameDataOnDemand.getSpecificPropertyName(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        PropertyName obj = data.get(index);
        Integer id = obj.getId();
        return propertyNameService.findPropertyName(id);
    }
    
    public PropertyName PropertyNameDataOnDemand.getRandomPropertyName() {
        init();
        PropertyName obj = data.get(rnd.nextInt(data.size()));
        Integer id = obj.getId();
        return propertyNameService.findPropertyName(id);
    }
    
    public boolean PropertyNameDataOnDemand.modifyPropertyName(PropertyName obj) {
        return false;
    }
    
    public void PropertyNameDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = propertyNameService.findPropertyNameEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'PropertyName' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<PropertyName>();
        for (int i = 0; i < 10; i++) {
            PropertyName obj = getNewTransientPropertyName(i);
            try {
                propertyNameService.savePropertyName(obj);
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

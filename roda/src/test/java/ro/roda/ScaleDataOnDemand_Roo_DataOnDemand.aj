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
import ro.roda.ItemDataOnDemand;
import ro.roda.Scale;
import ro.roda.ScaleDataOnDemand;
import ro.roda.ValueDataOnDemand;

privileged aspect ScaleDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ScaleDataOnDemand: @Component;
    
    private Random ScaleDataOnDemand.rnd = new SecureRandom();
    
    private List<Scale> ScaleDataOnDemand.data;
    
    @Autowired
    private ItemDataOnDemand ScaleDataOnDemand.itemDataOnDemand;
    
    @Autowired
    private ValueDataOnDemand ScaleDataOnDemand.valueDataOnDemand;
    
    public Scale ScaleDataOnDemand.getNewTransientScale(int index) {
        Scale obj = new Scale();
        setUnits(obj, index);
        return obj;
    }
    
    public void ScaleDataOnDemand.setUnits(Scale obj, int index) {
        Short units = new Integer(index).shortValue();
        obj.setUnits(units);
    }
    
    public Scale ScaleDataOnDemand.getSpecificScale(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Scale obj = data.get(index);
        Long id = obj.getItemId();
        return Scale.findScale(id);
    }
    
    public Scale ScaleDataOnDemand.getRandomScale() {
        init();
        Scale obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getItemId();
        return Scale.findScale(id);
    }
    
    public boolean ScaleDataOnDemand.modifyScale(Scale obj) {
        return false;
    }
    
    public void ScaleDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Scale.findScaleEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Scale' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Scale>();
        for (int i = 0; i < 10; i++) {
            Scale obj = getNewTransientScale(i);
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

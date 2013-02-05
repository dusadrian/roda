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
import ro.roda.Regiontype;
import ro.roda.RegiontypeDataOnDemand;

privileged aspect RegiontypeDataOnDemand_Roo_DataOnDemand {
    
    declare @type: RegiontypeDataOnDemand: @Component;
    
    private Random RegiontypeDataOnDemand.rnd = new SecureRandom();
    
    private List<Regiontype> RegiontypeDataOnDemand.data;
    
    public Regiontype RegiontypeDataOnDemand.getNewTransientRegiontype(int index) {
        Regiontype obj = new Regiontype();
        setName(obj, index);
        return obj;
    }
    
    public void RegiontypeDataOnDemand.setName(Regiontype obj, int index) {
        String name = "name_" + index;
        if (name.length() > 150) {
            name = name.substring(0, 150);
        }
        obj.setName(name);
    }
    
    public Regiontype RegiontypeDataOnDemand.getSpecificRegiontype(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Regiontype obj = data.get(index);
        Integer id = obj.getId();
        return Regiontype.findRegiontype(id);
    }
    
    public Regiontype RegiontypeDataOnDemand.getRandomRegiontype() {
        init();
        Regiontype obj = data.get(rnd.nextInt(data.size()));
        Integer id = obj.getId();
        return Regiontype.findRegiontype(id);
    }
    
    public boolean RegiontypeDataOnDemand.modifyRegiontype(Regiontype obj) {
        return false;
    }
    
    public void RegiontypeDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Regiontype.findRegiontypeEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Regiontype' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Regiontype>();
        for (int i = 0; i < 10; i++) {
            Regiontype obj = getNewTransientRegiontype(i);
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

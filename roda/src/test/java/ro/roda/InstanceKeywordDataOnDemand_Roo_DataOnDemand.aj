// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import ro.roda.InstanceDataOnDemand;
import ro.roda.InstanceKeyword;
import ro.roda.InstanceKeywordDataOnDemand;
import ro.roda.InstanceKeywordPK;
import ro.roda.KeywordDataOnDemand;
import ro.roda.UserDataOnDemand;

privileged aspect InstanceKeywordDataOnDemand_Roo_DataOnDemand {
    
    declare @type: InstanceKeywordDataOnDemand: @Component;
    
    private Random InstanceKeywordDataOnDemand.rnd = new SecureRandom();
    
    private List<InstanceKeyword> InstanceKeywordDataOnDemand.data;
    
    @Autowired
    private UserDataOnDemand InstanceKeywordDataOnDemand.userDataOnDemand;
    
    @Autowired
    private InstanceDataOnDemand InstanceKeywordDataOnDemand.instanceDataOnDemand;
    
    @Autowired
    private KeywordDataOnDemand InstanceKeywordDataOnDemand.keywordDataOnDemand;
    
    public InstanceKeyword InstanceKeywordDataOnDemand.getNewTransientInstanceKeyword(int index) {
        InstanceKeyword obj = new InstanceKeyword();
        setEmbeddedIdClass(obj, index);
        setAdded(obj, index);
        return obj;
    }
    
    public void InstanceKeywordDataOnDemand.setEmbeddedIdClass(InstanceKeyword obj, int index) {
        Integer instanceId = new Integer(index);
        Integer keywordId = new Integer(index);
        Integer addedBy = new Integer(index);
        
        InstanceKeywordPK embeddedIdClass = new InstanceKeywordPK(instanceId, keywordId, addedBy);
        obj.setId(embeddedIdClass);
    }
    
    public void InstanceKeywordDataOnDemand.setAdded(InstanceKeyword obj, int index) {
        Date added = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setAdded(added);
    }
    
    public InstanceKeyword InstanceKeywordDataOnDemand.getSpecificInstanceKeyword(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        InstanceKeyword obj = data.get(index);
        InstanceKeywordPK id = obj.getId();
        return InstanceKeyword.findInstanceKeyword(id);
    }
    
    public InstanceKeyword InstanceKeywordDataOnDemand.getRandomInstanceKeyword() {
        init();
        InstanceKeyword obj = data.get(rnd.nextInt(data.size()));
        InstanceKeywordPK id = obj.getId();
        return InstanceKeyword.findInstanceKeyword(id);
    }
    
    public boolean InstanceKeywordDataOnDemand.modifyInstanceKeyword(InstanceKeyword obj) {
        return false;
    }
    
    public void InstanceKeywordDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = InstanceKeyword.findInstanceKeywordEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'InstanceKeyword' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<InstanceKeyword>();
        for (int i = 0; i < 10; i++) {
            InstanceKeyword obj = getNewTransientInstanceKeyword(i);
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

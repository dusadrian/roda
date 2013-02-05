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
import ro.roda.AuditDataOnDemand;
import ro.roda.AuditField;
import ro.roda.AuditFieldDataOnDemand;
import ro.roda.AuditFieldPK;

privileged aspect AuditFieldDataOnDemand_Roo_DataOnDemand {
    
    declare @type: AuditFieldDataOnDemand: @Component;
    
    private Random AuditFieldDataOnDemand.rnd = new SecureRandom();
    
    private List<AuditField> AuditFieldDataOnDemand.data;
    
    @Autowired
    private AuditDataOnDemand AuditFieldDataOnDemand.auditDataOnDemand;
    
    public AuditField AuditFieldDataOnDemand.getNewTransientAuditField(int index) {
        AuditField obj = new AuditField();
        setEmbeddedIdClass(obj, index);
        setColumnName(obj, index);
        setNewValue(obj, index);
        setOldValue(obj, index);
        return obj;
    }
    
    public void AuditFieldDataOnDemand.setEmbeddedIdClass(AuditField obj, int index) {
        Integer auditId = new Integer(index);
        Integer id = new Integer(index);
        
        AuditFieldPK embeddedIdClass = new AuditFieldPK(auditId, id);
        obj.setId(embeddedIdClass);
    }
    
    public void AuditFieldDataOnDemand.setColumnName(AuditField obj, int index) {
        String columnName = "columnName_" + index;
        obj.setColumnName(columnName);
    }
    
    public void AuditFieldDataOnDemand.setNewValue(AuditField obj, int index) {
        String newValue = "newValue_" + index;
        obj.setNewValue(newValue);
    }
    
    public void AuditFieldDataOnDemand.setOldValue(AuditField obj, int index) {
        String oldValue = "oldValue_" + index;
        obj.setOldValue(oldValue);
    }
    
    public AuditField AuditFieldDataOnDemand.getSpecificAuditField(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        AuditField obj = data.get(index);
        AuditFieldPK id = obj.getId();
        return AuditField.findAuditField(id);
    }
    
    public AuditField AuditFieldDataOnDemand.getRandomAuditField() {
        init();
        AuditField obj = data.get(rnd.nextInt(data.size()));
        AuditFieldPK id = obj.getId();
        return AuditField.findAuditField(id);
    }
    
    public boolean AuditFieldDataOnDemand.modifyAuditField(AuditField obj) {
        return false;
    }
    
    public void AuditFieldDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = AuditField.findAuditFieldEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'AuditField' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<AuditField>();
        for (int i = 0; i < 10; i++) {
            AuditField obj = getNewTransientAuditField(i);
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

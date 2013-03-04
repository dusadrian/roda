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
import ro.roda.AuditLogAction;
import ro.roda.AuditLogActionDataOnDemand;
import ro.roda.AuditLogChangeset;
import ro.roda.AuditLogChangesetDataOnDemand;
import ro.roda.AuditLogTable;
import ro.roda.AuditLogTableDataOnDemand;

privileged aspect AuditLogActionDataOnDemand_Roo_DataOnDemand {
    
    declare @type: AuditLogActionDataOnDemand: @Component;
    
    private Random AuditLogActionDataOnDemand.rnd = new SecureRandom();
    
    private List<AuditLogAction> AuditLogActionDataOnDemand.data;
    
    @Autowired
    AuditLogTableDataOnDemand AuditLogActionDataOnDemand.auditLogTableDataOnDemand;
    
    @Autowired
    AuditLogChangesetDataOnDemand AuditLogActionDataOnDemand.auditLogChangesetDataOnDemand;
    
    public AuditLogAction AuditLogActionDataOnDemand.getNewTransientAuditLogAction(int index) {
        AuditLogAction obj = new AuditLogAction();
        setAuditedRow(obj, index);
        setAuditedTable(obj, index);
        setChangeset(obj, index);
        setType(obj, index);
        return obj;
    }
    
    public void AuditLogActionDataOnDemand.setAuditedRow(AuditLogAction obj, int index) {
        String auditedRow = "auditedRow_" + index;
        if (auditedRow.length() > 50) {
            auditedRow = auditedRow.substring(0, 50);
        }
        obj.setAuditedRow(auditedRow);
    }
    
    public void AuditLogActionDataOnDemand.setAuditedTable(AuditLogAction obj, int index) {
        AuditLogTable auditedTable = auditLogTableDataOnDemand.getRandomAuditLogTable();
        obj.setAuditedTable(auditedTable);
    }
    
    public void AuditLogActionDataOnDemand.setChangeset(AuditLogAction obj, int index) {
        AuditLogChangeset changeset = auditLogChangesetDataOnDemand.getRandomAuditLogChangeset();
        obj.setChangeset(changeset);
    }
    
    public void AuditLogActionDataOnDemand.setType(AuditLogAction obj, int index) {
        String type = "type_" + index;
        if (type.length() > 10) {
            type = type.substring(0, 10);
        }
        obj.setType(type);
    }
    
    public AuditLogAction AuditLogActionDataOnDemand.getSpecificAuditLogAction(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        AuditLogAction obj = data.get(index);
        Integer id = obj.getId();
        return AuditLogAction.findAuditLogAction(id);
    }
    
    public AuditLogAction AuditLogActionDataOnDemand.getRandomAuditLogAction() {
        init();
        AuditLogAction obj = data.get(rnd.nextInt(data.size()));
        Integer id = obj.getId();
        return AuditLogAction.findAuditLogAction(id);
    }
    
    public boolean AuditLogActionDataOnDemand.modifyAuditLogAction(AuditLogAction obj) {
        return false;
    }
    
    public void AuditLogActionDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = AuditLogAction.findAuditLogActionEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'AuditLogAction' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<AuditLogAction>();
        for (int i = 0; i < 10; i++) {
            AuditLogAction obj = getNewTransientAuditLogAction(i);
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
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
import ro.roda.FormDataOnDemand;
import ro.roda.FormSelectionVar;
import ro.roda.FormSelectionVarDataOnDemand;
import ro.roda.FormSelectionVarPK;
import ro.roda.SelectionVariableItemDataOnDemand;

privileged aspect FormSelectionVarDataOnDemand_Roo_DataOnDemand {
    
    declare @type: FormSelectionVarDataOnDemand: @Component;
    
    private Random FormSelectionVarDataOnDemand.rnd = new SecureRandom();
    
    private List<FormSelectionVar> FormSelectionVarDataOnDemand.data;
    
    @Autowired
    private FormDataOnDemand FormSelectionVarDataOnDemand.formDataOnDemand;
    
    @Autowired
    private SelectionVariableItemDataOnDemand FormSelectionVarDataOnDemand.selectionVariableItemDataOnDemand;
    
    public FormSelectionVar FormSelectionVarDataOnDemand.getNewTransientFormSelectionVar(int index) {
        FormSelectionVar obj = new FormSelectionVar();
        setEmbeddedIdClass(obj, index);
        setOrderOfItemsInResponse(obj, index);
        return obj;
    }
    
    public void FormSelectionVarDataOnDemand.setEmbeddedIdClass(FormSelectionVar obj, int index) {
        Long formId = new Integer(index).longValue();
        Long variableId = new Integer(index).longValue();
        Long itemId = new Integer(index).longValue();
        
        FormSelectionVarPK embeddedIdClass = new FormSelectionVarPK(formId, variableId, itemId);
        obj.setId(embeddedIdClass);
    }
    
    public void FormSelectionVarDataOnDemand.setOrderOfItemsInResponse(FormSelectionVar obj, int index) {
        Integer orderOfItemsInResponse = new Integer(index);
        obj.setOrderOfItemsInResponse(orderOfItemsInResponse);
    }
    
    public FormSelectionVar FormSelectionVarDataOnDemand.getSpecificFormSelectionVar(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        FormSelectionVar obj = data.get(index);
        FormSelectionVarPK id = obj.getId();
        return FormSelectionVar.findFormSelectionVar(id);
    }
    
    public FormSelectionVar FormSelectionVarDataOnDemand.getRandomFormSelectionVar() {
        init();
        FormSelectionVar obj = data.get(rnd.nextInt(data.size()));
        FormSelectionVarPK id = obj.getId();
        return FormSelectionVar.findFormSelectionVar(id);
    }
    
    public boolean FormSelectionVarDataOnDemand.modifyFormSelectionVar(FormSelectionVar obj) {
        return false;
    }
    
    public void FormSelectionVarDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = FormSelectionVar.findFormSelectionVarEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'FormSelectionVar' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<FormSelectionVar>();
        for (int i = 0; i < 10; i++) {
            FormSelectionVar obj = getNewTransientFormSelectionVar(i);
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

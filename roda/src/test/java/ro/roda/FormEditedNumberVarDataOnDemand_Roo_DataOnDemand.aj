// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import java.math.BigDecimal;
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
import ro.roda.FormEditedNumberVar;
import ro.roda.FormEditedNumberVarDataOnDemand;
import ro.roda.FormEditedNumberVarPK;
import ro.roda.VariableDataOnDemand;

privileged aspect FormEditedNumberVarDataOnDemand_Roo_DataOnDemand {
    
    declare @type: FormEditedNumberVarDataOnDemand: @Component;
    
    private Random FormEditedNumberVarDataOnDemand.rnd = new SecureRandom();
    
    private List<FormEditedNumberVar> FormEditedNumberVarDataOnDemand.data;
    
    @Autowired
    private FormDataOnDemand FormEditedNumberVarDataOnDemand.formDataOnDemand;
    
    @Autowired
    private VariableDataOnDemand FormEditedNumberVarDataOnDemand.variableDataOnDemand;
    
    public FormEditedNumberVar FormEditedNumberVarDataOnDemand.getNewTransientFormEditedNumberVar(int index) {
        FormEditedNumberVar obj = new FormEditedNumberVar();
        setEmbeddedIdClass(obj, index);
        setValue(obj, index);
        return obj;
    }
    
    public void FormEditedNumberVarDataOnDemand.setEmbeddedIdClass(FormEditedNumberVar obj, int index) {
        Long formId = new Integer(index).longValue();
        Long variableId = new Integer(index).longValue();
        
        FormEditedNumberVarPK embeddedIdClass = new FormEditedNumberVarPK(formId, variableId);
        obj.setId(embeddedIdClass);
    }
    
    public void FormEditedNumberVarDataOnDemand.setValue(FormEditedNumberVar obj, int index) {
        BigDecimal value = BigDecimal.valueOf(index);
        if (value.compareTo(new BigDecimal("99999999.99")) == 1) {
            value = new BigDecimal("99999999.99");
        }
        obj.setValue(value);
    }
    
    public FormEditedNumberVar FormEditedNumberVarDataOnDemand.getSpecificFormEditedNumberVar(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        FormEditedNumberVar obj = data.get(index);
        FormEditedNumberVarPK id = obj.getId();
        return FormEditedNumberVar.findFormEditedNumberVar(id);
    }
    
    public FormEditedNumberVar FormEditedNumberVarDataOnDemand.getRandomFormEditedNumberVar() {
        init();
        FormEditedNumberVar obj = data.get(rnd.nextInt(data.size()));
        FormEditedNumberVarPK id = obj.getId();
        return FormEditedNumberVar.findFormEditedNumberVar(id);
    }
    
    public boolean FormEditedNumberVarDataOnDemand.modifyFormEditedNumberVar(FormEditedNumberVar obj) {
        return false;
    }
    
    public void FormEditedNumberVarDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = FormEditedNumberVar.findFormEditedNumberVarEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'FormEditedNumberVar' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<FormEditedNumberVar>();
        for (int i = 0; i < 10; i++) {
            FormEditedNumberVar obj = getNewTransientFormEditedNumberVar(i);
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

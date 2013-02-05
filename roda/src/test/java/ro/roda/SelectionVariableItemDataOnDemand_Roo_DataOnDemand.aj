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
import ro.roda.FileDataOnDemand;
import ro.roda.ItemDataOnDemand;
import ro.roda.SelectionVariableDataOnDemand;
import ro.roda.SelectionVariableItem;
import ro.roda.SelectionVariableItemDataOnDemand;
import ro.roda.SelectionVariableItemPK;

privileged aspect SelectionVariableItemDataOnDemand_Roo_DataOnDemand {
    
    declare @type: SelectionVariableItemDataOnDemand: @Component;
    
    private Random SelectionVariableItemDataOnDemand.rnd = new SecureRandom();
    
    private List<SelectionVariableItem> SelectionVariableItemDataOnDemand.data;
    
    @Autowired
    private ItemDataOnDemand SelectionVariableItemDataOnDemand.itemDataOnDemand;
    
    @Autowired
    private FileDataOnDemand SelectionVariableItemDataOnDemand.fileDataOnDemand;
    
    @Autowired
    private SelectionVariableDataOnDemand SelectionVariableItemDataOnDemand.selectionVariableDataOnDemand;
    
    public SelectionVariableItem SelectionVariableItemDataOnDemand.getNewTransientSelectionVariableItem(int index) {
        SelectionVariableItem obj = new SelectionVariableItem();
        setEmbeddedIdClass(obj, index);
        setFrequencyValue(obj, index);
        setOrderOfItemInVariable(obj, index);
        return obj;
    }
    
    public void SelectionVariableItemDataOnDemand.setEmbeddedIdClass(SelectionVariableItem obj, int index) {
        Long variableId = new Integer(index).longValue();
        Long itemId = new Integer(index).longValue();
        
        SelectionVariableItemPK embeddedIdClass = new SelectionVariableItemPK(variableId, itemId);
        obj.setId(embeddedIdClass);
    }
    
    public void SelectionVariableItemDataOnDemand.setFrequencyValue(SelectionVariableItem obj, int index) {
        Float frequencyValue = new Integer(index).floatValue();
        if (frequencyValue > 9.99999999F) {
            frequencyValue = 9.99999999F;
        }
        obj.setFrequencyValue(frequencyValue);
    }
    
    public void SelectionVariableItemDataOnDemand.setOrderOfItemInVariable(SelectionVariableItem obj, int index) {
        Integer orderOfItemInVariable = new Integer(index);
        obj.setOrderOfItemInVariable(orderOfItemInVariable);
    }
    
    public SelectionVariableItem SelectionVariableItemDataOnDemand.getSpecificSelectionVariableItem(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        SelectionVariableItem obj = data.get(index);
        SelectionVariableItemPK id = obj.getId();
        return SelectionVariableItem.findSelectionVariableItem(id);
    }
    
    public SelectionVariableItem SelectionVariableItemDataOnDemand.getRandomSelectionVariableItem() {
        init();
        SelectionVariableItem obj = data.get(rnd.nextInt(data.size()));
        SelectionVariableItemPK id = obj.getId();
        return SelectionVariableItem.findSelectionVariableItem(id);
    }
    
    public boolean SelectionVariableItemDataOnDemand.modifySelectionVariableItem(SelectionVariableItem obj) {
        return false;
    }
    
    public void SelectionVariableItemDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = SelectionVariableItem.findSelectionVariableItemEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'SelectionVariableItem' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<SelectionVariableItem>();
        for (int i = 0; i < 10; i++) {
            SelectionVariableItem obj = getNewTransientSelectionVariableItem(i);
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
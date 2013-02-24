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
import ro.roda.File;
import ro.roda.FileDataOnDemand;
import ro.roda.FilePropertyNameValue;
import ro.roda.FilePropertyNameValueDataOnDemand;
import ro.roda.FilePropertyNameValuePK;
import ro.roda.PropertyName;
import ro.roda.PropertyNameDataOnDemand;
import ro.roda.PropertyValue;
import ro.roda.PropertyValueDataOnDemand;
import ro.roda.service.FilePropertyNameValueService;

privileged aspect FilePropertyNameValueDataOnDemand_Roo_DataOnDemand {
    
    declare @type: FilePropertyNameValueDataOnDemand: @Component;
    
    private Random FilePropertyNameValueDataOnDemand.rnd = new SecureRandom();
    
    private List<FilePropertyNameValue> FilePropertyNameValueDataOnDemand.data;
    
    @Autowired
    FileDataOnDemand FilePropertyNameValueDataOnDemand.fileDataOnDemand;
    
    @Autowired
    PropertyNameDataOnDemand FilePropertyNameValueDataOnDemand.propertyNameDataOnDemand;
    
    @Autowired
    PropertyValueDataOnDemand FilePropertyNameValueDataOnDemand.propertyValueDataOnDemand;
    
    @Autowired
    FilePropertyNameValueService FilePropertyNameValueDataOnDemand.filePropertyNameValueService;
    
    public FilePropertyNameValue FilePropertyNameValueDataOnDemand.getNewTransientFilePropertyNameValue(int index) {
        FilePropertyNameValue obj = new FilePropertyNameValue();
        setEmbeddedIdClass(obj, index);
        setFileId(obj, index);
        setPropertyNameId(obj, index);
        setPropertyValueId(obj, index);
        return obj;
    }
    
    public void FilePropertyNameValueDataOnDemand.setEmbeddedIdClass(FilePropertyNameValue obj, int index) {
        Integer propertyNameId = new Integer(index);
        Integer propertyValueId = new Integer(index);
        Integer fileId = new Integer(index);
        
        FilePropertyNameValuePK embeddedIdClass = new FilePropertyNameValuePK(propertyNameId, propertyValueId, fileId);
        obj.setId(embeddedIdClass);
    }
    
    public void FilePropertyNameValueDataOnDemand.setFileId(FilePropertyNameValue obj, int index) {
        File fileId = fileDataOnDemand.getRandomFile();
        obj.setFileId(fileId);
    }
    
    public void FilePropertyNameValueDataOnDemand.setPropertyNameId(FilePropertyNameValue obj, int index) {
        PropertyName propertyNameId = propertyNameDataOnDemand.getRandomPropertyName();
        obj.setPropertyNameId(propertyNameId);
    }
    
    public void FilePropertyNameValueDataOnDemand.setPropertyValueId(FilePropertyNameValue obj, int index) {
        PropertyValue propertyValueId = propertyValueDataOnDemand.getRandomPropertyValue();
        obj.setPropertyValueId(propertyValueId);
    }
    
    public FilePropertyNameValue FilePropertyNameValueDataOnDemand.getSpecificFilePropertyNameValue(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        FilePropertyNameValue obj = data.get(index);
        FilePropertyNameValuePK id = obj.getId();
        return filePropertyNameValueService.findFilePropertyNameValue(id);
    }
    
    public FilePropertyNameValue FilePropertyNameValueDataOnDemand.getRandomFilePropertyNameValue() {
        init();
        FilePropertyNameValue obj = data.get(rnd.nextInt(data.size()));
        FilePropertyNameValuePK id = obj.getId();
        return filePropertyNameValueService.findFilePropertyNameValue(id);
    }
    
    public boolean FilePropertyNameValueDataOnDemand.modifyFilePropertyNameValue(FilePropertyNameValue obj) {
        return false;
    }
    
    public void FilePropertyNameValueDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = filePropertyNameValueService.findFilePropertyNameValueEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'FilePropertyNameValue' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<FilePropertyNameValue>();
        for (int i = 0; i < 10; i++) {
            FilePropertyNameValue obj = getNewTransientFilePropertyNameValue(i);
            try {
                filePropertyNameValueService.saveFilePropertyNameValue(obj);
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

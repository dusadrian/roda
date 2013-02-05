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
import ro.roda.CmsFile;
import ro.roda.CmsFileDataOnDemand;
import ro.roda.CmsFolderDataOnDemand;

privileged aspect CmsFileDataOnDemand_Roo_DataOnDemand {
    
    declare @type: CmsFileDataOnDemand: @Component;
    
    private Random CmsFileDataOnDemand.rnd = new SecureRandom();
    
    private List<CmsFile> CmsFileDataOnDemand.data;
    
    @Autowired
    private CmsFolderDataOnDemand CmsFileDataOnDemand.cmsFolderDataOnDemand;
    
    public CmsFile CmsFileDataOnDemand.getNewTransientCmsFile(int index) {
        CmsFile obj = new CmsFile();
        setFilename(obj, index);
        setFilesize(obj, index);
        setLabel(obj, index);
        return obj;
    }
    
    public void CmsFileDataOnDemand.setFilename(CmsFile obj, int index) {
        String filename = "filename_" + index;
        obj.setFilename(filename);
    }
    
    public void CmsFileDataOnDemand.setFilesize(CmsFile obj, int index) {
        Long filesize = new Integer(index).longValue();
        obj.setFilesize(filesize);
    }
    
    public void CmsFileDataOnDemand.setLabel(CmsFile obj, int index) {
        String label = "label_" + index;
        if (label.length() > 100) {
            label = label.substring(0, 100);
        }
        obj.setLabel(label);
    }
    
    public CmsFile CmsFileDataOnDemand.getSpecificCmsFile(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        CmsFile obj = data.get(index);
        Integer id = obj.getId();
        return CmsFile.findCmsFile(id);
    }
    
    public CmsFile CmsFileDataOnDemand.getRandomCmsFile() {
        init();
        CmsFile obj = data.get(rnd.nextInt(data.size()));
        Integer id = obj.getId();
        return CmsFile.findCmsFile(id);
    }
    
    public boolean CmsFileDataOnDemand.modifyCmsFile(CmsFile obj) {
        return false;
    }
    
    public void CmsFileDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = CmsFile.findCmsFileEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'CmsFile' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<CmsFile>();
        for (int i = 0; i < 10; i++) {
            CmsFile obj = getNewTransientCmsFile(i);
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
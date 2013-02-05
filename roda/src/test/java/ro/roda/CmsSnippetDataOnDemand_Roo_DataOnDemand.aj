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
import ro.roda.CmsSnippet;
import ro.roda.CmsSnippetDataOnDemand;
import ro.roda.CmsSnippetGroupDataOnDemand;

privileged aspect CmsSnippetDataOnDemand_Roo_DataOnDemand {
    
    declare @type: CmsSnippetDataOnDemand: @Component;
    
    private Random CmsSnippetDataOnDemand.rnd = new SecureRandom();
    
    private List<CmsSnippet> CmsSnippetDataOnDemand.data;
    
    @Autowired
    private CmsSnippetGroupDataOnDemand CmsSnippetDataOnDemand.cmsSnippetGroupDataOnDemand;
    
    public CmsSnippet CmsSnippetDataOnDemand.getNewTransientCmsSnippet(int index) {
        CmsSnippet obj = new CmsSnippet();
        setName(obj, index);
        setSnippetContent(obj, index);
        return obj;
    }
    
    public void CmsSnippetDataOnDemand.setName(CmsSnippet obj, int index) {
        String name = "name_" + index;
        if (name.length() > 200) {
            name = name.substring(0, 200);
        }
        obj.setName(name);
    }
    
    public void CmsSnippetDataOnDemand.setSnippetContent(CmsSnippet obj, int index) {
        String snippetContent = "snippetContent_" + index;
        obj.setSnippetContent(snippetContent);
    }
    
    public CmsSnippet CmsSnippetDataOnDemand.getSpecificCmsSnippet(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        CmsSnippet obj = data.get(index);
        Integer id = obj.getId();
        return CmsSnippet.findCmsSnippet(id);
    }
    
    public CmsSnippet CmsSnippetDataOnDemand.getRandomCmsSnippet() {
        init();
        CmsSnippet obj = data.get(rnd.nextInt(data.size()));
        Integer id = obj.getId();
        return CmsSnippet.findCmsSnippet(id);
    }
    
    public boolean CmsSnippetDataOnDemand.modifyCmsSnippet(CmsSnippet obj) {
        return false;
    }
    
    public void CmsSnippetDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = CmsSnippet.findCmsSnippetEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'CmsSnippet' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<CmsSnippet>();
        for (int i = 0; i < 10; i++) {
            CmsSnippet obj = getNewTransientCmsSnippet(i);
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
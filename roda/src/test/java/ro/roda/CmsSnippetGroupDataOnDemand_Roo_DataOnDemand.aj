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
import ro.roda.CmsSnippetGroup;
import ro.roda.CmsSnippetGroupDataOnDemand;
import ro.roda.service.CmsSnippetGroupService;

privileged aspect CmsSnippetGroupDataOnDemand_Roo_DataOnDemand {
    
    declare @type: CmsSnippetGroupDataOnDemand: @Component;
    
    private Random CmsSnippetGroupDataOnDemand.rnd = new SecureRandom();
    
    private List<CmsSnippetGroup> CmsSnippetGroupDataOnDemand.data;
    
    @Autowired
    CmsSnippetGroupService CmsSnippetGroupDataOnDemand.cmsSnippetGroupService;
    
    public CmsSnippetGroup CmsSnippetGroupDataOnDemand.getNewTransientCmsSnippetGroup(int index) {
        CmsSnippetGroup obj = new CmsSnippetGroup();
        setDescription(obj, index);
        setName(obj, index);
        setParentId(obj, index);
        return obj;
    }
    
    public void CmsSnippetGroupDataOnDemand.setDescription(CmsSnippetGroup obj, int index) {
        String description = "description_" + index;
        obj.setDescription(description);
    }
    
    public void CmsSnippetGroupDataOnDemand.setName(CmsSnippetGroup obj, int index) {
        String name = "name_" + index;
        if (name.length() > 200) {
            name = name.substring(0, 200);
        }
        obj.setName(name);
    }
    
    public void CmsSnippetGroupDataOnDemand.setParentId(CmsSnippetGroup obj, int index) {
        Integer parentId = new Integer(index);
        obj.setParentId(parentId);
    }
    
    public CmsSnippetGroup CmsSnippetGroupDataOnDemand.getSpecificCmsSnippetGroup(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        CmsSnippetGroup obj = data.get(index);
        Integer id = obj.getId();
        return cmsSnippetGroupService.findCmsSnippetGroup(id);
    }
    
    public CmsSnippetGroup CmsSnippetGroupDataOnDemand.getRandomCmsSnippetGroup() {
        init();
        CmsSnippetGroup obj = data.get(rnd.nextInt(data.size()));
        Integer id = obj.getId();
        return cmsSnippetGroupService.findCmsSnippetGroup(id);
    }
    
    public boolean CmsSnippetGroupDataOnDemand.modifyCmsSnippetGroup(CmsSnippetGroup obj) {
        return false;
    }
    
    public void CmsSnippetGroupDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = cmsSnippetGroupService.findCmsSnippetGroupEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'CmsSnippetGroup' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<CmsSnippetGroup>();
        for (int i = 0; i < 10; i++) {
            CmsSnippetGroup obj = getNewTransientCmsSnippetGroup(i);
            try {
                cmsSnippetGroupService.saveCmsSnippetGroup(obj);
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

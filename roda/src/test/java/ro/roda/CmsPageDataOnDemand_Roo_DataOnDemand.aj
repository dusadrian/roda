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
import ro.roda.CmsLayoutDataOnDemand;
import ro.roda.CmsPage;
import ro.roda.CmsPageDataOnDemand;
import ro.roda.CmsPageTypeDataOnDemand;
import ro.roda.UserDataOnDemand;

privileged aspect CmsPageDataOnDemand_Roo_DataOnDemand {
    
    declare @type: CmsPageDataOnDemand: @Component;
    
    private Random CmsPageDataOnDemand.rnd = new SecureRandom();
    
    private List<CmsPage> CmsPageDataOnDemand.data;
    
    @Autowired
    private CmsLayoutDataOnDemand CmsPageDataOnDemand.cmsLayoutDataOnDemand;
    
    @Autowired
    private CmsPageTypeDataOnDemand CmsPageDataOnDemand.cmsPageTypeDataOnDemand;
    
    @Autowired
    private UserDataOnDemand CmsPageDataOnDemand.userDataOnDemand;
    
    public CmsPage CmsPageDataOnDemand.getNewTransientCmsPage(int index) {
        CmsPage obj = new CmsPage();
        setName(obj, index);
        setNavigable(obj, index);
        setUrl(obj, index);
        setVisible(obj, index);
        return obj;
    }
    
    public void CmsPageDataOnDemand.setName(CmsPage obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public void CmsPageDataOnDemand.setNavigable(CmsPage obj, int index) {
        Boolean navigable = true;
        obj.setNavigable(navigable);
    }
    
    public void CmsPageDataOnDemand.setUrl(CmsPage obj, int index) {
        String url = "url_" + index;
        obj.setUrl(url);
    }
    
    public void CmsPageDataOnDemand.setVisible(CmsPage obj, int index) {
        Boolean visible = true;
        obj.setVisible(visible);
    }
    
    public CmsPage CmsPageDataOnDemand.getSpecificCmsPage(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        CmsPage obj = data.get(index);
        Integer id = obj.getId();
        return CmsPage.findCmsPage(id);
    }
    
    public CmsPage CmsPageDataOnDemand.getRandomCmsPage() {
        init();
        CmsPage obj = data.get(rnd.nextInt(data.size()));
        Integer id = obj.getId();
        return CmsPage.findCmsPage(id);
    }
    
    public boolean CmsPageDataOnDemand.modifyCmsPage(CmsPage obj) {
        return false;
    }
    
    public void CmsPageDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = CmsPage.findCmsPageEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'CmsPage' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<CmsPage>();
        for (int i = 0; i < 10; i++) {
            CmsPage obj = getNewTransientCmsPage(i);
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
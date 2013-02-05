// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import ro.roda.KeywordDataOnDemand;
import ro.roda.StudyDataOnDemand;
import ro.roda.StudyKeyword;
import ro.roda.StudyKeywordDataOnDemand;
import ro.roda.StudyKeywordPK;
import ro.roda.UserDataOnDemand;

privileged aspect StudyKeywordDataOnDemand_Roo_DataOnDemand {
    
    declare @type: StudyKeywordDataOnDemand: @Component;
    
    private Random StudyKeywordDataOnDemand.rnd = new SecureRandom();
    
    private List<StudyKeyword> StudyKeywordDataOnDemand.data;
    
    @Autowired
    private UserDataOnDemand StudyKeywordDataOnDemand.userDataOnDemand;
    
    @Autowired
    private KeywordDataOnDemand StudyKeywordDataOnDemand.keywordDataOnDemand;
    
    @Autowired
    private StudyDataOnDemand StudyKeywordDataOnDemand.studyDataOnDemand;
    
    public StudyKeyword StudyKeywordDataOnDemand.getNewTransientStudyKeyword(int index) {
        StudyKeyword obj = new StudyKeyword();
        setEmbeddedIdClass(obj, index);
        setAdded(obj, index);
        return obj;
    }
    
    public void StudyKeywordDataOnDemand.setEmbeddedIdClass(StudyKeyword obj, int index) {
        Integer studyId = new Integer(index);
        Integer keywordId = new Integer(index);
        Integer addedBy = new Integer(index);
        
        StudyKeywordPK embeddedIdClass = new StudyKeywordPK(studyId, keywordId, addedBy);
        obj.setId(embeddedIdClass);
    }
    
    public void StudyKeywordDataOnDemand.setAdded(StudyKeyword obj, int index) {
        Date added = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setAdded(added);
    }
    
    public StudyKeyword StudyKeywordDataOnDemand.getSpecificStudyKeyword(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        StudyKeyword obj = data.get(index);
        StudyKeywordPK id = obj.getId();
        return StudyKeyword.findStudyKeyword(id);
    }
    
    public StudyKeyword StudyKeywordDataOnDemand.getRandomStudyKeyword() {
        init();
        StudyKeyword obj = data.get(rnd.nextInt(data.size()));
        StudyKeywordPK id = obj.getId();
        return StudyKeyword.findStudyKeyword(id);
    }
    
    public boolean StudyKeywordDataOnDemand.modifyStudyKeyword(StudyKeyword obj) {
        return false;
    }
    
    public void StudyKeywordDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = StudyKeyword.findStudyKeywordEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'StudyKeyword' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<StudyKeyword>();
        for (int i = 0; i < 10; i++) {
            StudyKeyword obj = getNewTransientStudyKeyword(i);
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

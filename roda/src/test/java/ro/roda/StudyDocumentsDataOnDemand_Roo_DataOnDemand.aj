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
import ro.roda.StudyDocuments;
import ro.roda.StudyDocumentsDataOnDemand;
import ro.roda.StudyDocumentsPK;
import ro.roda.service.StudyDocumentsService;

privileged aspect StudyDocumentsDataOnDemand_Roo_DataOnDemand {
    
    declare @type: StudyDocumentsDataOnDemand: @Component;
    
    private Random StudyDocumentsDataOnDemand.rnd = new SecureRandom();
    
    private List<StudyDocuments> StudyDocumentsDataOnDemand.data;
    
    @Autowired
    StudyDocumentsService StudyDocumentsDataOnDemand.studyDocumentsService;
    
    public StudyDocuments StudyDocumentsDataOnDemand.getNewTransientStudyDocuments(int index) {
        StudyDocuments obj = new StudyDocuments();
        setEmbeddedIdClass(obj, index);
        return obj;
    }
    
    public void StudyDocumentsDataOnDemand.setEmbeddedIdClass(StudyDocuments obj, int index) {
        Integer studyId = new Integer(index);
        Integer documentId = new Integer(index);
        
        StudyDocumentsPK embeddedIdClass = new StudyDocumentsPK(studyId, documentId);
        obj.setId(embeddedIdClass);
    }
    
    public StudyDocuments StudyDocumentsDataOnDemand.getSpecificStudyDocuments(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        StudyDocuments obj = data.get(index);
        StudyDocumentsPK id = obj.getId();
        return studyDocumentsService.findStudyDocuments(id);
    }
    
    public StudyDocuments StudyDocumentsDataOnDemand.getRandomStudyDocuments() {
        init();
        StudyDocuments obj = data.get(rnd.nextInt(data.size()));
        StudyDocumentsPK id = obj.getId();
        return studyDocumentsService.findStudyDocuments(id);
    }
    
    public boolean StudyDocumentsDataOnDemand.modifyStudyDocuments(StudyDocuments obj) {
        return false;
    }
    
    public void StudyDocumentsDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = studyDocumentsService.findStudyDocumentsEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'StudyDocuments' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<StudyDocuments>();
        for (int i = 0; i < 10; i++) {
            StudyDocuments obj = getNewTransientStudyDocuments(i);
            try {
                studyDocumentsService.saveStudyDocuments(obj);
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

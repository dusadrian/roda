// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ro.roda.StudyDescr;
import ro.roda.StudyDescrPK;
import ro.roda.service.StudyDescrServiceImpl;

privileged aspect StudyDescrServiceImpl_Roo_Service {
    
    declare @type: StudyDescrServiceImpl: @Service;
    
    declare @type: StudyDescrServiceImpl: @Transactional;
    
    public long StudyDescrServiceImpl.countAllStudyDescrs() {
        return StudyDescr.countStudyDescrs();
    }
    
    public void StudyDescrServiceImpl.deleteStudyDescr(StudyDescr studyDescr) {
        studyDescr.remove();
    }
    
    public StudyDescr StudyDescrServiceImpl.findStudyDescr(StudyDescrPK id) {
        return StudyDescr.findStudyDescr(id);
    }
    
    public List<StudyDescr> StudyDescrServiceImpl.findAllStudyDescrs() {
        return StudyDescr.findAllStudyDescrs();
    }
    
    public List<StudyDescr> StudyDescrServiceImpl.findStudyDescrEntries(int firstResult, int maxResults) {
        return StudyDescr.findStudyDescrEntries(firstResult, maxResults);
    }
    
    public void StudyDescrServiceImpl.saveStudyDescr(StudyDescr studyDescr) {
        studyDescr.persist();
    }
    
    public StudyDescr StudyDescrServiceImpl.updateStudyDescr(StudyDescr studyDescr) {
        return studyDescr.merge();
    }
    
}

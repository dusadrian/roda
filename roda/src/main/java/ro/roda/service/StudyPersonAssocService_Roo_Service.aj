// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import ro.roda.StudyPersonAssoc;
import ro.roda.service.StudyPersonAssocService;

privileged aspect StudyPersonAssocService_Roo_Service {
    
    public abstract long StudyPersonAssocService.countAllStudyPersonAssocs();    
    public abstract void StudyPersonAssocService.deleteStudyPersonAssoc(StudyPersonAssoc studyPersonAssoc);    
    public abstract StudyPersonAssoc StudyPersonAssocService.findStudyPersonAssoc(Integer id);    
    public abstract List<StudyPersonAssoc> StudyPersonAssocService.findAllStudyPersonAssocs();    
    public abstract List<StudyPersonAssoc> StudyPersonAssocService.findStudyPersonAssocEntries(int firstResult, int maxResults);    
    public abstract void StudyPersonAssocService.saveStudyPersonAssoc(StudyPersonAssoc studyPersonAssoc);    
    public abstract StudyPersonAssoc StudyPersonAssocService.updateStudyPersonAssoc(StudyPersonAssoc studyPersonAssoc);    
}
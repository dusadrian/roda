// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import ro.roda.StudyPerson;
import ro.roda.StudyPersonPK;
import ro.roda.service.StudyPersonService;

privileged aspect StudyPersonService_Roo_Service {
    
    public abstract long StudyPersonService.countAllStudypeople();    
    public abstract void StudyPersonService.deleteStudyPerson(StudyPerson studyPerson);    
    public abstract StudyPerson StudyPersonService.findStudyPerson(StudyPersonPK id);    
    public abstract List<StudyPerson> StudyPersonService.findAllStudypeople();    
    public abstract List<StudyPerson> StudyPersonService.findStudyPersonEntries(int firstResult, int maxResults);    
    public abstract void StudyPersonService.saveStudyPerson(StudyPerson studyPerson);    
    public abstract StudyPerson StudyPersonService.updateStudyPerson(StudyPerson studyPerson);    
}

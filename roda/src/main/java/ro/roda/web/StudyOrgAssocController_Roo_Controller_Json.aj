// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.web;

import java.util.List;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import ro.roda.domain.StudyOrgAssoc;
import ro.roda.web.StudyOrgAssocController;

privileged aspect StudyOrgAssocController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{id}", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> StudyOrgAssocController.showJson(@PathVariable("id") Integer id) {
        StudyOrgAssoc studyOrgAssoc = studyOrgAssocService.findStudyOrgAssoc(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (studyOrgAssoc == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(studyOrgAssoc.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> StudyOrgAssocController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<StudyOrgAssoc> result = studyOrgAssocService.findAllStudyOrgAssocs();
        return new ResponseEntity<String>(StudyOrgAssoc.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> StudyOrgAssocController.createFromJson(@RequestBody String json) {
        StudyOrgAssoc studyOrgAssoc = StudyOrgAssoc.fromJsonToStudyOrgAssoc(json);
        studyOrgAssocService.saveStudyOrgAssoc(studyOrgAssoc);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> StudyOrgAssocController.createFromJsonArray(@RequestBody String json) {
        for (StudyOrgAssoc studyOrgAssoc: StudyOrgAssoc.fromJsonArrayToStudyOrgAssocs(json)) {
            studyOrgAssocService.saveStudyOrgAssoc(studyOrgAssoc);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> StudyOrgAssocController.updateFromJson(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        StudyOrgAssoc studyOrgAssoc = StudyOrgAssoc.fromJsonToStudyOrgAssoc(json);
        if (studyOrgAssocService.updateStudyOrgAssoc(studyOrgAssoc) == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> StudyOrgAssocController.updateFromJsonArray(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        for (StudyOrgAssoc studyOrgAssoc: StudyOrgAssoc.fromJsonArrayToStudyOrgAssocs(json)) {
            if (studyOrgAssocService.updateStudyOrgAssoc(studyOrgAssoc) == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> StudyOrgAssocController.deleteFromJson(@PathVariable("id") Integer id) {
        StudyOrgAssoc studyOrgAssoc = studyOrgAssocService.findStudyOrgAssoc(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (studyOrgAssoc == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        studyOrgAssocService.deleteStudyOrgAssoc(studyOrgAssoc);
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
}
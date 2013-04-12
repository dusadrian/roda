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
import ro.roda.domain.TranslatedTopic;
import ro.roda.domain.TranslatedTopicPK;
import ro.roda.web.TranslatedTopicController;

privileged aspect TranslatedTopicController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{id}", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> TranslatedTopicController.showJson(@PathVariable("id") TranslatedTopicPK id) {
        TranslatedTopic translatedTopic = translatedTopicService.findTranslatedTopic(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (translatedTopic == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(translatedTopic.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> TranslatedTopicController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<TranslatedTopic> result = translatedTopicService.findAllTranslatedTopics();
        return new ResponseEntity<String>(TranslatedTopic.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> TranslatedTopicController.createFromJson(@RequestBody String json) {
        TranslatedTopic translatedTopic = TranslatedTopic.fromJsonToTranslatedTopic(json);
        translatedTopicService.saveTranslatedTopic(translatedTopic);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> TranslatedTopicController.createFromJsonArray(@RequestBody String json) {
        for (TranslatedTopic translatedTopic: TranslatedTopic.fromJsonArrayToTranslatedTopics(json)) {
            translatedTopicService.saveTranslatedTopic(translatedTopic);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> TranslatedTopicController.updateFromJson(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        TranslatedTopic translatedTopic = TranslatedTopic.fromJsonToTranslatedTopic(json);
        if (translatedTopicService.updateTranslatedTopic(translatedTopic) == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> TranslatedTopicController.updateFromJsonArray(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        for (TranslatedTopic translatedTopic: TranslatedTopic.fromJsonArrayToTranslatedTopics(json)) {
            if (translatedTopicService.updateTranslatedTopic(translatedTopic) == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> TranslatedTopicController.deleteFromJson(@PathVariable("id") TranslatedTopicPK id) {
        TranslatedTopic translatedTopic = translatedTopicService.findTranslatedTopic(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (translatedTopic == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        translatedTopicService.deleteTranslatedTopic(translatedTopic);
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
}

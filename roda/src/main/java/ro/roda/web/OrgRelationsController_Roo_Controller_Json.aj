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
import ro.roda.domain.OrgRelations;
import ro.roda.domain.OrgRelationsPK;
import ro.roda.web.OrgRelationsController;

privileged aspect OrgRelationsController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{id}", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> OrgRelationsController.showJson(@PathVariable("id") OrgRelationsPK id) {
        OrgRelations orgRelations = orgRelationsService.findOrgRelations(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (orgRelations == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(orgRelations.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> OrgRelationsController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<OrgRelations> result = orgRelationsService.findAllOrgRelationses();
        return new ResponseEntity<String>(OrgRelations.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> OrgRelationsController.createFromJson(@RequestBody String json) {
        OrgRelations orgRelations = OrgRelations.fromJsonToOrgRelations(json);
        orgRelationsService.saveOrgRelations(orgRelations);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> OrgRelationsController.createFromJsonArray(@RequestBody String json) {
        for (OrgRelations orgRelations: OrgRelations.fromJsonArrayToOrgRelationses(json)) {
            orgRelationsService.saveOrgRelations(orgRelations);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> OrgRelationsController.updateFromJson(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        OrgRelations orgRelations = OrgRelations.fromJsonToOrgRelations(json);
        if (orgRelationsService.updateOrgRelations(orgRelations) == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> OrgRelationsController.updateFromJsonArray(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        for (OrgRelations orgRelations: OrgRelations.fromJsonArrayToOrgRelationses(json)) {
            if (orgRelationsService.updateOrgRelations(orgRelations) == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> OrgRelationsController.deleteFromJson(@PathVariable("id") OrgRelationsPK id) {
        OrgRelations orgRelations = orgRelationsService.findOrgRelations(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (orgRelations == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        orgRelationsService.deleteOrgRelations(orgRelations);
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
}
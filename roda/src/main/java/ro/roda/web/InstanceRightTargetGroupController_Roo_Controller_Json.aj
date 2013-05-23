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
import ro.roda.domain.InstanceRightTargetGroup;
import ro.roda.domain.InstanceRightTargetGroupPK;
import ro.roda.web.InstanceRightTargetGroupController;

privileged aspect InstanceRightTargetGroupController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{id}", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> InstanceRightTargetGroupController.showJson(@PathVariable("id") InstanceRightTargetGroupPK id) {
        InstanceRightTargetGroup instanceRightTargetGroup = instanceRightTargetGroupService.findInstanceRightTargetGroup(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (instanceRightTargetGroup == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(instanceRightTargetGroup.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> InstanceRightTargetGroupController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<InstanceRightTargetGroup> result = instanceRightTargetGroupService.findAllInstanceRightTargetGroups();
        return new ResponseEntity<String>(InstanceRightTargetGroup.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> InstanceRightTargetGroupController.createFromJson(@RequestBody String json) {
        InstanceRightTargetGroup instanceRightTargetGroup = InstanceRightTargetGroup.fromJsonToInstanceRightTargetGroup(json);
        instanceRightTargetGroupService.saveInstanceRightTargetGroup(instanceRightTargetGroup);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> InstanceRightTargetGroupController.createFromJsonArray(@RequestBody String json) {
        for (InstanceRightTargetGroup instanceRightTargetGroup: InstanceRightTargetGroup.fromJsonArrayToInstanceRightTargetGroups(json)) {
            instanceRightTargetGroupService.saveInstanceRightTargetGroup(instanceRightTargetGroup);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> InstanceRightTargetGroupController.updateFromJson(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        InstanceRightTargetGroup instanceRightTargetGroup = InstanceRightTargetGroup.fromJsonToInstanceRightTargetGroup(json);
        if (instanceRightTargetGroupService.updateInstanceRightTargetGroup(instanceRightTargetGroup) == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> InstanceRightTargetGroupController.updateFromJsonArray(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        for (InstanceRightTargetGroup instanceRightTargetGroup: InstanceRightTargetGroup.fromJsonArrayToInstanceRightTargetGroups(json)) {
            if (instanceRightTargetGroupService.updateInstanceRightTargetGroup(instanceRightTargetGroup) == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> InstanceRightTargetGroupController.deleteFromJson(@PathVariable("id") InstanceRightTargetGroupPK id) {
        InstanceRightTargetGroup instanceRightTargetGroup = instanceRightTargetGroupService.findInstanceRightTargetGroup(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (instanceRightTargetGroup == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        instanceRightTargetGroupService.deleteInstanceRightTargetGroup(instanceRightTargetGroup);
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
}
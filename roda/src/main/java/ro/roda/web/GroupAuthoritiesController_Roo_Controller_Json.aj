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
import ro.roda.domain.GroupAuthorities;
import ro.roda.domain.GroupAuthoritiesPK;
import ro.roda.web.GroupAuthoritiesController;

privileged aspect GroupAuthoritiesController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{id}", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> GroupAuthoritiesController.showJson(@PathVariable("id") GroupAuthoritiesPK id) {
        GroupAuthorities groupAuthorities = groupAuthoritiesService.findGroupAuthorities(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (groupAuthorities == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(groupAuthorities.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> GroupAuthoritiesController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<GroupAuthorities> result = groupAuthoritiesService.findAllGroupAuthoritieses();
        return new ResponseEntity<String>(GroupAuthorities.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> GroupAuthoritiesController.createFromJson(@RequestBody String json) {
        GroupAuthorities groupAuthorities = GroupAuthorities.fromJsonToGroupAuthorities(json);
        groupAuthoritiesService.saveGroupAuthorities(groupAuthorities);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> GroupAuthoritiesController.createFromJsonArray(@RequestBody String json) {
        for (GroupAuthorities groupAuthorities: GroupAuthorities.fromJsonArrayToGroupAuthoritieses(json)) {
            groupAuthoritiesService.saveGroupAuthorities(groupAuthorities);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> GroupAuthoritiesController.updateFromJson(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        GroupAuthorities groupAuthorities = GroupAuthorities.fromJsonToGroupAuthorities(json);
        if (groupAuthoritiesService.updateGroupAuthorities(groupAuthorities) == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> GroupAuthoritiesController.updateFromJsonArray(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        for (GroupAuthorities groupAuthorities: GroupAuthorities.fromJsonArrayToGroupAuthoritieses(json)) {
            if (groupAuthoritiesService.updateGroupAuthorities(groupAuthorities) == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> GroupAuthoritiesController.deleteFromJson(@PathVariable("id") GroupAuthoritiesPK id) {
        GroupAuthorities groupAuthorities = groupAuthoritiesService.findGroupAuthorities(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (groupAuthorities == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        groupAuthoritiesService.deleteGroupAuthorities(groupAuthorities);
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
}

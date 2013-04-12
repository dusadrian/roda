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
import ro.roda.domain.AclObjectIdentity;
import ro.roda.web.AclObjectIdentityController;

privileged aspect AclObjectIdentityController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{id}", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> AclObjectIdentityController.showJson(@PathVariable("id") Long id) {
        AclObjectIdentity aclObjectIdentity = aclObjectIdentityService.findAclObjectIdentity(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (aclObjectIdentity == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(aclObjectIdentity.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> AclObjectIdentityController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<AclObjectIdentity> result = aclObjectIdentityService.findAllAclObjectIdentitys();
        return new ResponseEntity<String>(AclObjectIdentity.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> AclObjectIdentityController.createFromJson(@RequestBody String json) {
        AclObjectIdentity aclObjectIdentity = AclObjectIdentity.fromJsonToAclObjectIdentity(json);
        aclObjectIdentityService.saveAclObjectIdentity(aclObjectIdentity);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> AclObjectIdentityController.createFromJsonArray(@RequestBody String json) {
        for (AclObjectIdentity aclObjectIdentity: AclObjectIdentity.fromJsonArrayToAclObjectIdentitys(json)) {
            aclObjectIdentityService.saveAclObjectIdentity(aclObjectIdentity);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> AclObjectIdentityController.updateFromJson(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        AclObjectIdentity aclObjectIdentity = AclObjectIdentity.fromJsonToAclObjectIdentity(json);
        if (aclObjectIdentityService.updateAclObjectIdentity(aclObjectIdentity) == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> AclObjectIdentityController.updateFromJsonArray(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        for (AclObjectIdentity aclObjectIdentity: AclObjectIdentity.fromJsonArrayToAclObjectIdentitys(json)) {
            if (aclObjectIdentityService.updateAclObjectIdentity(aclObjectIdentity) == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> AclObjectIdentityController.deleteFromJson(@PathVariable("id") Long id) {
        AclObjectIdentity aclObjectIdentity = aclObjectIdentityService.findAclObjectIdentity(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (aclObjectIdentity == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        aclObjectIdentityService.deleteAclObjectIdentity(aclObjectIdentity);
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
}

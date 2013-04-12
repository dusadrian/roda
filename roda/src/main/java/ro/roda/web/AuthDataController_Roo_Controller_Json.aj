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
import ro.roda.domain.AuthData;
import ro.roda.web.AuthDataController;

privileged aspect AuthDataController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{userId}", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> AuthDataController.showJson(@PathVariable("userId") Integer userId) {
        AuthData authData = authDataService.findAuthData(userId);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (authData == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(authData.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> AuthDataController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<AuthData> result = authDataService.findAllAuthDatas();
        return new ResponseEntity<String>(AuthData.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> AuthDataController.createFromJson(@RequestBody String json) {
        AuthData authData = AuthData.fromJsonToAuthData(json);
        authDataService.saveAuthData(authData);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> AuthDataController.createFromJsonArray(@RequestBody String json) {
        for (AuthData authData: AuthData.fromJsonArrayToAuthDatas(json)) {
            authDataService.saveAuthData(authData);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> AuthDataController.updateFromJson(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        AuthData authData = AuthData.fromJsonToAuthData(json);
        if (authDataService.updateAuthData(authData) == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> AuthDataController.updateFromJsonArray(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        for (AuthData authData: AuthData.fromJsonArrayToAuthDatas(json)) {
            if (authDataService.updateAuthData(authData) == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{userId}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> AuthDataController.deleteFromJson(@PathVariable("userId") Integer userId) {
        AuthData authData = authDataService.findAuthData(userId);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (authData == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        authDataService.deleteAuthData(authData);
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
}

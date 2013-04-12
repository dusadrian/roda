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
import ro.roda.domain.SettingValue;
import ro.roda.web.SettingValueController;

privileged aspect SettingValueController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{settingId}", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> SettingValueController.showJson(@PathVariable("settingId") Integer settingId) {
        SettingValue settingValue = settingValueService.findSettingValue(settingId);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (settingValue == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(settingValue.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> SettingValueController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<SettingValue> result = settingValueService.findAllSettingValues();
        return new ResponseEntity<String>(SettingValue.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> SettingValueController.createFromJson(@RequestBody String json) {
        SettingValue settingValue = SettingValue.fromJsonToSettingValue(json);
        settingValueService.saveSettingValue(settingValue);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> SettingValueController.createFromJsonArray(@RequestBody String json) {
        for (SettingValue settingValue: SettingValue.fromJsonArrayToSettingValues(json)) {
            settingValueService.saveSettingValue(settingValue);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> SettingValueController.updateFromJson(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        SettingValue settingValue = SettingValue.fromJsonToSettingValue(json);
        if (settingValueService.updateSettingValue(settingValue) == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> SettingValueController.updateFromJsonArray(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        for (SettingValue settingValue: SettingValue.fromJsonArrayToSettingValues(json)) {
            if (settingValueService.updateSettingValue(settingValue) == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{settingId}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> SettingValueController.deleteFromJson(@PathVariable("settingId") Integer settingId) {
        SettingValue settingValue = settingValueService.findSettingValue(settingId);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (settingValue == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        settingValueService.deleteSettingValue(settingValue);
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
}

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
import ro.roda.domain.CmsFilePropertyNameValue;
import ro.roda.domain.CmsFilePropertyNameValuePK;
import ro.roda.web.CmsFilePropertyNameValueController;

privileged aspect CmsFilePropertyNameValueController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{id}", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> CmsFilePropertyNameValueController.showJson(@PathVariable("id") CmsFilePropertyNameValuePK id) {
        CmsFilePropertyNameValue cmsFilePropertyNameValue = cmsFilePropertyNameValueService.findCmsFilePropertyNameValue(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (cmsFilePropertyNameValue == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(cmsFilePropertyNameValue.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> CmsFilePropertyNameValueController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<CmsFilePropertyNameValue> result = cmsFilePropertyNameValueService.findAllCmsFilePropertyNameValues();
        return new ResponseEntity<String>(CmsFilePropertyNameValue.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> CmsFilePropertyNameValueController.createFromJson(@RequestBody String json) {
        CmsFilePropertyNameValue cmsFilePropertyNameValue = CmsFilePropertyNameValue.fromJsonToCmsFilePropertyNameValue(json);
        cmsFilePropertyNameValueService.saveCmsFilePropertyNameValue(cmsFilePropertyNameValue);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> CmsFilePropertyNameValueController.createFromJsonArray(@RequestBody String json) {
        for (CmsFilePropertyNameValue cmsFilePropertyNameValue: CmsFilePropertyNameValue.fromJsonArrayToCmsFilePropertyNameValues(json)) {
            cmsFilePropertyNameValueService.saveCmsFilePropertyNameValue(cmsFilePropertyNameValue);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> CmsFilePropertyNameValueController.updateFromJson(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        CmsFilePropertyNameValue cmsFilePropertyNameValue = CmsFilePropertyNameValue.fromJsonToCmsFilePropertyNameValue(json);
        if (cmsFilePropertyNameValueService.updateCmsFilePropertyNameValue(cmsFilePropertyNameValue) == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> CmsFilePropertyNameValueController.updateFromJsonArray(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        for (CmsFilePropertyNameValue cmsFilePropertyNameValue: CmsFilePropertyNameValue.fromJsonArrayToCmsFilePropertyNameValues(json)) {
            if (cmsFilePropertyNameValueService.updateCmsFilePropertyNameValue(cmsFilePropertyNameValue) == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> CmsFilePropertyNameValueController.deleteFromJson(@PathVariable("id") CmsFilePropertyNameValuePK id) {
        CmsFilePropertyNameValue cmsFilePropertyNameValue = cmsFilePropertyNameValueService.findCmsFilePropertyNameValue(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (cmsFilePropertyNameValue == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        cmsFilePropertyNameValueService.deleteCmsFilePropertyNameValue(cmsFilePropertyNameValue);
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
}

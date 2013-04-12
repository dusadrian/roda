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
import ro.roda.domain.CollectionModelType;
import ro.roda.web.CollectionModelTypeController;

privileged aspect CollectionModelTypeController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{id}", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> CollectionModelTypeController.showJson(@PathVariable("id") Integer id) {
        CollectionModelType collectionModelType = collectionModelTypeService.findCollectionModelType(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (collectionModelType == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(collectionModelType.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> CollectionModelTypeController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<CollectionModelType> result = collectionModelTypeService.findAllCollectionModelTypes();
        return new ResponseEntity<String>(CollectionModelType.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> CollectionModelTypeController.createFromJson(@RequestBody String json) {
        CollectionModelType collectionModelType = CollectionModelType.fromJsonToCollectionModelType(json);
        collectionModelTypeService.saveCollectionModelType(collectionModelType);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> CollectionModelTypeController.createFromJsonArray(@RequestBody String json) {
        for (CollectionModelType collectionModelType: CollectionModelType.fromJsonArrayToCollectionModelTypes(json)) {
            collectionModelTypeService.saveCollectionModelType(collectionModelType);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> CollectionModelTypeController.updateFromJson(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        CollectionModelType collectionModelType = CollectionModelType.fromJsonToCollectionModelType(json);
        if (collectionModelTypeService.updateCollectionModelType(collectionModelType) == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> CollectionModelTypeController.updateFromJsonArray(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        for (CollectionModelType collectionModelType: CollectionModelType.fromJsonArrayToCollectionModelTypes(json)) {
            if (collectionModelTypeService.updateCollectionModelType(collectionModelType) == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> CollectionModelTypeController.deleteFromJson(@PathVariable("id") Integer id) {
        CollectionModelType collectionModelType = collectionModelTypeService.findCollectionModelType(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (collectionModelType == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        collectionModelTypeService.deleteCollectionModelType(collectionModelType);
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
}

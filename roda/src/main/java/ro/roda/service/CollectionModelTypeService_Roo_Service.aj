// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import ro.roda.CollectionModelType;
import ro.roda.service.CollectionModelTypeService;

privileged aspect CollectionModelTypeService_Roo_Service {
    
    public abstract long CollectionModelTypeService.countAllCollectionModelTypes();    
    public abstract void CollectionModelTypeService.deleteCollectionModelType(CollectionModelType collectionModelType);    
    public abstract CollectionModelType CollectionModelTypeService.findCollectionModelType(Integer id);    
    public abstract List<CollectionModelType> CollectionModelTypeService.findAllCollectionModelTypes();    
    public abstract List<CollectionModelType> CollectionModelTypeService.findCollectionModelTypeEntries(int firstResult, int maxResults);    
    public abstract void CollectionModelTypeService.saveCollectionModelType(CollectionModelType collectionModelType);    
    public abstract CollectionModelType CollectionModelTypeService.updateCollectionModelType(CollectionModelType collectionModelType);    
}
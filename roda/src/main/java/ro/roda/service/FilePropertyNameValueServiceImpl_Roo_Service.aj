// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ro.roda.domain.FilePropertyNameValue;
import ro.roda.domain.FilePropertyNameValuePK;
import ro.roda.service.FilePropertyNameValueServiceImpl;

privileged aspect FilePropertyNameValueServiceImpl_Roo_Service {
    
    declare @type: FilePropertyNameValueServiceImpl: @Service;
    
    declare @type: FilePropertyNameValueServiceImpl: @Transactional;
    
    public long FilePropertyNameValueServiceImpl.countAllFilePropertyNameValues() {
        return FilePropertyNameValue.countFilePropertyNameValues();
    }
    
    public void FilePropertyNameValueServiceImpl.deleteFilePropertyNameValue(FilePropertyNameValue filePropertyNameValue) {
        filePropertyNameValue.remove();
    }
    
    public FilePropertyNameValue FilePropertyNameValueServiceImpl.findFilePropertyNameValue(FilePropertyNameValuePK id) {
        return FilePropertyNameValue.findFilePropertyNameValue(id);
    }
    
    public List<FilePropertyNameValue> FilePropertyNameValueServiceImpl.findAllFilePropertyNameValues() {
        return FilePropertyNameValue.findAllFilePropertyNameValues();
    }
    
    public List<FilePropertyNameValue> FilePropertyNameValueServiceImpl.findFilePropertyNameValueEntries(int firstResult, int maxResults) {
        return FilePropertyNameValue.findFilePropertyNameValueEntries(firstResult, maxResults);
    }
    
    public void FilePropertyNameValueServiceImpl.saveFilePropertyNameValue(FilePropertyNameValue filePropertyNameValue) {
        filePropertyNameValue.persist();
    }
    
    public FilePropertyNameValue FilePropertyNameValueServiceImpl.updateFilePropertyNameValue(FilePropertyNameValue filePropertyNameValue) {
        return filePropertyNameValue.merge();
    }
    
}

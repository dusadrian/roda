// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ro.roda.domain.File;
import ro.roda.service.FileServiceImpl;

privileged aspect FileServiceImpl_Roo_Service {
    
    declare @type: FileServiceImpl: @Service;
    
    declare @type: FileServiceImpl: @Transactional;
    
    public long FileServiceImpl.countAllFiles() {
        return File.countFiles();
    }
    
    public void FileServiceImpl.deleteFile(File file) {
        file.remove();
    }
    
    public File FileServiceImpl.findFile(Integer id) {
        return File.findFile(id);
    }
    
    public List<File> FileServiceImpl.findAllFiles() {
        return File.findAllFiles();
    }
    
    public List<File> FileServiceImpl.findFileEntries(int firstResult, int maxResults) {
        return File.findFileEntries(firstResult, maxResults);
    }
    
    public void FileServiceImpl.saveFile(File file) {
        file.persist();
    }
    
    public File FileServiceImpl.updateFile(File file) {
        return file.merge();
    }
    
}

// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import ro.roda.FileAcl;
import ro.roda.FileAclPK;
import ro.roda.service.FileAclService;

privileged aspect FileAclService_Roo_Service {
    
    public abstract long FileAclService.countAllFileAcls();    
    public abstract void FileAclService.deleteFileAcl(FileAcl fileAcl);    
    public abstract FileAcl FileAclService.findFileAcl(FileAclPK id);    
    public abstract List<FileAcl> FileAclService.findAllFileAcls();    
    public abstract List<FileAcl> FileAclService.findFileAclEntries(int firstResult, int maxResults);    
    public abstract void FileAclService.saveFileAcl(FileAcl fileAcl);    
    public abstract FileAcl FileAclService.updateFileAcl(FileAcl fileAcl);    
}
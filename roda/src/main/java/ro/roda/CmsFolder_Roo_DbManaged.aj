// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import java.util.Set;
import javax.persistence.Column;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import ro.roda.CmsFile;
import ro.roda.CmsFolder;

privileged aspect CmsFolder_Roo_DbManaged {
    
    @OneToMany(mappedBy = "cmsFolderId")
    private Set<CmsFile> CmsFolder.cmsFiles;
    
    @Column(name = "name", columnDefinition = "text")
    @NotNull
    private String CmsFolder.name;
    
    @Column(name = "parent_id", columnDefinition = "int4")
    private Integer CmsFolder.parentId;
    
    @Column(name = "description", columnDefinition = "text")
    private String CmsFolder.description;
    
    public Set<CmsFile> CmsFolder.getCmsFiles() {
        return cmsFiles;
    }
    
    public void CmsFolder.setCmsFiles(Set<CmsFile> cmsFiles) {
        this.cmsFiles = cmsFiles;
    }
    
    public String CmsFolder.getName() {
        return name;
    }
    
    public void CmsFolder.setName(String name) {
        this.name = name;
    }
    
    public Integer CmsFolder.getParentId() {
        return parentId;
    }
    
    public void CmsFolder.setParentId(Integer parentId) {
        this.parentId = parentId;
    }
    
    public String CmsFolder.getDescription() {
        return description;
    }
    
    public void CmsFolder.setDescription(String description) {
        this.description = description;
    }
    
}

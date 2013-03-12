// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import java.util.Set;
import javax.persistence.Column;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import ro.roda.domain.CmsSnippet;
import ro.roda.domain.CmsSnippetGroup;

privileged aspect CmsSnippetGroup_Roo_DbManaged {
    
    @OneToMany(mappedBy = "cmsSnippetGroupId")
    private Set<CmsSnippet> CmsSnippetGroup.cmsSnippets;
    
    @Column(name = "name", columnDefinition = "varchar", length = 200)
    @NotNull
    private String CmsSnippetGroup.name;
    
    @Column(name = "parent_id", columnDefinition = "int4")
    private Integer CmsSnippetGroup.parentId;
    
    @Column(name = "description", columnDefinition = "text")
    private String CmsSnippetGroup.description;
    
    public Set<CmsSnippet> CmsSnippetGroup.getCmsSnippets() {
        return cmsSnippets;
    }
    
    public void CmsSnippetGroup.setCmsSnippets(Set<CmsSnippet> cmsSnippets) {
        this.cmsSnippets = cmsSnippets;
    }
    
    public String CmsSnippetGroup.getName() {
        return name;
    }
    
    public void CmsSnippetGroup.setName(String name) {
        this.name = name;
    }
    
    public Integer CmsSnippetGroup.getParentId() {
        return parentId;
    }
    
    public void CmsSnippetGroup.setParentId(Integer parentId) {
        this.parentId = parentId;
    }
    
    public String CmsSnippetGroup.getDescription() {
        return description;
    }
    
    public void CmsSnippetGroup.setDescription(String description) {
        this.description = description;
    }
    
}
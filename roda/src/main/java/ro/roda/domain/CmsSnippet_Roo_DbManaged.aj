// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import ro.roda.domain.CmsSnippet;
import ro.roda.domain.CmsSnippetGroup;

privileged aspect CmsSnippet_Roo_DbManaged {
    
    @ManyToOne
    @JoinColumn(name = "cms_snippet_group_id", referencedColumnName = "id")
    private CmsSnippetGroup CmsSnippet.cmsSnippetGroupId;
    
    @Column(name = "name", columnDefinition = "varchar", length = 200)
    @NotNull
    private String CmsSnippet.name;
    
    @Column(name = "snippet_content", columnDefinition = "text")
    @NotNull
    private String CmsSnippet.snippetContent;
    
    public CmsSnippetGroup CmsSnippet.getCmsSnippetGroupId() {
        return cmsSnippetGroupId;
    }
    
    public void CmsSnippet.setCmsSnippetGroupId(CmsSnippetGroup cmsSnippetGroupId) {
        this.cmsSnippetGroupId = cmsSnippetGroupId;
    }
    
    public String CmsSnippet.getName() {
        return name;
    }
    
    public void CmsSnippet.setName(String name) {
        this.name = name;
    }
    
    public String CmsSnippet.getSnippetContent() {
        return snippetContent;
    }
    
    public void CmsSnippet.setSnippetContent(String snippetContent) {
        this.snippetContent = snippetContent;
    }
    
}

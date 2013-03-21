// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import java.util.Set;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import ro.roda.domain.CmsLayout;
import ro.roda.domain.CmsPage;
import ro.roda.domain.CmsPageContent;
import ro.roda.domain.CmsPageType;
import ro.roda.domain.Users;

privileged aspect CmsPage_Roo_DbManaged {
    
    @OneToMany(mappedBy = "cmsPageId")
    private Set<CmsPageContent> CmsPage.cmsPageContents;
    
    @ManyToOne
    @JoinColumn(name = "cms_layout_id", referencedColumnName = "id", nullable = false)
    private CmsLayout CmsPage.cmsLayoutId;
    
    @ManyToOne
    @JoinColumn(name = "cms_page_type_id", referencedColumnName = "id", nullable = false)
    private CmsPageType CmsPage.cmsPageTypeId;
    
    @ManyToOne
    @JoinColumn(name = "owner_id", referencedColumnName = "id", nullable = false)
    private Users CmsPage.ownerId;
    
    @Column(name = "name", columnDefinition = "text")
    @NotNull
    private String CmsPage.name;
    
    @Column(name = "visible", columnDefinition = "bool")
    @NotNull
    private boolean CmsPage.visible;
    
    @Column(name = "navigable", columnDefinition = "bool")
    @NotNull
    private boolean CmsPage.navigable;
    
    @Column(name = "url", columnDefinition = "text")
    @NotNull
    private String CmsPage.url;
    
    public Set<CmsPageContent> CmsPage.getCmsPageContents() {
        return cmsPageContents;
    }
    
    public void CmsPage.setCmsPageContents(Set<CmsPageContent> cmsPageContents) {
        this.cmsPageContents = cmsPageContents;
    }
    
    public CmsLayout CmsPage.getCmsLayoutId() {
        return cmsLayoutId;
    }
    
    public void CmsPage.setCmsLayoutId(CmsLayout cmsLayoutId) {
        this.cmsLayoutId = cmsLayoutId;
    }
    
    public CmsPageType CmsPage.getCmsPageTypeId() {
        return cmsPageTypeId;
    }
    
    public void CmsPage.setCmsPageTypeId(CmsPageType cmsPageTypeId) {
        this.cmsPageTypeId = cmsPageTypeId;
    }
    
    public Users CmsPage.getOwnerId() {
        return ownerId;
    }
    
    public void CmsPage.setOwnerId(Users ownerId) {
        this.ownerId = ownerId;
    }
    
    public String CmsPage.getName() {
        return name;
    }
    
    public void CmsPage.setName(String name) {
        this.name = name;
    }
    
    public boolean CmsPage.isVisible() {
        return visible;
    }
    
    public void CmsPage.setVisible(boolean visible) {
        this.visible = visible;
    }
    
    public boolean CmsPage.isNavigable() {
        return navigable;
    }
    
    public void CmsPage.setNavigable(boolean navigable) {
        this.navigable = navigable;
    }
    
    public String CmsPage.getUrl() {
        return url;
    }
    
    public void CmsPage.setUrl(String url) {
        this.url = url;
    }
    
}

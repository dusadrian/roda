// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import ro.roda.domain.CmsPage;
import ro.roda.domain.CmsPageContent;

privileged aspect CmsPageContent_Roo_DbManaged {
    
    @ManyToOne
    @JoinColumn(name = "cms_page_id", referencedColumnName = "id", nullable = false)
    private CmsPage CmsPageContent.cmsPageId;
    
    @Column(name = "name", columnDefinition = "varchar", length = 200)
    @NotNull
    private String CmsPageContent.name;
    
    @Column(name = "content_title", columnDefinition = "varchar", length = 250)
    @NotNull
    private String CmsPageContent.contentTitle;
    
    @Column(name = "content_text", columnDefinition = "text")
    private String CmsPageContent.contentText;
    
    @Column(name = "order_in_page", columnDefinition = "int4", unique = true)
    @NotNull
    private Integer CmsPageContent.orderInPage;
    
    public CmsPage CmsPageContent.getCmsPageId() {
        return cmsPageId;
    }
    
    public void CmsPageContent.setCmsPageId(CmsPage cmsPageId) {
        this.cmsPageId = cmsPageId;
    }
    
    public String CmsPageContent.getName() {
        return name;
    }
    
    public void CmsPageContent.setName(String name) {
        this.name = name;
    }
    
    public String CmsPageContent.getContentTitle() {
        return contentTitle;
    }
    
    public void CmsPageContent.setContentTitle(String contentTitle) {
        this.contentTitle = contentTitle;
    }
    
    public String CmsPageContent.getContentText() {
        return contentText;
    }
    
    public void CmsPageContent.setContentText(String contentText) {
        this.contentText = contentText;
    }
    
    public Integer CmsPageContent.getOrderInPage() {
        return orderInPage;
    }
    
    public void CmsPageContent.setOrderInPage(Integer orderInPage) {
        this.orderInPage = orderInPage;
    }
    
}

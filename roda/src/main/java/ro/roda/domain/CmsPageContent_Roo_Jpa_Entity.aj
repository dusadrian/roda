// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import ro.roda.domain.CmsPageContent;

privileged aspect CmsPageContent_Roo_Jpa_Entity {
    
    declare @type: CmsPageContent: @Entity;
    
    declare @type: CmsPageContent: @Table(schema = "public", name = "cms_page_content");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", columnDefinition = "serial")
    private Integer CmsPageContent.id;
    
    public Integer CmsPageContent.getId() {
        return this.id;
    }
    
    public void CmsPageContent.setId(Integer id) {
        this.id = id;
    }
    
}
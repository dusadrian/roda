// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.web;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;
import ro.roda.CmsPageContent;
import ro.roda.service.CmsPageContentService;
import ro.roda.service.CmsPageService;
import ro.roda.web.CmsPageContentController;

privileged aspect CmsPageContentController_Roo_Controller {
    
    @Autowired
    CmsPageContentService CmsPageContentController.cmsPageContentService;
    
    @Autowired
    CmsPageService CmsPageContentController.cmsPageService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String CmsPageContentController.create(@Valid CmsPageContent cmsPageContent, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, cmsPageContent);
            return "cmspagecontents/create";
        }
        uiModel.asMap().clear();
        cmsPageContentService.saveCmsPageContent(cmsPageContent);
        return "redirect:/cmspagecontents/" + encodeUrlPathSegment(cmsPageContent.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String CmsPageContentController.createForm(Model uiModel) {
        populateEditForm(uiModel, new CmsPageContent());
        return "cmspagecontents/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String CmsPageContentController.show(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("cmspagecontent", cmsPageContentService.findCmsPageContent(id));
        uiModel.addAttribute("itemId", id);
        return "cmspagecontents/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String CmsPageContentController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("cmspagecontents", cmsPageContentService.findCmsPageContentEntries(firstResult, sizeNo));
            float nrOfPages = (float) cmsPageContentService.countAllCmsPageContents() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("cmspagecontents", cmsPageContentService.findAllCmsPageContents());
        }
        return "cmspagecontents/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String CmsPageContentController.update(@Valid CmsPageContent cmsPageContent, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, cmsPageContent);
            return "cmspagecontents/update";
        }
        uiModel.asMap().clear();
        cmsPageContentService.updateCmsPageContent(cmsPageContent);
        return "redirect:/cmspagecontents/" + encodeUrlPathSegment(cmsPageContent.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String CmsPageContentController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        populateEditForm(uiModel, cmsPageContentService.findCmsPageContent(id));
        return "cmspagecontents/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String CmsPageContentController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        CmsPageContent cmsPageContent = cmsPageContentService.findCmsPageContent(id);
        cmsPageContentService.deleteCmsPageContent(cmsPageContent);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/cmspagecontents";
    }
    
    void CmsPageContentController.populateEditForm(Model uiModel, CmsPageContent cmsPageContent) {
        uiModel.addAttribute("cmsPageContent", cmsPageContent);
        uiModel.addAttribute("cmspages", cmsPageService.findAllCmsPages());
    }
    
    String CmsPageContentController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}

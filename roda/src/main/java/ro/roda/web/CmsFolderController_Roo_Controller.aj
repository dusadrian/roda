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
import ro.roda.domain.CmsFolder;
import ro.roda.service.CmsFileService;
import ro.roda.service.CmsFolderService;
import ro.roda.web.CmsFolderController;

privileged aspect CmsFolderController_Roo_Controller {
    
    @Autowired
    CmsFolderService CmsFolderController.cmsFolderService;
    
    @Autowired
    CmsFileService CmsFolderController.cmsFileService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String CmsFolderController.create(@Valid CmsFolder cmsFolder, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, cmsFolder);
            return "cmsfolders/create";
        }
        uiModel.asMap().clear();
        cmsFolderService.saveCmsFolder(cmsFolder);
        return "redirect:/cmsfolders/" + encodeUrlPathSegment(cmsFolder.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String CmsFolderController.createForm(Model uiModel) {
        populateEditForm(uiModel, new CmsFolder());
        return "cmsfolders/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String CmsFolderController.show(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("cmsfolder", cmsFolderService.findCmsFolder(id));
        uiModel.addAttribute("itemId", id);
        return "cmsfolders/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String CmsFolderController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("cmsfolders", cmsFolderService.findCmsFolderEntries(firstResult, sizeNo));
            float nrOfPages = (float) cmsFolderService.countAllCmsFolders() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("cmsfolders", cmsFolderService.findAllCmsFolders());
        }
        return "cmsfolders/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String CmsFolderController.update(@Valid CmsFolder cmsFolder, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, cmsFolder);
            return "cmsfolders/update";
        }
        uiModel.asMap().clear();
        cmsFolderService.updateCmsFolder(cmsFolder);
        return "redirect:/cmsfolders/" + encodeUrlPathSegment(cmsFolder.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String CmsFolderController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        populateEditForm(uiModel, cmsFolderService.findCmsFolder(id));
        return "cmsfolders/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String CmsFolderController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        CmsFolder cmsFolder = cmsFolderService.findCmsFolder(id);
        cmsFolderService.deleteCmsFolder(cmsFolder);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/cmsfolders";
    }
    
    void CmsFolderController.populateEditForm(Model uiModel, CmsFolder cmsFolder) {
        uiModel.addAttribute("cmsFolder", cmsFolder);
        uiModel.addAttribute("cmsfiles", cmsFileService.findAllCmsFiles());
    }
    
    String CmsFolderController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

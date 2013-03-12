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
import ro.roda.domain.AclSid;
import ro.roda.service.AclEntryService;
import ro.roda.service.AclObjectIdentityService;
import ro.roda.service.AclSidService;
import ro.roda.web.AclSidController;

privileged aspect AclSidController_Roo_Controller {
    
    @Autowired
    AclSidService AclSidController.aclSidService;
    
    @Autowired
    AclEntryService AclSidController.aclEntryService;
    
    @Autowired
    AclObjectIdentityService AclSidController.aclObjectIdentityService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String AclSidController.create(@Valid AclSid aclSid, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, aclSid);
            return "aclsids/create";
        }
        uiModel.asMap().clear();
        aclSidService.saveAclSid(aclSid);
        return "redirect:/aclsids/" + encodeUrlPathSegment(aclSid.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String AclSidController.createForm(Model uiModel) {
        populateEditForm(uiModel, new AclSid());
        return "aclsids/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String AclSidController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("aclsid", aclSidService.findAclSid(id));
        uiModel.addAttribute("itemId", id);
        return "aclsids/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String AclSidController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("aclsids", aclSidService.findAclSidEntries(firstResult, sizeNo));
            float nrOfPages = (float) aclSidService.countAllAclSids() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("aclsids", aclSidService.findAllAclSids());
        }
        return "aclsids/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String AclSidController.update(@Valid AclSid aclSid, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, aclSid);
            return "aclsids/update";
        }
        uiModel.asMap().clear();
        aclSidService.updateAclSid(aclSid);
        return "redirect:/aclsids/" + encodeUrlPathSegment(aclSid.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String AclSidController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, aclSidService.findAclSid(id));
        return "aclsids/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String AclSidController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        AclSid aclSid = aclSidService.findAclSid(id);
        aclSidService.deleteAclSid(aclSid);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/aclsids";
    }
    
    void AclSidController.populateEditForm(Model uiModel, AclSid aclSid) {
        uiModel.addAttribute("aclSid", aclSid);
        uiModel.addAttribute("aclentrys", aclEntryService.findAllAclEntrys());
        uiModel.addAttribute("aclobjectidentitys", aclObjectIdentityService.findAllAclObjectIdentitys());
    }
    
    String AclSidController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

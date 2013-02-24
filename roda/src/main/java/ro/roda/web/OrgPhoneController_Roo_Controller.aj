// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.web;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.ConversionService;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;
import ro.roda.OrgPhone;
import ro.roda.OrgPhonePK;
import ro.roda.service.OrgPhoneService;
import ro.roda.web.OrgPhoneController;

privileged aspect OrgPhoneController_Roo_Controller {
    
    private ConversionService OrgPhoneController.conversionService;
    
    @Autowired
    OrgPhoneService OrgPhoneController.orgPhoneService;
    
    @Autowired
    public OrgPhoneController.new(ConversionService conversionService) {
        super();
        this.conversionService = conversionService;
    }

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String OrgPhoneController.create(@Valid OrgPhone orgPhone, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, orgPhone);
            return "orgphones/create";
        }
        uiModel.asMap().clear();
        orgPhoneService.saveOrgPhone(orgPhone);
        return "redirect:/orgphones/" + encodeUrlPathSegment(conversionService.convert(orgPhone.getId(), String.class), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String OrgPhoneController.createForm(Model uiModel) {
        populateEditForm(uiModel, new OrgPhone());
        return "orgphones/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String OrgPhoneController.show(@PathVariable("id") OrgPhonePK id, Model uiModel) {
        uiModel.addAttribute("orgphone", orgPhoneService.findOrgPhone(id));
        uiModel.addAttribute("itemId", conversionService.convert(id, String.class));
        return "orgphones/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String OrgPhoneController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("orgphones", orgPhoneService.findOrgPhoneEntries(firstResult, sizeNo));
            float nrOfPages = (float) orgPhoneService.countAllOrgPhones() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("orgphones", orgPhoneService.findAllOrgPhones());
        }
        return "orgphones/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String OrgPhoneController.update(@Valid OrgPhone orgPhone, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, orgPhone);
            return "orgphones/update";
        }
        uiModel.asMap().clear();
        orgPhoneService.updateOrgPhone(orgPhone);
        return "redirect:/orgphones/" + encodeUrlPathSegment(conversionService.convert(orgPhone.getId(), String.class), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String OrgPhoneController.updateForm(@PathVariable("id") OrgPhonePK id, Model uiModel) {
        populateEditForm(uiModel, orgPhoneService.findOrgPhone(id));
        return "orgphones/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String OrgPhoneController.delete(@PathVariable("id") OrgPhonePK id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        OrgPhone orgPhone = orgPhoneService.findOrgPhone(id);
        orgPhoneService.deleteOrgPhone(orgPhone);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/orgphones";
    }
    
    void OrgPhoneController.populateEditForm(Model uiModel, OrgPhone orgPhone) {
        uiModel.addAttribute("orgPhone", orgPhone);
    }
    
    String OrgPhoneController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

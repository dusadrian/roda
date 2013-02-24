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
import ro.roda.Phone;
import ro.roda.service.OrgPhoneService;
import ro.roda.service.PersonPhoneService;
import ro.roda.service.PhoneService;
import ro.roda.web.PhoneController;

privileged aspect PhoneController_Roo_Controller {
    
    @Autowired
    PhoneService PhoneController.phoneService;
    
    @Autowired
    OrgPhoneService PhoneController.orgPhoneService;
    
    @Autowired
    PersonPhoneService PhoneController.personPhoneService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String PhoneController.create(@Valid Phone phone, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, phone);
            return "phones/create";
        }
        uiModel.asMap().clear();
        phoneService.savePhone(phone);
        return "redirect:/phones/" + encodeUrlPathSegment(phone.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String PhoneController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Phone());
        return "phones/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String PhoneController.show(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("phone", phoneService.findPhone(id));
        uiModel.addAttribute("itemId", id);
        return "phones/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String PhoneController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("phones", phoneService.findPhoneEntries(firstResult, sizeNo));
            float nrOfPages = (float) phoneService.countAllPhones() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("phones", phoneService.findAllPhones());
        }
        return "phones/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String PhoneController.update(@Valid Phone phone, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, phone);
            return "phones/update";
        }
        uiModel.asMap().clear();
        phoneService.updatePhone(phone);
        return "redirect:/phones/" + encodeUrlPathSegment(phone.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String PhoneController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        populateEditForm(uiModel, phoneService.findPhone(id));
        return "phones/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String PhoneController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Phone phone = phoneService.findPhone(id);
        phoneService.deletePhone(phone);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/phones";
    }
    
    void PhoneController.populateEditForm(Model uiModel, Phone phone) {
        uiModel.addAttribute("phone", phone);
        uiModel.addAttribute("orgphones", orgPhoneService.findAllOrgPhones());
        uiModel.addAttribute("personphones", personPhoneService.findAllPersonPhones());
    }
    
    String PhoneController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

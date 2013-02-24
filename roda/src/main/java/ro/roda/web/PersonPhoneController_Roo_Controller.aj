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
import ro.roda.PersonPhone;
import ro.roda.PersonPhonePK;
import ro.roda.service.PersonPhoneService;
import ro.roda.service.PersonService;
import ro.roda.service.PhoneService;
import ro.roda.web.PersonPhoneController;

privileged aspect PersonPhoneController_Roo_Controller {
    
    private ConversionService PersonPhoneController.conversionService;
    
    @Autowired
    PersonPhoneService PersonPhoneController.personPhoneService;
    
    @Autowired
    PersonService PersonPhoneController.personService;
    
    @Autowired
    PhoneService PersonPhoneController.phoneService;
    
    @Autowired
    public PersonPhoneController.new(ConversionService conversionService) {
        super();
        this.conversionService = conversionService;
    }

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String PersonPhoneController.create(@Valid PersonPhone personPhone, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, personPhone);
            return "personphones/create";
        }
        uiModel.asMap().clear();
        personPhoneService.savePersonPhone(personPhone);
        return "redirect:/personphones/" + encodeUrlPathSegment(conversionService.convert(personPhone.getId(), String.class), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String PersonPhoneController.createForm(Model uiModel) {
        populateEditForm(uiModel, new PersonPhone());
        return "personphones/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String PersonPhoneController.show(@PathVariable("id") PersonPhonePK id, Model uiModel) {
        uiModel.addAttribute("personphone", personPhoneService.findPersonPhone(id));
        uiModel.addAttribute("itemId", conversionService.convert(id, String.class));
        return "personphones/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String PersonPhoneController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("personphones", personPhoneService.findPersonPhoneEntries(firstResult, sizeNo));
            float nrOfPages = (float) personPhoneService.countAllPersonPhones() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("personphones", personPhoneService.findAllPersonPhones());
        }
        return "personphones/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String PersonPhoneController.update(@Valid PersonPhone personPhone, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, personPhone);
            return "personphones/update";
        }
        uiModel.asMap().clear();
        personPhoneService.updatePersonPhone(personPhone);
        return "redirect:/personphones/" + encodeUrlPathSegment(conversionService.convert(personPhone.getId(), String.class), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String PersonPhoneController.updateForm(@PathVariable("id") PersonPhonePK id, Model uiModel) {
        populateEditForm(uiModel, personPhoneService.findPersonPhone(id));
        return "personphones/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String PersonPhoneController.delete(@PathVariable("id") PersonPhonePK id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        PersonPhone personPhone = personPhoneService.findPersonPhone(id);
        personPhoneService.deletePersonPhone(personPhone);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/personphones";
    }
    
    void PersonPhoneController.populateEditForm(Model uiModel, PersonPhone personPhone) {
        uiModel.addAttribute("personPhone", personPhone);
        uiModel.addAttribute("people", personService.findAllPeople());
        uiModel.addAttribute("phones", phoneService.findAllPhones());
    }
    
    String PersonPhoneController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

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
import ro.roda.domain.PersonInternet;
import ro.roda.domain.PersonInternetPK;
import ro.roda.service.InternetService;
import ro.roda.service.PersonInternetService;
import ro.roda.service.PersonService;
import ro.roda.web.PersonInternetController;

privileged aspect PersonInternetController_Roo_Controller {
    
    private ConversionService PersonInternetController.conversionService;
    
    @Autowired
    PersonInternetService PersonInternetController.personInternetService;
    
    @Autowired
    InternetService PersonInternetController.internetService;
    
    @Autowired
    PersonService PersonInternetController.personService;
    
    @Autowired
    public PersonInternetController.new(ConversionService conversionService) {
        super();
        this.conversionService = conversionService;
    }

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String PersonInternetController.create(@Valid PersonInternet personInternet, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, personInternet);
            return "personinternets/create";
        }
        uiModel.asMap().clear();
        personInternetService.savePersonInternet(personInternet);
        return "redirect:/personinternets/" + encodeUrlPathSegment(conversionService.convert(personInternet.getId(), String.class), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String PersonInternetController.createForm(Model uiModel) {
        populateEditForm(uiModel, new PersonInternet());
        return "personinternets/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String PersonInternetController.show(@PathVariable("id") PersonInternetPK id, Model uiModel) {
        uiModel.addAttribute("personinternet", personInternetService.findPersonInternet(id));
        uiModel.addAttribute("itemId", conversionService.convert(id, String.class));
        return "personinternets/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String PersonInternetController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("personinternets", personInternetService.findPersonInternetEntries(firstResult, sizeNo));
            float nrOfPages = (float) personInternetService.countAllPersonInternets() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("personinternets", personInternetService.findAllPersonInternets());
        }
        return "personinternets/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String PersonInternetController.update(@Valid PersonInternet personInternet, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, personInternet);
            return "personinternets/update";
        }
        uiModel.asMap().clear();
        personInternetService.updatePersonInternet(personInternet);
        return "redirect:/personinternets/" + encodeUrlPathSegment(conversionService.convert(personInternet.getId(), String.class), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String PersonInternetController.updateForm(@PathVariable("id") PersonInternetPK id, Model uiModel) {
        populateEditForm(uiModel, personInternetService.findPersonInternet(id));
        return "personinternets/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String PersonInternetController.delete(@PathVariable("id") PersonInternetPK id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        PersonInternet personInternet = personInternetService.findPersonInternet(id);
        personInternetService.deletePersonInternet(personInternet);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/personinternets";
    }
    
    void PersonInternetController.populateEditForm(Model uiModel, PersonInternet personInternet) {
        uiModel.addAttribute("personInternet", personInternet);
        uiModel.addAttribute("internets", internetService.findAllInternets());
        uiModel.addAttribute("people", personService.findAllPeople());
    }
    
    String PersonInternetController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

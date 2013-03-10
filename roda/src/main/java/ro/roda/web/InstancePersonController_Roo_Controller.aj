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
import ro.roda.domain.InstancePerson;
import ro.roda.domain.InstancePersonPK;
import ro.roda.service.InstancePersonService;
import ro.roda.web.InstancePersonController;

privileged aspect InstancePersonController_Roo_Controller {
    
    private ConversionService InstancePersonController.conversionService;
    
    @Autowired
    InstancePersonService InstancePersonController.instancePersonService;
    
    @Autowired
    public InstancePersonController.new(ConversionService conversionService) {
        super();
        this.conversionService = conversionService;
    }

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String InstancePersonController.create(@Valid InstancePerson instancePerson, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, instancePerson);
            return "instancepeople/create";
        }
        uiModel.asMap().clear();
        instancePersonService.saveInstancePerson(instancePerson);
        return "redirect:/instancepeople/" + encodeUrlPathSegment(conversionService.convert(instancePerson.getId(), String.class), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String InstancePersonController.createForm(Model uiModel) {
        populateEditForm(uiModel, new InstancePerson());
        return "instancepeople/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String InstancePersonController.show(@PathVariable("id") InstancePersonPK id, Model uiModel) {
        uiModel.addAttribute("instanceperson", instancePersonService.findInstancePerson(id));
        uiModel.addAttribute("itemId", conversionService.convert(id, String.class));
        return "instancepeople/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String InstancePersonController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("instancepeople", instancePersonService.findInstancePersonEntries(firstResult, sizeNo));
            float nrOfPages = (float) instancePersonService.countAllInstancepeople() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("instancepeople", instancePersonService.findAllInstancepeople());
        }
        return "instancepeople/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String InstancePersonController.update(@Valid InstancePerson instancePerson, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, instancePerson);
            return "instancepeople/update";
        }
        uiModel.asMap().clear();
        instancePersonService.updateInstancePerson(instancePerson);
        return "redirect:/instancepeople/" + encodeUrlPathSegment(conversionService.convert(instancePerson.getId(), String.class), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String InstancePersonController.updateForm(@PathVariable("id") InstancePersonPK id, Model uiModel) {
        populateEditForm(uiModel, instancePersonService.findInstancePerson(id));
        return "instancepeople/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String InstancePersonController.delete(@PathVariable("id") InstancePersonPK id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        InstancePerson instancePerson = instancePersonService.findInstancePerson(id);
        instancePersonService.deleteInstancePerson(instancePerson);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/instancepeople";
    }
    
    void InstancePersonController.populateEditForm(Model uiModel, InstancePerson instancePerson) {
        uiModel.addAttribute("instancePerson", instancePerson);
    }
    
    String InstancePersonController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

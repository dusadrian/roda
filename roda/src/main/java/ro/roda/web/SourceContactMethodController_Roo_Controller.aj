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
import ro.roda.domain.SourceContactMethod;
import ro.roda.service.SourceContactMethodService;
import ro.roda.web.SourceContactMethodController;

privileged aspect SourceContactMethodController_Roo_Controller {
    
    @Autowired
    SourceContactMethodService SourceContactMethodController.sourceContactMethodService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String SourceContactMethodController.create(@Valid SourceContactMethod sourceContactMethod, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, sourceContactMethod);
            return "sourcecontactmethods/create";
        }
        uiModel.asMap().clear();
        sourceContactMethodService.saveSourceContactMethod(sourceContactMethod);
        return "redirect:/sourcecontactmethods/" + encodeUrlPathSegment(sourceContactMethod.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String SourceContactMethodController.createForm(Model uiModel) {
        populateEditForm(uiModel, new SourceContactMethod());
        return "sourcecontactmethods/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String SourceContactMethodController.show(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("sourcecontactmethod", sourceContactMethodService.findSourceContactMethod(id));
        uiModel.addAttribute("itemId", id);
        return "sourcecontactmethods/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String SourceContactMethodController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("sourcecontactmethods", sourceContactMethodService.findSourceContactMethodEntries(firstResult, sizeNo));
            float nrOfPages = (float) sourceContactMethodService.countAllSourceContactMethods() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("sourcecontactmethods", sourceContactMethodService.findAllSourceContactMethods());
        }
        return "sourcecontactmethods/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String SourceContactMethodController.update(@Valid SourceContactMethod sourceContactMethod, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, sourceContactMethod);
            return "sourcecontactmethods/update";
        }
        uiModel.asMap().clear();
        sourceContactMethodService.updateSourceContactMethod(sourceContactMethod);
        return "redirect:/sourcecontactmethods/" + encodeUrlPathSegment(sourceContactMethod.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String SourceContactMethodController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        populateEditForm(uiModel, sourceContactMethodService.findSourceContactMethod(id));
        return "sourcecontactmethods/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String SourceContactMethodController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        SourceContactMethod sourceContactMethod = sourceContactMethodService.findSourceContactMethod(id);
        sourceContactMethodService.deleteSourceContactMethod(sourceContactMethod);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/sourcecontactmethods";
    }
    
    void SourceContactMethodController.populateEditForm(Model uiModel, SourceContactMethod sourceContactMethod) {
        uiModel.addAttribute("sourceContactMethod", sourceContactMethod);
    }
    
    String SourceContactMethodController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

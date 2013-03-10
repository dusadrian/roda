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
import ro.roda.domain.InstancePersonAssoc;
import ro.roda.service.InstancePersonAssocService;
import ro.roda.web.InstancePersonAssocController;

privileged aspect InstancePersonAssocController_Roo_Controller {
    
    @Autowired
    InstancePersonAssocService InstancePersonAssocController.instancePersonAssocService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String InstancePersonAssocController.create(@Valid InstancePersonAssoc instancePersonAssoc, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, instancePersonAssoc);
            return "instancepersonassocs/create";
        }
        uiModel.asMap().clear();
        instancePersonAssocService.saveInstancePersonAssoc(instancePersonAssoc);
        return "redirect:/instancepersonassocs/" + encodeUrlPathSegment(instancePersonAssoc.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String InstancePersonAssocController.createForm(Model uiModel) {
        populateEditForm(uiModel, new InstancePersonAssoc());
        return "instancepersonassocs/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String InstancePersonAssocController.show(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("instancepersonassoc", instancePersonAssocService.findInstancePersonAssoc(id));
        uiModel.addAttribute("itemId", id);
        return "instancepersonassocs/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String InstancePersonAssocController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("instancepersonassocs", instancePersonAssocService.findInstancePersonAssocEntries(firstResult, sizeNo));
            float nrOfPages = (float) instancePersonAssocService.countAllInstancePersonAssocs() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("instancepersonassocs", instancePersonAssocService.findAllInstancePersonAssocs());
        }
        return "instancepersonassocs/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String InstancePersonAssocController.update(@Valid InstancePersonAssoc instancePersonAssoc, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, instancePersonAssoc);
            return "instancepersonassocs/update";
        }
        uiModel.asMap().clear();
        instancePersonAssocService.updateInstancePersonAssoc(instancePersonAssoc);
        return "redirect:/instancepersonassocs/" + encodeUrlPathSegment(instancePersonAssoc.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String InstancePersonAssocController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        populateEditForm(uiModel, instancePersonAssocService.findInstancePersonAssoc(id));
        return "instancepersonassocs/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String InstancePersonAssocController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        InstancePersonAssoc instancePersonAssoc = instancePersonAssocService.findInstancePersonAssoc(id);
        instancePersonAssocService.deleteInstancePersonAssoc(instancePersonAssoc);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/instancepersonassocs";
    }
    
    void InstancePersonAssocController.populateEditForm(Model uiModel, InstancePersonAssoc instancePersonAssoc) {
        uiModel.addAttribute("instancePersonAssoc", instancePersonAssoc);
    }
    
    String InstancePersonAssocController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

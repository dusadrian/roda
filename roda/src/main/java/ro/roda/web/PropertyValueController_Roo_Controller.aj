// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.web;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;
import ro.roda.CmsFilePropertyNameValue;
import ro.roda.FilePropertyNameValue;
import ro.roda.PropertyValue;
import ro.roda.web.PropertyValueController;

privileged aspect PropertyValueController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String PropertyValueController.create(@Valid PropertyValue propertyValue, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, propertyValue);
            return "propertyvalues/create";
        }
        uiModel.asMap().clear();
        propertyValue.persist();
        return "redirect:/propertyvalues/" + encodeUrlPathSegment(propertyValue.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String PropertyValueController.createForm(Model uiModel) {
        populateEditForm(uiModel, new PropertyValue());
        return "propertyvalues/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String PropertyValueController.show(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("propertyvalue", PropertyValue.findPropertyValue(id));
        uiModel.addAttribute("itemId", id);
        return "propertyvalues/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String PropertyValueController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("propertyvalues", PropertyValue.findPropertyValueEntries(firstResult, sizeNo));
            float nrOfPages = (float) PropertyValue.countPropertyValues() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("propertyvalues", PropertyValue.findAllPropertyValues());
        }
        return "propertyvalues/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String PropertyValueController.update(@Valid PropertyValue propertyValue, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, propertyValue);
            return "propertyvalues/update";
        }
        uiModel.asMap().clear();
        propertyValue.merge();
        return "redirect:/propertyvalues/" + encodeUrlPathSegment(propertyValue.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String PropertyValueController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        populateEditForm(uiModel, PropertyValue.findPropertyValue(id));
        return "propertyvalues/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String PropertyValueController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        PropertyValue propertyValue = PropertyValue.findPropertyValue(id);
        propertyValue.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/propertyvalues";
    }
    
    void PropertyValueController.populateEditForm(Model uiModel, PropertyValue propertyValue) {
        uiModel.addAttribute("propertyValue", propertyValue);
        uiModel.addAttribute("cmsfilepropertynamevalues", CmsFilePropertyNameValue.findAllCmsFilePropertyNameValues());
        uiModel.addAttribute("filepropertynamevalues", FilePropertyNameValue.findAllFilePropertyNameValues());
    }
    
    String PropertyValueController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

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
import ro.roda.CmsFile;
import ro.roda.CmsFilePropertyNameValue;
import ro.roda.CmsFilePropertyNameValuePK;
import ro.roda.PropertyName;
import ro.roda.PropertyValue;
import ro.roda.web.CmsFilePropertyNameValueController;

privileged aspect CmsFilePropertyNameValueController_Roo_Controller {
    
    private ConversionService CmsFilePropertyNameValueController.conversionService;
    
    @Autowired
    public CmsFilePropertyNameValueController.new(ConversionService conversionService) {
        super();
        this.conversionService = conversionService;
    }

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String CmsFilePropertyNameValueController.create(@Valid CmsFilePropertyNameValue cmsFilePropertyNameValue, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, cmsFilePropertyNameValue);
            return "cmsfilepropertynamevalues/create";
        }
        uiModel.asMap().clear();
        cmsFilePropertyNameValue.persist();
        return "redirect:/cmsfilepropertynamevalues/" + encodeUrlPathSegment(conversionService.convert(cmsFilePropertyNameValue.getId(), String.class), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String CmsFilePropertyNameValueController.createForm(Model uiModel) {
        populateEditForm(uiModel, new CmsFilePropertyNameValue());
        return "cmsfilepropertynamevalues/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String CmsFilePropertyNameValueController.show(@PathVariable("id") CmsFilePropertyNameValuePK id, Model uiModel) {
        uiModel.addAttribute("cmsfilepropertynamevalue", CmsFilePropertyNameValue.findCmsFilePropertyNameValue(id));
        uiModel.addAttribute("itemId", conversionService.convert(id, String.class));
        return "cmsfilepropertynamevalues/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String CmsFilePropertyNameValueController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("cmsfilepropertynamevalues", CmsFilePropertyNameValue.findCmsFilePropertyNameValueEntries(firstResult, sizeNo));
            float nrOfPages = (float) CmsFilePropertyNameValue.countCmsFilePropertyNameValues() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("cmsfilepropertynamevalues", CmsFilePropertyNameValue.findAllCmsFilePropertyNameValues());
        }
        return "cmsfilepropertynamevalues/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String CmsFilePropertyNameValueController.update(@Valid CmsFilePropertyNameValue cmsFilePropertyNameValue, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, cmsFilePropertyNameValue);
            return "cmsfilepropertynamevalues/update";
        }
        uiModel.asMap().clear();
        cmsFilePropertyNameValue.merge();
        return "redirect:/cmsfilepropertynamevalues/" + encodeUrlPathSegment(conversionService.convert(cmsFilePropertyNameValue.getId(), String.class), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String CmsFilePropertyNameValueController.updateForm(@PathVariable("id") CmsFilePropertyNameValuePK id, Model uiModel) {
        populateEditForm(uiModel, CmsFilePropertyNameValue.findCmsFilePropertyNameValue(id));
        return "cmsfilepropertynamevalues/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String CmsFilePropertyNameValueController.delete(@PathVariable("id") CmsFilePropertyNameValuePK id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        CmsFilePropertyNameValue cmsFilePropertyNameValue = CmsFilePropertyNameValue.findCmsFilePropertyNameValue(id);
        cmsFilePropertyNameValue.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/cmsfilepropertynamevalues";
    }
    
    void CmsFilePropertyNameValueController.populateEditForm(Model uiModel, CmsFilePropertyNameValue cmsFilePropertyNameValue) {
        uiModel.addAttribute("cmsFilePropertyNameValue", cmsFilePropertyNameValue);
        uiModel.addAttribute("cmsfiles", CmsFile.findAllCmsFiles());
        uiModel.addAttribute("propertynames", PropertyName.findAllPropertyNames());
        uiModel.addAttribute("propertyvalues", PropertyValue.findAllPropertyValues());
    }
    
    String CmsFilePropertyNameValueController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
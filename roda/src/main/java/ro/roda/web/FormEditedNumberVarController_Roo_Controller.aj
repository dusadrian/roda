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
import ro.roda.domain.FormEditedNumberVar;
import ro.roda.domain.FormEditedNumberVarPK;
import ro.roda.service.FormEditedNumberVarService;
import ro.roda.web.FormEditedNumberVarController;

privileged aspect FormEditedNumberVarController_Roo_Controller {
    
    private ConversionService FormEditedNumberVarController.conversionService;
    
    @Autowired
    FormEditedNumberVarService FormEditedNumberVarController.formEditedNumberVarService;
    
    @Autowired
    public FormEditedNumberVarController.new(ConversionService conversionService) {
        super();
        this.conversionService = conversionService;
    }

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String FormEditedNumberVarController.create(@Valid FormEditedNumberVar formEditedNumberVar, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, formEditedNumberVar);
            return "formeditednumbervars/create";
        }
        uiModel.asMap().clear();
        formEditedNumberVarService.saveFormEditedNumberVar(formEditedNumberVar);
        return "redirect:/formeditednumbervars/" + encodeUrlPathSegment(conversionService.convert(formEditedNumberVar.getId(), String.class), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String FormEditedNumberVarController.createForm(Model uiModel) {
        populateEditForm(uiModel, new FormEditedNumberVar());
        return "formeditednumbervars/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String FormEditedNumberVarController.show(@PathVariable("id") FormEditedNumberVarPK id, Model uiModel) {
        uiModel.addAttribute("formeditednumbervar", formEditedNumberVarService.findFormEditedNumberVar(id));
        uiModel.addAttribute("itemId", conversionService.convert(id, String.class));
        return "formeditednumbervars/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String FormEditedNumberVarController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("formeditednumbervars", formEditedNumberVarService.findFormEditedNumberVarEntries(firstResult, sizeNo));
            float nrOfPages = (float) formEditedNumberVarService.countAllFormEditedNumberVars() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("formeditednumbervars", formEditedNumberVarService.findAllFormEditedNumberVars());
        }
        return "formeditednumbervars/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String FormEditedNumberVarController.update(@Valid FormEditedNumberVar formEditedNumberVar, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, formEditedNumberVar);
            return "formeditednumbervars/update";
        }
        uiModel.asMap().clear();
        formEditedNumberVarService.updateFormEditedNumberVar(formEditedNumberVar);
        return "redirect:/formeditednumbervars/" + encodeUrlPathSegment(conversionService.convert(formEditedNumberVar.getId(), String.class), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String FormEditedNumberVarController.updateForm(@PathVariable("id") FormEditedNumberVarPK id, Model uiModel) {
        populateEditForm(uiModel, formEditedNumberVarService.findFormEditedNumberVar(id));
        return "formeditednumbervars/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String FormEditedNumberVarController.delete(@PathVariable("id") FormEditedNumberVarPK id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        FormEditedNumberVar formEditedNumberVar = formEditedNumberVarService.findFormEditedNumberVar(id);
        formEditedNumberVarService.deleteFormEditedNumberVar(formEditedNumberVar);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/formeditednumbervars";
    }
    
    void FormEditedNumberVarController.populateEditForm(Model uiModel, FormEditedNumberVar formEditedNumberVar) {
        uiModel.addAttribute("formEditedNumberVar", formEditedNumberVar);
    }
    
    String FormEditedNumberVarController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

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
import ro.roda.domain.TitleType;
import ro.roda.service.TitleTypeService;
import ro.roda.web.TitleTypeController;

privileged aspect TitleTypeController_Roo_Controller {
    
    @Autowired
    TitleTypeService TitleTypeController.titleTypeService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String TitleTypeController.create(@Valid TitleType titleType, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, titleType);
            return "titletypes/create";
        }
        uiModel.asMap().clear();
        titleTypeService.saveTitleType(titleType);
        return "redirect:/titletypes/" + encodeUrlPathSegment(titleType.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String TitleTypeController.createForm(Model uiModel) {
        populateEditForm(uiModel, new TitleType());
        return "titletypes/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String TitleTypeController.show(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("titletype", titleTypeService.findTitleType(id));
        uiModel.addAttribute("itemId", id);
        return "titletypes/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String TitleTypeController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("titletypes", titleTypeService.findTitleTypeEntries(firstResult, sizeNo));
            float nrOfPages = (float) titleTypeService.countAllTitleTypes() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("titletypes", titleTypeService.findAllTitleTypes());
        }
        return "titletypes/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String TitleTypeController.update(@Valid TitleType titleType, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, titleType);
            return "titletypes/update";
        }
        uiModel.asMap().clear();
        titleTypeService.updateTitleType(titleType);
        return "redirect:/titletypes/" + encodeUrlPathSegment(titleType.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String TitleTypeController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        populateEditForm(uiModel, titleTypeService.findTitleType(id));
        return "titletypes/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String TitleTypeController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        TitleType titleType = titleTypeService.findTitleType(id);
        titleTypeService.deleteTitleType(titleType);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/titletypes";
    }
    
    void TitleTypeController.populateEditForm(Model uiModel, TitleType titleType) {
        uiModel.addAttribute("titleType", titleType);
    }
    
    String TitleTypeController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

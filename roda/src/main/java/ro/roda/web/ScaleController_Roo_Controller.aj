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
import ro.roda.domain.Scale;
import ro.roda.service.ItemService;
import ro.roda.service.ScaleService;
import ro.roda.service.ValueService;
import ro.roda.web.ScaleController;

privileged aspect ScaleController_Roo_Controller {
    
    @Autowired
    ScaleService ScaleController.scaleService;
    
    @Autowired
    ItemService ScaleController.itemService;
    
    @Autowired
    ValueService ScaleController.valueService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ScaleController.create(@Valid Scale scale, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, scale);
            return "scales/create";
        }
        uiModel.asMap().clear();
        scaleService.saveScale(scale);
        return "redirect:/scales/" + encodeUrlPathSegment(scale.getItemId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ScaleController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Scale());
        return "scales/create";
    }
    
    @RequestMapping(value = "/{itemId}", produces = "text/html")
    public String ScaleController.show(@PathVariable("itemId") Long itemId, Model uiModel) {
        uiModel.addAttribute("scale", scaleService.findScale(itemId));
        uiModel.addAttribute("itemId", itemId);
        return "scales/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ScaleController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("scales", scaleService.findScaleEntries(firstResult, sizeNo));
            float nrOfPages = (float) scaleService.countAllScales() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("scales", scaleService.findAllScales());
        }
        return "scales/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ScaleController.update(@Valid Scale scale, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, scale);
            return "scales/update";
        }
        uiModel.asMap().clear();
        scaleService.updateScale(scale);
        return "redirect:/scales/" + encodeUrlPathSegment(scale.getItemId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{itemId}", params = "form", produces = "text/html")
    public String ScaleController.updateForm(@PathVariable("itemId") Long itemId, Model uiModel) {
        populateEditForm(uiModel, scaleService.findScale(itemId));
        return "scales/update";
    }
    
    @RequestMapping(value = "/{itemId}", method = RequestMethod.DELETE, produces = "text/html")
    public String ScaleController.delete(@PathVariable("itemId") Long itemId, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Scale scale = scaleService.findScale(itemId);
        scaleService.deleteScale(scale);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/scales";
    }
    
    void ScaleController.populateEditForm(Model uiModel, Scale scale) {
        uiModel.addAttribute("scale", scale);
        uiModel.addAttribute("items", itemService.findAllItems());
        uiModel.addAttribute("values", valueService.findAllValues());
    }
    
    String ScaleController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

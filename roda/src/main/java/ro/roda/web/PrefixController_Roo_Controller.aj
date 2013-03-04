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
import ro.roda.domain.Prefix;
import ro.roda.service.PrefixService;
import ro.roda.web.PrefixController;

privileged aspect PrefixController_Roo_Controller {
    
    @Autowired
    PrefixService PrefixController.prefixService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String PrefixController.create(@Valid Prefix prefix, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, prefix);
            return "prefixes/create";
        }
        uiModel.asMap().clear();
        prefixService.savePrefix(prefix);
        return "redirect:/prefixes/" + encodeUrlPathSegment(prefix.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String PrefixController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Prefix());
        return "prefixes/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String PrefixController.show(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("prefix", prefixService.findPrefix(id));
        uiModel.addAttribute("itemId", id);
        return "prefixes/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String PrefixController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("prefixes", prefixService.findPrefixEntries(firstResult, sizeNo));
            float nrOfPages = (float) prefixService.countAllPrefixes() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("prefixes", prefixService.findAllPrefixes());
        }
        return "prefixes/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String PrefixController.update(@Valid Prefix prefix, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, prefix);
            return "prefixes/update";
        }
        uiModel.asMap().clear();
        prefixService.updatePrefix(prefix);
        return "redirect:/prefixes/" + encodeUrlPathSegment(prefix.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String PrefixController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        populateEditForm(uiModel, prefixService.findPrefix(id));
        return "prefixes/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String PrefixController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Prefix prefix = prefixService.findPrefix(id);
        prefixService.deletePrefix(prefix);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/prefixes";
    }
    
    void PrefixController.populateEditForm(Model uiModel, Prefix prefix) {
        uiModel.addAttribute("prefix", prefix);
    }
    
    String PrefixController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

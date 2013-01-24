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
import ro.roda.Org;
import ro.roda.OrgSufix;
import ro.roda.web.OrgSufixController;

privileged aspect OrgSufixController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String OrgSufixController.create(@Valid OrgSufix orgSufix, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, orgSufix);
            return "orgsufixes/create";
        }
        uiModel.asMap().clear();
        orgSufix.persist();
        return "redirect:/orgsufixes/" + encodeUrlPathSegment(orgSufix.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String OrgSufixController.createForm(Model uiModel) {
        populateEditForm(uiModel, new OrgSufix());
        return "orgsufixes/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String OrgSufixController.show(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("orgsufix", OrgSufix.findOrgSufix(id));
        uiModel.addAttribute("itemId", id);
        return "orgsufixes/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String OrgSufixController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("orgsufixes", OrgSufix.findOrgSufixEntries(firstResult, sizeNo));
            float nrOfPages = (float) OrgSufix.countOrgSufixes() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("orgsufixes", OrgSufix.findAllOrgSufixes());
        }
        return "orgsufixes/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String OrgSufixController.update(@Valid OrgSufix orgSufix, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, orgSufix);
            return "orgsufixes/update";
        }
        uiModel.asMap().clear();
        orgSufix.merge();
        return "redirect:/orgsufixes/" + encodeUrlPathSegment(orgSufix.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String OrgSufixController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        populateEditForm(uiModel, OrgSufix.findOrgSufix(id));
        return "orgsufixes/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String OrgSufixController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        OrgSufix orgSufix = OrgSufix.findOrgSufix(id);
        orgSufix.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/orgsufixes";
    }
    
    void OrgSufixController.populateEditForm(Model uiModel, OrgSufix orgSufix) {
        uiModel.addAttribute("orgSufix", orgSufix);
        uiModel.addAttribute("orgs", Org.findAllOrgs());
    }
    
    String OrgSufixController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
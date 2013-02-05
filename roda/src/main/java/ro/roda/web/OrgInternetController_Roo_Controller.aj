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
import ro.roda.Internet;
import ro.roda.Org;
import ro.roda.OrgInternet;
import ro.roda.OrgInternetPK;
import ro.roda.web.OrgInternetController;

privileged aspect OrgInternetController_Roo_Controller {
    
    private ConversionService OrgInternetController.conversionService;
    
    @Autowired
    public OrgInternetController.new(ConversionService conversionService) {
        super();
        this.conversionService = conversionService;
    }

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String OrgInternetController.create(@Valid OrgInternet orgInternet, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, orgInternet);
            return "orginternets/create";
        }
        uiModel.asMap().clear();
        orgInternet.persist();
        return "redirect:/orginternets/" + encodeUrlPathSegment(conversionService.convert(orgInternet.getId(), String.class), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String OrgInternetController.createForm(Model uiModel) {
        populateEditForm(uiModel, new OrgInternet());
        return "orginternets/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String OrgInternetController.show(@PathVariable("id") OrgInternetPK id, Model uiModel) {
        uiModel.addAttribute("orginternet", OrgInternet.findOrgInternet(id));
        uiModel.addAttribute("itemId", conversionService.convert(id, String.class));
        return "orginternets/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String OrgInternetController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("orginternets", OrgInternet.findOrgInternetEntries(firstResult, sizeNo));
            float nrOfPages = (float) OrgInternet.countOrgInternets() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("orginternets", OrgInternet.findAllOrgInternets());
        }
        return "orginternets/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String OrgInternetController.update(@Valid OrgInternet orgInternet, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, orgInternet);
            return "orginternets/update";
        }
        uiModel.asMap().clear();
        orgInternet.merge();
        return "redirect:/orginternets/" + encodeUrlPathSegment(conversionService.convert(orgInternet.getId(), String.class), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String OrgInternetController.updateForm(@PathVariable("id") OrgInternetPK id, Model uiModel) {
        populateEditForm(uiModel, OrgInternet.findOrgInternet(id));
        return "orginternets/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String OrgInternetController.delete(@PathVariable("id") OrgInternetPK id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        OrgInternet orgInternet = OrgInternet.findOrgInternet(id);
        orgInternet.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/orginternets";
    }
    
    void OrgInternetController.populateEditForm(Model uiModel, OrgInternet orgInternet) {
        uiModel.addAttribute("orgInternet", orgInternet);
        uiModel.addAttribute("internets", Internet.findAllInternets());
        uiModel.addAttribute("orgs", Org.findAllOrgs());
    }
    
    String OrgInternetController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

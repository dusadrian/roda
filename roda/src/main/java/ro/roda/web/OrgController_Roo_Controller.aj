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
import ro.roda.domain.Org;
import ro.roda.service.InstanceOrgService;
import ro.roda.service.OrgAddressService;
import ro.roda.service.OrgEmailService;
import ro.roda.service.OrgInternetService;
import ro.roda.service.OrgPhoneService;
import ro.roda.service.OrgPrefixService;
import ro.roda.service.OrgRelationsService;
import ro.roda.service.OrgService;
import ro.roda.service.OrgSufixService;
import ro.roda.service.PersonOrgService;
import ro.roda.service.SourceService;
import ro.roda.service.StudyOrgService;
import ro.roda.web.OrgController;

privileged aspect OrgController_Roo_Controller {
    
    @Autowired
    OrgService OrgController.orgService;
    
    @Autowired
    InstanceOrgService OrgController.instanceOrgService;
    
    @Autowired
    OrgAddressService OrgController.orgAddressService;
    
    @Autowired
    OrgEmailService OrgController.orgEmailService;
    
    @Autowired
    OrgInternetService OrgController.orgInternetService;
    
    @Autowired
    OrgPhoneService OrgController.orgPhoneService;
    
    @Autowired
    OrgPrefixService OrgController.orgPrefixService;
    
    @Autowired
    OrgRelationsService OrgController.orgRelationsService;
    
    @Autowired
    OrgSufixService OrgController.orgSufixService;
    
    @Autowired
    PersonOrgService OrgController.personOrgService;
    
    @Autowired
    SourceService OrgController.sourceService;
    
    @Autowired
    StudyOrgService OrgController.studyOrgService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String OrgController.create(@Valid Org org, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, org);
            return "orgs/create";
        }
        uiModel.asMap().clear();
        orgService.saveOrg(org);
        return "redirect:/orgs/" + encodeUrlPathSegment(org.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String OrgController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Org());
        return "orgs/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String OrgController.show(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("org", orgService.findOrg(id));
        uiModel.addAttribute("itemId", id);
        return "orgs/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String OrgController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("orgs", orgService.findOrgEntries(firstResult, sizeNo));
            float nrOfPages = (float) orgService.countAllOrgs() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("orgs", orgService.findAllOrgs());
        }
        return "orgs/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String OrgController.update(@Valid Org org, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, org);
            return "orgs/update";
        }
        uiModel.asMap().clear();
        orgService.updateOrg(org);
        return "redirect:/orgs/" + encodeUrlPathSegment(org.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String OrgController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        populateEditForm(uiModel, orgService.findOrg(id));
        return "orgs/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String OrgController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Org org = orgService.findOrg(id);
        orgService.deleteOrg(org);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/orgs";
    }
    
    void OrgController.populateEditForm(Model uiModel, Org org) {
        uiModel.addAttribute("org", org);
        uiModel.addAttribute("instanceorgs", instanceOrgService.findAllInstanceOrgs());
        uiModel.addAttribute("orgaddresses", orgAddressService.findAllOrgAddresses());
        uiModel.addAttribute("orgemails", orgEmailService.findAllOrgEmails());
        uiModel.addAttribute("orginternets", orgInternetService.findAllOrgInternets());
        uiModel.addAttribute("orgphones", orgPhoneService.findAllOrgPhones());
        uiModel.addAttribute("orgprefixes", orgPrefixService.findAllOrgPrefixes());
        uiModel.addAttribute("orgrelationses", orgRelationsService.findAllOrgRelationses());
        uiModel.addAttribute("orgsufixes", orgSufixService.findAllOrgSufixes());
        uiModel.addAttribute("personorgs", personOrgService.findAllPersonOrgs());
        uiModel.addAttribute("sources", sourceService.findAllSources());
        uiModel.addAttribute("studyorgs", studyOrgService.findAllStudyOrgs());
    }
    
    String OrgController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

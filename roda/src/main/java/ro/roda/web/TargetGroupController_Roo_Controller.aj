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
import ro.roda.domain.TargetGroup;
import ro.roda.service.InstanceRightTargetGroupService;
import ro.roda.service.TargetGroupService;
import ro.roda.web.TargetGroupController;

privileged aspect TargetGroupController_Roo_Controller {
    
    @Autowired
    TargetGroupService TargetGroupController.targetGroupService;
    
    @Autowired
    InstanceRightTargetGroupService TargetGroupController.instanceRightTargetGroupService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String TargetGroupController.create(@Valid TargetGroup targetGroup, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, targetGroup);
            return "targetgroups/create";
        }
        uiModel.asMap().clear();
        targetGroupService.saveTargetGroup(targetGroup);
        return "redirect:/targetgroups/" + encodeUrlPathSegment(targetGroup.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String TargetGroupController.createForm(Model uiModel) {
        populateEditForm(uiModel, new TargetGroup());
        return "targetgroups/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String TargetGroupController.show(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("targetgroup", targetGroupService.findTargetGroup(id));
        uiModel.addAttribute("itemId", id);
        return "targetgroups/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String TargetGroupController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("targetgroups", targetGroupService.findTargetGroupEntries(firstResult, sizeNo));
            float nrOfPages = (float) targetGroupService.countAllTargetGroups() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("targetgroups", targetGroupService.findAllTargetGroups());
        }
        return "targetgroups/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String TargetGroupController.update(@Valid TargetGroup targetGroup, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, targetGroup);
            return "targetgroups/update";
        }
        uiModel.asMap().clear();
        targetGroupService.updateTargetGroup(targetGroup);
        return "redirect:/targetgroups/" + encodeUrlPathSegment(targetGroup.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String TargetGroupController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        populateEditForm(uiModel, targetGroupService.findTargetGroup(id));
        return "targetgroups/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String TargetGroupController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        TargetGroup targetGroup = targetGroupService.findTargetGroup(id);
        targetGroupService.deleteTargetGroup(targetGroup);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/targetgroups";
    }
    
    void TargetGroupController.populateEditForm(Model uiModel, TargetGroup targetGroup) {
        uiModel.addAttribute("targetGroup", targetGroup);
        uiModel.addAttribute("instancerighttargetgroups", instanceRightTargetGroupService.findAllInstanceRightTargetGroups());
    }
    
    String TargetGroupController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
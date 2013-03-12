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
import ro.roda.domain.Role;
import ro.roda.service.RodauserService;
import ro.roda.service.RoleService;
import ro.roda.web.RoleController;

privileged aspect RoleController_Roo_Controller {
    
    @Autowired
    RoleService RoleController.roleService;
    
    @Autowired
    RodauserService RoleController.rodauserService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String RoleController.create(@Valid Role role, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, role);
            return "roles/create";
        }
        uiModel.asMap().clear();
        roleService.saveRole(role);
        return "redirect:/roles/" + encodeUrlPathSegment(role.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String RoleController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Role());
        return "roles/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String RoleController.show(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("role", roleService.findRole(id));
        uiModel.addAttribute("itemId", id);
        return "roles/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String RoleController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("roles", roleService.findRoleEntries(firstResult, sizeNo));
            float nrOfPages = (float) roleService.countAllRoles() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("roles", roleService.findAllRoles());
        }
        return "roles/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String RoleController.update(@Valid Role role, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, role);
            return "roles/update";
        }
        uiModel.asMap().clear();
        roleService.updateRole(role);
        return "redirect:/roles/" + encodeUrlPathSegment(role.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String RoleController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        populateEditForm(uiModel, roleService.findRole(id));
        return "roles/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String RoleController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Role role = roleService.findRole(id);
        roleService.deleteRole(role);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/roles";
    }
    
    void RoleController.populateEditForm(Model uiModel, Role role) {
        uiModel.addAttribute("role", role);
        uiModel.addAttribute("rodausers", rodauserService.findAllRodausers());
    }
    
    String RoleController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

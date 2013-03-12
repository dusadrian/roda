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
import ro.roda.domain.Variable;
import ro.roda.service.ConceptService;
import ro.roda.service.FileService;
import ro.roda.service.FormEditedNumberVarService;
import ro.roda.service.FormEditedTextVarService;
import ro.roda.service.InstanceService;
import ro.roda.service.OtherStatisticService;
import ro.roda.service.SelectionVariableService;
import ro.roda.service.SkipService;
import ro.roda.service.VargroupService;
import ro.roda.service.VariableService;
import ro.roda.web.VariableController;

privileged aspect VariableController_Roo_Controller {
    
    @Autowired
    VariableService VariableController.variableService;
    
    @Autowired
    ConceptService VariableController.conceptService;
    
    @Autowired
    FileService VariableController.fileService;
    
    @Autowired
    FormEditedNumberVarService VariableController.formEditedNumberVarService;
    
    @Autowired
    FormEditedTextVarService VariableController.formEditedTextVarService;
    
    @Autowired
    InstanceService VariableController.instanceService;
    
    @Autowired
    OtherStatisticService VariableController.otherStatisticService;
    
    @Autowired
    SelectionVariableService VariableController.selectionVariableService;
    
    @Autowired
    SkipService VariableController.skipService;
    
    @Autowired
    VargroupService VariableController.vargroupService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String VariableController.create(@Valid Variable variable, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, variable);
            return "variables/create";
        }
        uiModel.asMap().clear();
        variableService.saveVariable(variable);
        return "redirect:/variables/" + encodeUrlPathSegment(variable.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String VariableController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Variable());
        return "variables/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String VariableController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("variable", variableService.findVariable(id));
        uiModel.addAttribute("itemId", id);
        return "variables/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String VariableController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("variables", variableService.findVariableEntries(firstResult, sizeNo));
            float nrOfPages = (float) variableService.countAllVariables() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("variables", variableService.findAllVariables());
        }
        return "variables/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String VariableController.update(@Valid Variable variable, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, variable);
            return "variables/update";
        }
        uiModel.asMap().clear();
        variableService.updateVariable(variable);
        return "redirect:/variables/" + encodeUrlPathSegment(variable.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String VariableController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, variableService.findVariable(id));
        return "variables/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String VariableController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Variable variable = variableService.findVariable(id);
        variableService.deleteVariable(variable);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/variables";
    }
    
    void VariableController.populateEditForm(Model uiModel, Variable variable) {
        uiModel.addAttribute("variable", variable);
        uiModel.addAttribute("concepts", conceptService.findAllConcepts());
        uiModel.addAttribute("files", fileService.findAllFiles());
        uiModel.addAttribute("formeditednumbervars", formEditedNumberVarService.findAllFormEditedNumberVars());
        uiModel.addAttribute("formeditedtextvars", formEditedTextVarService.findAllFormEditedTextVars());
        uiModel.addAttribute("instances", instanceService.findAllInstances());
        uiModel.addAttribute("otherstatistics", otherStatisticService.findAllOtherStatistics());
        uiModel.addAttribute("selectionvariables", selectionVariableService.findAllSelectionVariables());
        uiModel.addAttribute("skips", skipService.findAllSkips());
        uiModel.addAttribute("vargroups", vargroupService.findAllVargroups());
    }
    
    String VariableController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

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
import ro.roda.SelectionVariable;
import ro.roda.SelectionVariableItem;
import ro.roda.Variable;
import ro.roda.web.SelectionVariableController;

privileged aspect SelectionVariableController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String SelectionVariableController.create(@Valid SelectionVariable selectionVariable, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, selectionVariable);
            return "selectionvariables/create";
        }
        uiModel.asMap().clear();
        selectionVariable.persist();
        return "redirect:/selectionvariables/" + encodeUrlPathSegment(selectionVariable.getVariableId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String SelectionVariableController.createForm(Model uiModel) {
        populateEditForm(uiModel, new SelectionVariable());
        return "selectionvariables/create";
    }
    
    @RequestMapping(value = "/{variableId}", produces = "text/html")
    public String SelectionVariableController.show(@PathVariable("variableId") Long variableId, Model uiModel) {
        uiModel.addAttribute("selectionvariable", SelectionVariable.findSelectionVariable(variableId));
        uiModel.addAttribute("itemId", variableId);
        return "selectionvariables/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String SelectionVariableController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("selectionvariables", SelectionVariable.findSelectionVariableEntries(firstResult, sizeNo));
            float nrOfPages = (float) SelectionVariable.countSelectionVariables() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("selectionvariables", SelectionVariable.findAllSelectionVariables());
        }
        return "selectionvariables/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String SelectionVariableController.update(@Valid SelectionVariable selectionVariable, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, selectionVariable);
            return "selectionvariables/update";
        }
        uiModel.asMap().clear();
        selectionVariable.merge();
        return "redirect:/selectionvariables/" + encodeUrlPathSegment(selectionVariable.getVariableId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{variableId}", params = "form", produces = "text/html")
    public String SelectionVariableController.updateForm(@PathVariable("variableId") Long variableId, Model uiModel) {
        populateEditForm(uiModel, SelectionVariable.findSelectionVariable(variableId));
        return "selectionvariables/update";
    }
    
    @RequestMapping(value = "/{variableId}", method = RequestMethod.DELETE, produces = "text/html")
    public String SelectionVariableController.delete(@PathVariable("variableId") Long variableId, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        SelectionVariable selectionVariable = SelectionVariable.findSelectionVariable(variableId);
        selectionVariable.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/selectionvariables";
    }
    
    void SelectionVariableController.populateEditForm(Model uiModel, SelectionVariable selectionVariable) {
        uiModel.addAttribute("selectionVariable", selectionVariable);
        uiModel.addAttribute("selectionvariableitems", SelectionVariableItem.findAllSelectionVariableItems());
        uiModel.addAttribute("variables", Variable.findAllVariables());
    }
    
    String SelectionVariableController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

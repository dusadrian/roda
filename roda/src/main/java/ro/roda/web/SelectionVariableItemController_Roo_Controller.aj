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
import ro.roda.domain.SelectionVariableItem;
import ro.roda.domain.SelectionVariableItemPK;
import ro.roda.service.FileService;
import ro.roda.service.FormSelectionVarService;
import ro.roda.service.ItemService;
import ro.roda.service.SelectionVariableItemService;
import ro.roda.service.SelectionVariableService;
import ro.roda.web.SelectionVariableItemController;

privileged aspect SelectionVariableItemController_Roo_Controller {
    
    private ConversionService SelectionVariableItemController.conversionService;
    
    @Autowired
    SelectionVariableItemService SelectionVariableItemController.selectionVariableItemService;
    
    @Autowired
    FileService SelectionVariableItemController.fileService;
    
    @Autowired
    FormSelectionVarService SelectionVariableItemController.formSelectionVarService;
    
    @Autowired
    ItemService SelectionVariableItemController.itemService;
    
    @Autowired
    SelectionVariableService SelectionVariableItemController.selectionVariableService;
    
    @Autowired
    public SelectionVariableItemController.new(ConversionService conversionService) {
        super();
        this.conversionService = conversionService;
    }

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String SelectionVariableItemController.create(@Valid SelectionVariableItem selectionVariableItem, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, selectionVariableItem);
            return "selectionvariableitems/create";
        }
        uiModel.asMap().clear();
        selectionVariableItemService.saveSelectionVariableItem(selectionVariableItem);
        return "redirect:/selectionvariableitems/" + encodeUrlPathSegment(conversionService.convert(selectionVariableItem.getId(), String.class), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String SelectionVariableItemController.createForm(Model uiModel) {
        populateEditForm(uiModel, new SelectionVariableItem());
        return "selectionvariableitems/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String SelectionVariableItemController.show(@PathVariable("id") SelectionVariableItemPK id, Model uiModel) {
        uiModel.addAttribute("selectionvariableitem", selectionVariableItemService.findSelectionVariableItem(id));
        uiModel.addAttribute("itemId", conversionService.convert(id, String.class));
        return "selectionvariableitems/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String SelectionVariableItemController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("selectionvariableitems", selectionVariableItemService.findSelectionVariableItemEntries(firstResult, sizeNo));
            float nrOfPages = (float) selectionVariableItemService.countAllSelectionVariableItems() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("selectionvariableitems", selectionVariableItemService.findAllSelectionVariableItems());
        }
        return "selectionvariableitems/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String SelectionVariableItemController.update(@Valid SelectionVariableItem selectionVariableItem, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, selectionVariableItem);
            return "selectionvariableitems/update";
        }
        uiModel.asMap().clear();
        selectionVariableItemService.updateSelectionVariableItem(selectionVariableItem);
        return "redirect:/selectionvariableitems/" + encodeUrlPathSegment(conversionService.convert(selectionVariableItem.getId(), String.class), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String SelectionVariableItemController.updateForm(@PathVariable("id") SelectionVariableItemPK id, Model uiModel) {
        populateEditForm(uiModel, selectionVariableItemService.findSelectionVariableItem(id));
        return "selectionvariableitems/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String SelectionVariableItemController.delete(@PathVariable("id") SelectionVariableItemPK id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        SelectionVariableItem selectionVariableItem = selectionVariableItemService.findSelectionVariableItem(id);
        selectionVariableItemService.deleteSelectionVariableItem(selectionVariableItem);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/selectionvariableitems";
    }
    
    void SelectionVariableItemController.populateEditForm(Model uiModel, SelectionVariableItem selectionVariableItem) {
        uiModel.addAttribute("selectionVariableItem", selectionVariableItem);
        uiModel.addAttribute("files", fileService.findAllFiles());
        uiModel.addAttribute("formselectionvars", formSelectionVarService.findAllFormSelectionVars());
        uiModel.addAttribute("items", itemService.findAllItems());
        uiModel.addAttribute("selectionvariables", selectionVariableService.findAllSelectionVariables());
    }
    
    String SelectionVariableItemController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
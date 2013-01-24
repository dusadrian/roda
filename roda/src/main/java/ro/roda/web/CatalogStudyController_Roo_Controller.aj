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
import ro.roda.Catalog;
import ro.roda.CatalogStudy;
import ro.roda.CatalogStudyPK;
import ro.roda.Study;
import ro.roda.User;
import ro.roda.web.CatalogStudyController;

privileged aspect CatalogStudyController_Roo_Controller {
    
    private ConversionService CatalogStudyController.conversionService;
    
    @Autowired
    public CatalogStudyController.new(ConversionService conversionService) {
        super();
        this.conversionService = conversionService;
    }

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String CatalogStudyController.create(@Valid CatalogStudy catalogStudy, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, catalogStudy);
            return "catalogstudys/create";
        }
        uiModel.asMap().clear();
        catalogStudy.persist();
        return "redirect:/catalogstudys/" + encodeUrlPathSegment(conversionService.convert(catalogStudy.getId(), String.class), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String CatalogStudyController.createForm(Model uiModel) {
        populateEditForm(uiModel, new CatalogStudy());
        return "catalogstudys/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String CatalogStudyController.show(@PathVariable("id") CatalogStudyPK id, Model uiModel) {
        uiModel.addAttribute("catalogstudy", CatalogStudy.findCatalogStudy(id));
        uiModel.addAttribute("itemId", conversionService.convert(id, String.class));
        return "catalogstudys/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String CatalogStudyController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("catalogstudys", CatalogStudy.findCatalogStudyEntries(firstResult, sizeNo));
            float nrOfPages = (float) CatalogStudy.countCatalogStudys() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("catalogstudys", CatalogStudy.findAllCatalogStudys());
        }
        return "catalogstudys/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String CatalogStudyController.update(@Valid CatalogStudy catalogStudy, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, catalogStudy);
            return "catalogstudys/update";
        }
        uiModel.asMap().clear();
        catalogStudy.merge();
        return "redirect:/catalogstudys/" + encodeUrlPathSegment(conversionService.convert(catalogStudy.getId(), String.class), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String CatalogStudyController.updateForm(@PathVariable("id") CatalogStudyPK id, Model uiModel) {
        populateEditForm(uiModel, CatalogStudy.findCatalogStudy(id));
        return "catalogstudys/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String CatalogStudyController.delete(@PathVariable("id") CatalogStudyPK id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        CatalogStudy catalogStudy = CatalogStudy.findCatalogStudy(id);
        catalogStudy.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/catalogstudys";
    }
    
    void CatalogStudyController.populateEditForm(Model uiModel, CatalogStudy catalogStudy) {
        uiModel.addAttribute("catalogStudy", catalogStudy);
        uiModel.addAttribute("catalogs", Catalog.findAllCatalogs());
        uiModel.addAttribute("studys", Study.findAllStudys());
        uiModel.addAttribute("users", User.findAllUsers());
    }
    
    String CatalogStudyController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
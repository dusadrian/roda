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
import ro.roda.UnitAnalysis;
import ro.roda.service.InstanceService;
import ro.roda.service.UnitAnalysisService;
import ro.roda.web.UnitAnalysisController;

privileged aspect UnitAnalysisController_Roo_Controller {
    
    @Autowired
    UnitAnalysisService UnitAnalysisController.unitAnalysisService;
    
    @Autowired
    InstanceService UnitAnalysisController.instanceService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String UnitAnalysisController.create(@Valid UnitAnalysis unitAnalysis, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, unitAnalysis);
            return "unitanalyses/create";
        }
        uiModel.asMap().clear();
        unitAnalysisService.saveUnitAnalysis(unitAnalysis);
        return "redirect:/unitanalyses/" + encodeUrlPathSegment(unitAnalysis.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String UnitAnalysisController.createForm(Model uiModel) {
        populateEditForm(uiModel, new UnitAnalysis());
        return "unitanalyses/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String UnitAnalysisController.show(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("unitanalysis", unitAnalysisService.findUnitAnalysis(id));
        uiModel.addAttribute("itemId", id);
        return "unitanalyses/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String UnitAnalysisController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("unitanalyses", unitAnalysisService.findUnitAnalysisEntries(firstResult, sizeNo));
            float nrOfPages = (float) unitAnalysisService.countAllUnitAnalyses() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("unitanalyses", unitAnalysisService.findAllUnitAnalyses());
        }
        return "unitanalyses/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String UnitAnalysisController.update(@Valid UnitAnalysis unitAnalysis, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, unitAnalysis);
            return "unitanalyses/update";
        }
        uiModel.asMap().clear();
        unitAnalysisService.updateUnitAnalysis(unitAnalysis);
        return "redirect:/unitanalyses/" + encodeUrlPathSegment(unitAnalysis.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String UnitAnalysisController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        populateEditForm(uiModel, unitAnalysisService.findUnitAnalysis(id));
        return "unitanalyses/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String UnitAnalysisController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        UnitAnalysis unitAnalysis = unitAnalysisService.findUnitAnalysis(id);
        unitAnalysisService.deleteUnitAnalysis(unitAnalysis);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/unitanalyses";
    }
    
    void UnitAnalysisController.populateEditForm(Model uiModel, UnitAnalysis unitAnalysis) {
        uiModel.addAttribute("unitAnalysis", unitAnalysis);
        uiModel.addAttribute("instances", instanceService.findAllInstances());
    }
    
    String UnitAnalysisController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

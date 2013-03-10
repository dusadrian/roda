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
import ro.roda.domain.Study;
import ro.roda.service.StudyService;
import ro.roda.web.StudyController;

privileged aspect StudyController_Roo_Controller {
    
    @Autowired
    StudyService StudyController.studyService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String StudyController.create(@Valid Study study, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, study);
            return "studys/create";
        }
        uiModel.asMap().clear();
        studyService.saveStudy(study);
        return "redirect:/studys/" + encodeUrlPathSegment(study.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String StudyController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Study());
        return "studys/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String StudyController.show(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("study", studyService.findStudy(id));
        uiModel.addAttribute("itemId", id);
        return "studys/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String StudyController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("studys", studyService.findStudyEntries(firstResult, sizeNo));
            float nrOfPages = (float) studyService.countAllStudys() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("studys", studyService.findAllStudys());
        }
        return "studys/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String StudyController.update(@Valid Study study, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, study);
            return "studys/update";
        }
        uiModel.asMap().clear();
        studyService.updateStudy(study);
        return "redirect:/studys/" + encodeUrlPathSegment(study.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String StudyController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        populateEditForm(uiModel, studyService.findStudy(id));
        return "studys/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String StudyController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Study study = studyService.findStudy(id);
        studyService.deleteStudy(study);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/studys";
    }
    
    void StudyController.populateEditForm(Model uiModel, Study study) {
        uiModel.addAttribute("study", study);
    }
    
    String StudyController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

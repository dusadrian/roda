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
import ro.roda.StudyPersonAsoc;
import ro.roda.web.StudyPersonAsocController;

privileged aspect StudyPersonAsocController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String StudyPersonAsocController.create(@Valid StudyPersonAsoc studyPersonAsoc, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, studyPersonAsoc);
            return "studypersonasocs/create";
        }
        uiModel.asMap().clear();
        studyPersonAsoc.persist();
        return "redirect:/studypersonasocs/" + encodeUrlPathSegment(studyPersonAsoc.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String StudyPersonAsocController.createForm(Model uiModel) {
        populateEditForm(uiModel, new StudyPersonAsoc());
        return "studypersonasocs/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String StudyPersonAsocController.show(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("studypersonasoc", StudyPersonAsoc.findStudyPersonAsoc(id));
        uiModel.addAttribute("itemId", id);
        return "studypersonasocs/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String StudyPersonAsocController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("studypersonasocs", StudyPersonAsoc.findStudyPersonAsocEntries(firstResult, sizeNo));
            float nrOfPages = (float) StudyPersonAsoc.countStudyPersonAsocs() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("studypersonasocs", StudyPersonAsoc.findAllStudyPersonAsocs());
        }
        return "studypersonasocs/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String StudyPersonAsocController.update(@Valid StudyPersonAsoc studyPersonAsoc, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, studyPersonAsoc);
            return "studypersonasocs/update";
        }
        uiModel.asMap().clear();
        studyPersonAsoc.merge();
        return "redirect:/studypersonasocs/" + encodeUrlPathSegment(studyPersonAsoc.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String StudyPersonAsocController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        populateEditForm(uiModel, StudyPersonAsoc.findStudyPersonAsoc(id));
        return "studypersonasocs/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String StudyPersonAsocController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        StudyPersonAsoc studyPersonAsoc = StudyPersonAsoc.findStudyPersonAsoc(id);
        studyPersonAsoc.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/studypersonasocs";
    }
    
    void StudyPersonAsocController.populateEditForm(Model uiModel, StudyPersonAsoc studyPersonAsoc) {
        uiModel.addAttribute("studyPersonAsoc", studyPersonAsoc);
    }
    
    String StudyPersonAsocController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

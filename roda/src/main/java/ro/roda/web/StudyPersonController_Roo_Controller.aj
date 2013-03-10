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
import ro.roda.domain.StudyPerson;
import ro.roda.domain.StudyPersonPK;
import ro.roda.service.StudyPersonService;
import ro.roda.web.StudyPersonController;

privileged aspect StudyPersonController_Roo_Controller {
    
    private ConversionService StudyPersonController.conversionService;
    
    @Autowired
    StudyPersonService StudyPersonController.studyPersonService;
    
    @Autowired
    public StudyPersonController.new(ConversionService conversionService) {
        super();
        this.conversionService = conversionService;
    }

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String StudyPersonController.create(@Valid StudyPerson studyPerson, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, studyPerson);
            return "studypeople/create";
        }
        uiModel.asMap().clear();
        studyPersonService.saveStudyPerson(studyPerson);
        return "redirect:/studypeople/" + encodeUrlPathSegment(conversionService.convert(studyPerson.getId(), String.class), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String StudyPersonController.createForm(Model uiModel) {
        populateEditForm(uiModel, new StudyPerson());
        return "studypeople/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String StudyPersonController.show(@PathVariable("id") StudyPersonPK id, Model uiModel) {
        uiModel.addAttribute("studyperson", studyPersonService.findStudyPerson(id));
        uiModel.addAttribute("itemId", conversionService.convert(id, String.class));
        return "studypeople/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String StudyPersonController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("studypeople", studyPersonService.findStudyPersonEntries(firstResult, sizeNo));
            float nrOfPages = (float) studyPersonService.countAllStudypeople() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("studypeople", studyPersonService.findAllStudypeople());
        }
        return "studypeople/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String StudyPersonController.update(@Valid StudyPerson studyPerson, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, studyPerson);
            return "studypeople/update";
        }
        uiModel.asMap().clear();
        studyPersonService.updateStudyPerson(studyPerson);
        return "redirect:/studypeople/" + encodeUrlPathSegment(conversionService.convert(studyPerson.getId(), String.class), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String StudyPersonController.updateForm(@PathVariable("id") StudyPersonPK id, Model uiModel) {
        populateEditForm(uiModel, studyPersonService.findStudyPerson(id));
        return "studypeople/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String StudyPersonController.delete(@PathVariable("id") StudyPersonPK id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        StudyPerson studyPerson = studyPersonService.findStudyPerson(id);
        studyPersonService.deleteStudyPerson(studyPerson);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/studypeople";
    }
    
    void StudyPersonController.populateEditForm(Model uiModel, StudyPerson studyPerson) {
        uiModel.addAttribute("studyPerson", studyPerson);
    }
    
    String StudyPersonController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

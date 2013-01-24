// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.web;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.core.convert.ConversionService;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;
import ro.roda.Keyword;
import ro.roda.Study;
import ro.roda.StudyKeyword;
import ro.roda.StudyKeywordPK;
import ro.roda.web.StudyKeywordController;

privileged aspect StudyKeywordController_Roo_Controller {
    
    private ConversionService StudyKeywordController.conversionService;
    
    @Autowired
    public StudyKeywordController.new(ConversionService conversionService) {
        super();
        this.conversionService = conversionService;
    }

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String StudyKeywordController.create(@Valid StudyKeyword studyKeyword, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, studyKeyword);
            return "studykeywords/create";
        }
        uiModel.asMap().clear();
        studyKeyword.persist();
        return "redirect:/studykeywords/" + encodeUrlPathSegment(conversionService.convert(studyKeyword.getId(), String.class), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String StudyKeywordController.createForm(Model uiModel) {
        populateEditForm(uiModel, new StudyKeyword());
        return "studykeywords/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String StudyKeywordController.show(@PathVariable("id") StudyKeywordPK id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("studykeyword", StudyKeyword.findStudyKeyword(id));
        uiModel.addAttribute("itemId", conversionService.convert(id, String.class));
        return "studykeywords/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String StudyKeywordController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("studykeywords", StudyKeyword.findStudyKeywordEntries(firstResult, sizeNo));
            float nrOfPages = (float) StudyKeyword.countStudyKeywords() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("studykeywords", StudyKeyword.findAllStudyKeywords());
        }
        addDateTimeFormatPatterns(uiModel);
        return "studykeywords/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String StudyKeywordController.update(@Valid StudyKeyword studyKeyword, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, studyKeyword);
            return "studykeywords/update";
        }
        uiModel.asMap().clear();
        studyKeyword.merge();
        return "redirect:/studykeywords/" + encodeUrlPathSegment(conversionService.convert(studyKeyword.getId(), String.class), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String StudyKeywordController.updateForm(@PathVariable("id") StudyKeywordPK id, Model uiModel) {
        populateEditForm(uiModel, StudyKeyword.findStudyKeyword(id));
        return "studykeywords/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String StudyKeywordController.delete(@PathVariable("id") StudyKeywordPK id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        StudyKeyword studyKeyword = StudyKeyword.findStudyKeyword(id);
        studyKeyword.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/studykeywords";
    }
    
    void StudyKeywordController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("studyKeyword_added_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void StudyKeywordController.populateEditForm(Model uiModel, StudyKeyword studyKeyword) {
        uiModel.addAttribute("studyKeyword", studyKeyword);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("keywords", Keyword.findAllKeywords());
        uiModel.addAttribute("studys", Study.findAllStudys());
    }
    
    String StudyKeywordController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
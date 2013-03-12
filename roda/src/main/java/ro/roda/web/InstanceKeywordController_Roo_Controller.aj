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
import ro.roda.domain.InstanceKeyword;
import ro.roda.domain.InstanceKeywordPK;
import ro.roda.service.InstanceKeywordService;
import ro.roda.service.InstanceService;
import ro.roda.service.KeywordService;
import ro.roda.service.RodauserService;
import ro.roda.web.InstanceKeywordController;

privileged aspect InstanceKeywordController_Roo_Controller {
    
    private ConversionService InstanceKeywordController.conversionService;
    
    @Autowired
    InstanceKeywordService InstanceKeywordController.instanceKeywordService;
    
    @Autowired
    InstanceService InstanceKeywordController.instanceService;
    
    @Autowired
    KeywordService InstanceKeywordController.keywordService;
    
    @Autowired
    RodauserService InstanceKeywordController.rodauserService;
    
    @Autowired
    public InstanceKeywordController.new(ConversionService conversionService) {
        super();
        this.conversionService = conversionService;
    }

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String InstanceKeywordController.create(@Valid InstanceKeyword instanceKeyword, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, instanceKeyword);
            return "instancekeywords/create";
        }
        uiModel.asMap().clear();
        instanceKeywordService.saveInstanceKeyword(instanceKeyword);
        return "redirect:/instancekeywords/" + encodeUrlPathSegment(conversionService.convert(instanceKeyword.getId(), String.class), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String InstanceKeywordController.createForm(Model uiModel) {
        populateEditForm(uiModel, new InstanceKeyword());
        return "instancekeywords/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String InstanceKeywordController.show(@PathVariable("id") InstanceKeywordPK id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("instancekeyword", instanceKeywordService.findInstanceKeyword(id));
        uiModel.addAttribute("itemId", conversionService.convert(id, String.class));
        return "instancekeywords/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String InstanceKeywordController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("instancekeywords", instanceKeywordService.findInstanceKeywordEntries(firstResult, sizeNo));
            float nrOfPages = (float) instanceKeywordService.countAllInstanceKeywords() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("instancekeywords", instanceKeywordService.findAllInstanceKeywords());
        }
        addDateTimeFormatPatterns(uiModel);
        return "instancekeywords/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String InstanceKeywordController.update(@Valid InstanceKeyword instanceKeyword, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, instanceKeyword);
            return "instancekeywords/update";
        }
        uiModel.asMap().clear();
        instanceKeywordService.updateInstanceKeyword(instanceKeyword);
        return "redirect:/instancekeywords/" + encodeUrlPathSegment(conversionService.convert(instanceKeyword.getId(), String.class), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String InstanceKeywordController.updateForm(@PathVariable("id") InstanceKeywordPK id, Model uiModel) {
        populateEditForm(uiModel, instanceKeywordService.findInstanceKeyword(id));
        return "instancekeywords/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String InstanceKeywordController.delete(@PathVariable("id") InstanceKeywordPK id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        InstanceKeyword instanceKeyword = instanceKeywordService.findInstanceKeyword(id);
        instanceKeywordService.deleteInstanceKeyword(instanceKeyword);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/instancekeywords";
    }
    
    void InstanceKeywordController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("instanceKeyword_added_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }
    
    void InstanceKeywordController.populateEditForm(Model uiModel, InstanceKeyword instanceKeyword) {
        uiModel.addAttribute("instanceKeyword", instanceKeyword);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("instances", instanceService.findAllInstances());
        uiModel.addAttribute("keywords", keywordService.findAllKeywords());
        uiModel.addAttribute("rodausers", rodauserService.findAllRodausers());
    }
    
    String InstanceKeywordController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

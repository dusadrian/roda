// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.web;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;
import ro.roda.Source;
import ro.roda.Sourcetype;
import ro.roda.SourcetypeHistory;
import ro.roda.User;
import ro.roda.web.SourcetypeHistoryController;

privileged aspect SourcetypeHistoryController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String SourcetypeHistoryController.create(@Valid SourcetypeHistory sourcetypeHistory, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, sourcetypeHistory);
            return "sourcetypehistorys/create";
        }
        uiModel.asMap().clear();
        sourcetypeHistory.persist();
        return "redirect:/sourcetypehistorys/" + encodeUrlPathSegment(sourcetypeHistory.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String SourcetypeHistoryController.createForm(Model uiModel) {
        populateEditForm(uiModel, new SourcetypeHistory());
        return "sourcetypehistorys/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String SourcetypeHistoryController.show(@PathVariable("id") Integer id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("sourcetypehistory", SourcetypeHistory.findSourcetypeHistory(id));
        uiModel.addAttribute("itemId", id);
        return "sourcetypehistorys/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String SourcetypeHistoryController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("sourcetypehistorys", SourcetypeHistory.findSourcetypeHistoryEntries(firstResult, sizeNo));
            float nrOfPages = (float) SourcetypeHistory.countSourcetypeHistorys() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("sourcetypehistorys", SourcetypeHistory.findAllSourcetypeHistorys());
        }
        addDateTimeFormatPatterns(uiModel);
        return "sourcetypehistorys/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String SourcetypeHistoryController.update(@Valid SourcetypeHistory sourcetypeHistory, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, sourcetypeHistory);
            return "sourcetypehistorys/update";
        }
        uiModel.asMap().clear();
        sourcetypeHistory.merge();
        return "redirect:/sourcetypehistorys/" + encodeUrlPathSegment(sourcetypeHistory.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String SourcetypeHistoryController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        populateEditForm(uiModel, SourcetypeHistory.findSourcetypeHistory(id));
        return "sourcetypehistorys/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String SourcetypeHistoryController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        SourcetypeHistory sourcetypeHistory = SourcetypeHistory.findSourcetypeHistory(id);
        sourcetypeHistory.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/sourcetypehistorys";
    }
    
    void SourcetypeHistoryController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("sourcetypeHistory_datestart_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("sourcetypeHistory_dateend_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void SourcetypeHistoryController.populateEditForm(Model uiModel, SourcetypeHistory sourcetypeHistory) {
        uiModel.addAttribute("sourcetypeHistory", sourcetypeHistory);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("sources", Source.findAllSources());
        uiModel.addAttribute("sourcetypes", Sourcetype.findAllSourcetypes());
        uiModel.addAttribute("users", User.findAllUsers());
    }
    
    String SourcetypeHistoryController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

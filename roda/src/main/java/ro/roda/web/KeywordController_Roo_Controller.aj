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
import ro.roda.domain.Keyword;
import ro.roda.service.KeywordService;
import ro.roda.web.KeywordController;

privileged aspect KeywordController_Roo_Controller {
    
    @Autowired
    KeywordService KeywordController.keywordService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String KeywordController.create(@Valid Keyword keyword, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, keyword);
            return "keywords/create";
        }
        uiModel.asMap().clear();
        keywordService.saveKeyword(keyword);
        return "redirect:/keywords/" + encodeUrlPathSegment(keyword.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String KeywordController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Keyword());
        return "keywords/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String KeywordController.show(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("keyword", keywordService.findKeyword(id));
        uiModel.addAttribute("itemId", id);
        return "keywords/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String KeywordController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("keywords", keywordService.findKeywordEntries(firstResult, sizeNo));
            float nrOfPages = (float) keywordService.countAllKeywords() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("keywords", keywordService.findAllKeywords());
        }
        return "keywords/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String KeywordController.update(@Valid Keyword keyword, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, keyword);
            return "keywords/update";
        }
        uiModel.asMap().clear();
        keywordService.updateKeyword(keyword);
        return "redirect:/keywords/" + encodeUrlPathSegment(keyword.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String KeywordController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        populateEditForm(uiModel, keywordService.findKeyword(id));
        return "keywords/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String KeywordController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Keyword keyword = keywordService.findKeyword(id);
        keywordService.deleteKeyword(keyword);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/keywords";
    }
    
    void KeywordController.populateEditForm(Model uiModel, Keyword keyword) {
        uiModel.addAttribute("keyword", keyword);
    }
    
    String KeywordController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

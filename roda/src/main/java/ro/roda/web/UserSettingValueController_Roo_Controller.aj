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
import ro.roda.UserSettingValue;
import ro.roda.UserSettingValuePK;
import ro.roda.service.UserSettingValueService;
import ro.roda.web.UserSettingValueController;

privileged aspect UserSettingValueController_Roo_Controller {
    
    private ConversionService UserSettingValueController.conversionService;
    
    @Autowired
    UserSettingValueService UserSettingValueController.userSettingValueService;
    
    @Autowired
    public UserSettingValueController.new(ConversionService conversionService) {
        super();
        this.conversionService = conversionService;
    }

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String UserSettingValueController.create(@Valid UserSettingValue userSettingValue, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, userSettingValue);
            return "usersettingvalues/create";
        }
        uiModel.asMap().clear();
        userSettingValueService.saveUserSettingValue(userSettingValue);
        return "redirect:/usersettingvalues/" + encodeUrlPathSegment(conversionService.convert(userSettingValue.getId(), String.class), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String UserSettingValueController.createForm(Model uiModel) {
        populateEditForm(uiModel, new UserSettingValue());
        return "usersettingvalues/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String UserSettingValueController.show(@PathVariable("id") UserSettingValuePK id, Model uiModel) {
        uiModel.addAttribute("usersettingvalue", userSettingValueService.findUserSettingValue(id));
        uiModel.addAttribute("itemId", conversionService.convert(id, String.class));
        return "usersettingvalues/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String UserSettingValueController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("usersettingvalues", userSettingValueService.findUserSettingValueEntries(firstResult, sizeNo));
            float nrOfPages = (float) userSettingValueService.countAllUserSettingValues() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("usersettingvalues", userSettingValueService.findAllUserSettingValues());
        }
        return "usersettingvalues/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String UserSettingValueController.update(@Valid UserSettingValue userSettingValue, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, userSettingValue);
            return "usersettingvalues/update";
        }
        uiModel.asMap().clear();
        userSettingValueService.updateUserSettingValue(userSettingValue);
        return "redirect:/usersettingvalues/" + encodeUrlPathSegment(conversionService.convert(userSettingValue.getId(), String.class), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String UserSettingValueController.updateForm(@PathVariable("id") UserSettingValuePK id, Model uiModel) {
        populateEditForm(uiModel, userSettingValueService.findUserSettingValue(id));
        return "usersettingvalues/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String UserSettingValueController.delete(@PathVariable("id") UserSettingValuePK id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        UserSettingValue userSettingValue = userSettingValueService.findUserSettingValue(id);
        userSettingValueService.deleteUserSettingValue(userSettingValue);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/usersettingvalues";
    }
    
    void UserSettingValueController.populateEditForm(Model uiModel, UserSettingValue userSettingValue) {
        uiModel.addAttribute("userSettingValue", userSettingValue);
    }
    
    String UserSettingValueController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

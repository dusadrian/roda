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
import ro.roda.domain.UserMessage;
import ro.roda.service.UserMessageService;
import ro.roda.web.UserMessageController;

privileged aspect UserMessageController_Roo_Controller {
    
    @Autowired
    UserMessageService UserMessageController.userMessageService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String UserMessageController.create(@Valid UserMessage userMessage, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, userMessage);
            return "usermessages/create";
        }
        uiModel.asMap().clear();
        userMessageService.saveUserMessage(userMessage);
        return "redirect:/usermessages/" + encodeUrlPathSegment(userMessage.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String UserMessageController.createForm(Model uiModel) {
        populateEditForm(uiModel, new UserMessage());
        return "usermessages/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String UserMessageController.show(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("usermessage", userMessageService.findUserMessage(id));
        uiModel.addAttribute("itemId", id);
        return "usermessages/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String UserMessageController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("usermessages", userMessageService.findUserMessageEntries(firstResult, sizeNo));
            float nrOfPages = (float) userMessageService.countAllUserMessages() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("usermessages", userMessageService.findAllUserMessages());
        }
        return "usermessages/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String UserMessageController.update(@Valid UserMessage userMessage, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, userMessage);
            return "usermessages/update";
        }
        uiModel.asMap().clear();
        userMessageService.updateUserMessage(userMessage);
        return "redirect:/usermessages/" + encodeUrlPathSegment(userMessage.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String UserMessageController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        populateEditForm(uiModel, userMessageService.findUserMessage(id));
        return "usermessages/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String UserMessageController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        UserMessage userMessage = userMessageService.findUserMessage(id);
        userMessageService.deleteUserMessage(userMessage);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/usermessages";
    }
    
    void UserMessageController.populateEditForm(Model uiModel, UserMessage userMessage) {
        uiModel.addAttribute("userMessage", userMessage);
    }
    
    String UserMessageController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

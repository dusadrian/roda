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
import ro.roda.domain.Topic;
import ro.roda.service.TopicService;
import ro.roda.web.TopicController;

privileged aspect TopicController_Roo_Controller {
    
    @Autowired
    TopicService TopicController.topicService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String TopicController.create(@Valid Topic topic, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, topic);
            return "topics/create";
        }
        uiModel.asMap().clear();
        topicService.saveTopic(topic);
        return "redirect:/topics/" + encodeUrlPathSegment(topic.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String TopicController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Topic());
        return "topics/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String TopicController.show(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("topic", topicService.findTopic(id));
        uiModel.addAttribute("itemId", id);
        return "topics/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String TopicController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("topics", topicService.findTopicEntries(firstResult, sizeNo));
            float nrOfPages = (float) topicService.countAllTopics() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("topics", topicService.findAllTopics());
        }
        return "topics/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String TopicController.update(@Valid Topic topic, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, topic);
            return "topics/update";
        }
        uiModel.asMap().clear();
        topicService.updateTopic(topic);
        return "redirect:/topics/" + encodeUrlPathSegment(topic.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String TopicController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        populateEditForm(uiModel, topicService.findTopic(id));
        return "topics/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String TopicController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Topic topic = topicService.findTopic(id);
        topicService.deleteTopic(topic);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/topics";
    }
    
    void TopicController.populateEditForm(Model uiModel, Topic topic) {
        uiModel.addAttribute("topic", topic);
    }
    
    String TopicController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

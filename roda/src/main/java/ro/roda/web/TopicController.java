package ro.roda.web;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import ro.roda.Topic;

@RequestMapping("/topics")
@Controller
@RooWebScaffold(path = "topics", formBackingObject = Topic.class)
public class TopicController {
}
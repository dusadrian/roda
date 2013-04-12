package ro.roda.web;

import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import ro.roda.domain.PersonLinks;

@RequestMapping("/personlinkses")
@Controller
@RooWebScaffold(path = "personlinkses", formBackingObject = PersonLinks.class)
@RooWebJson(jsonObject = PersonLinks.class)
public class PersonLinksController {
}

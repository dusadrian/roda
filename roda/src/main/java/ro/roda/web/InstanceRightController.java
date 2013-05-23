package ro.roda.web;

import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import ro.roda.domain.InstanceRight;

@RequestMapping("/instancerights")
@Controller
@RooWebScaffold(path = "instancerights", formBackingObject = InstanceRight.class)
@RooWebJson(jsonObject = InstanceRight.class)
public class InstanceRightController {
}
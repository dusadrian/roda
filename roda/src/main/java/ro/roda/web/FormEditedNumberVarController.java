package ro.roda.web;

import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import ro.roda.domain.FormEditedNumberVar;

@RequestMapping("/formeditednumbervars")
@Controller
@RooWebScaffold(path = "formeditednumbervars", formBackingObject = FormEditedNumberVar.class)
@RooWebJson(jsonObject = FormEditedNumberVar.class)
public class FormEditedNumberVarController {
}

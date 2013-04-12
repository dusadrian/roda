package ro.roda.web;

import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import ro.roda.domain.SelectionVariable;

@RequestMapping("/selectionvariables")
@Controller
@RooWebScaffold(path = "selectionvariables", formBackingObject = SelectionVariable.class)
@RooWebJson(jsonObject = SelectionVariable.class)
public class SelectionVariableController {
}

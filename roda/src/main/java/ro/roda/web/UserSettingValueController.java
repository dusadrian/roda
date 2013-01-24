package ro.roda.web;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import ro.roda.UserSettingValue;

@RequestMapping("/usersettingvalues")
@Controller
@RooWebScaffold(path = "usersettingvalues", formBackingObject = UserSettingValue.class)
public class UserSettingValueController {
}
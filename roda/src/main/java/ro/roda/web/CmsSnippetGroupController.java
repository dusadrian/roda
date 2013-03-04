package ro.roda.web;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import ro.roda.domain.CmsSnippetGroup;

@RequestMapping("/cmssnippetgroups")
@Controller
@RooWebScaffold(path = "cmssnippetgroups", formBackingObject = CmsSnippetGroup.class)
public class CmsSnippetGroupController {
}

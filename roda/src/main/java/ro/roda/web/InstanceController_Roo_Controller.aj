// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.web;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;
import ro.roda.CollectionModelType;
import ro.roda.File;
import ro.roda.Form;
import ro.roda.Instance;
import ro.roda.InstanceAcl;
import ro.roda.InstanceDescr;
import ro.roda.InstanceKeyword;
import ro.roda.InstanceOrg;
import ro.roda.InstancePerson;
import ro.roda.SamplingProcedure;
import ro.roda.Study;
import ro.roda.TimeMethType;
import ro.roda.Topic;
import ro.roda.UnitAnalysis;
import ro.roda.User;
import ro.roda.Variable;
import ro.roda.web.InstanceController;

privileged aspect InstanceController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String InstanceController.create(@Valid Instance instance, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, instance);
            return "instances/create";
        }
        uiModel.asMap().clear();
        instance.persist();
        return "redirect:/instances/" + encodeUrlPathSegment(instance.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String InstanceController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Instance());
        return "instances/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String InstanceController.show(@PathVariable("id") Integer id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("instance", Instance.findInstance(id));
        uiModel.addAttribute("itemId", id);
        return "instances/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String InstanceController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("instances", Instance.findInstanceEntries(firstResult, sizeNo));
            float nrOfPages = (float) Instance.countInstances() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("instances", Instance.findAllInstances());
        }
        addDateTimeFormatPatterns(uiModel);
        return "instances/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String InstanceController.update(@Valid Instance instance, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, instance);
            return "instances/update";
        }
        uiModel.asMap().clear();
        instance.merge();
        return "redirect:/instances/" + encodeUrlPathSegment(instance.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String InstanceController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        populateEditForm(uiModel, Instance.findInstance(id));
        return "instances/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String InstanceController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Instance instance = Instance.findInstance(id);
        instance.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/instances";
    }
    
    void InstanceController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("instance_datestart_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("instance_dateend_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("instance_added_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void InstanceController.populateEditForm(Model uiModel, Instance instance) {
        uiModel.addAttribute("instance", instance);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("collectionmodeltypes", CollectionModelType.findAllCollectionModelTypes());
        uiModel.addAttribute("files", File.findAllFiles());
        uiModel.addAttribute("forms", Form.findAllForms());
        uiModel.addAttribute("instanceacls", InstanceAcl.findAllInstanceAcls());
        uiModel.addAttribute("instancedescrs", InstanceDescr.findAllInstanceDescrs());
        uiModel.addAttribute("instancekeywords", InstanceKeyword.findAllInstanceKeywords());
        uiModel.addAttribute("instanceorgs", InstanceOrg.findAllInstanceOrgs());
        uiModel.addAttribute("instancepeople", InstancePerson.findAllInstancepeople());
        uiModel.addAttribute("samplingprocedures", SamplingProcedure.findAllSamplingProcedures());
        uiModel.addAttribute("studys", Study.findAllStudys());
        uiModel.addAttribute("timemethtypes", TimeMethType.findAllTimeMethTypes());
        uiModel.addAttribute("topics", Topic.findAllTopics());
        uiModel.addAttribute("unitanalyses", UnitAnalysis.findAllUnitAnalyses());
        uiModel.addAttribute("users", User.findAllUsers());
        uiModel.addAttribute("variables", Variable.findAllVariables());
    }
    
    String InstanceController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

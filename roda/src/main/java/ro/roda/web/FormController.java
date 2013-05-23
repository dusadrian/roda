package ro.roda.web;

import java.io.UnsupportedEncodingException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;
import ro.roda.domain.Form;
import ro.roda.service.FormEditedNumberVarService;
import ro.roda.service.FormEditedTextVarService;
import ro.roda.service.FormSelectionVarService;
import ro.roda.service.FormService;
import ro.roda.service.InstanceFormService;
import ro.roda.service.PersonService;

@RequestMapping("/forms")
@Controller
public class FormController {

	@RequestMapping(value = "/{id}", headers = "Accept=application/json")
	@ResponseBody
	public ResponseEntity<String> showJson(@PathVariable("id") Long id) {
		Form form = formService.findForm(id);
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json; charset=utf-8");
		if (form == null) {
			return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>(form.toJson(), headers, HttpStatus.OK);
	}

	@RequestMapping(headers = "Accept=application/json")
	@ResponseBody
	public ResponseEntity<String> listJson() {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json; charset=utf-8");
		List<Form> result = formService.findAllForms();
		return new ResponseEntity<String>(Form.toJsonArray(result), headers, HttpStatus.OK);
	}

	@RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
	public ResponseEntity<String> createFromJson(@RequestBody String json) {
		Form form = Form.fromJsonToForm(json);
		formService.saveForm(form);
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		return new ResponseEntity<String>(headers, HttpStatus.CREATED);
	}

	@RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
	public ResponseEntity<String> createFromJsonArray(@RequestBody String json) {
		for (Form form : Form.fromJsonArrayToForms(json)) {
			formService.saveForm(form);
		}
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		return new ResponseEntity<String>(headers, HttpStatus.CREATED);
	}

	@RequestMapping(method = RequestMethod.PUT, headers = "Accept=application/json")
	public ResponseEntity<String> updateFromJson(@RequestBody String json) {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		Form form = Form.fromJsonToForm(json);
		if (formService.updateForm(form) == null) {
			return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>(headers, HttpStatus.OK);
	}

	@RequestMapping(value = "/jsonArray", method = RequestMethod.PUT, headers = "Accept=application/json")
	public ResponseEntity<String> updateFromJsonArray(@RequestBody String json) {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		for (Form form : Form.fromJsonArrayToForms(json)) {
			if (formService.updateForm(form) == null) {
				return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
			}
		}
		return new ResponseEntity<String>(headers, HttpStatus.OK);
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
	public ResponseEntity<String> deleteFromJson(@PathVariable("id") Long id) {
		Form form = formService.findForm(id);
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		if (form == null) {
			return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
		}
		formService.deleteForm(form);
		return new ResponseEntity<String>(headers, HttpStatus.OK);
	}

	@Autowired
	FormService formService;

	@Autowired
	FormEditedNumberVarService formEditedNumberVarService;

	@Autowired
	FormEditedTextVarService formEditedTextVarService;

	@Autowired
	FormSelectionVarService formSelectionVarService;

	@Autowired
	InstanceFormService instanceFormService;

	@Autowired
	PersonService personService;

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
	public String create(@Valid Form form, BindingResult bindingResult, Model uiModel,
			HttpServletRequest httpServletRequest) {
		if (bindingResult.hasErrors()) {
			populateEditForm(uiModel, form);
			return "forms/create";
		}
		uiModel.asMap().clear();
		formService.saveForm(form);
		return "redirect:/forms/" + encodeUrlPathSegment(form.getId().toString(), httpServletRequest);
	}

	@RequestMapping(params = "form", produces = "text/html")
	public String createForm(Model uiModel) {
		populateEditForm(uiModel, new Form());
		return "forms/create";
	}

	@RequestMapping(value = "/{id}", produces = "text/html")
	public String show(@PathVariable("id") Long id, Model uiModel) {
		addDateTimeFormatPatterns(uiModel);
		uiModel.addAttribute("form", formService.findForm(id));
		uiModel.addAttribute("itemId", id);
		return "forms/show";
	}

	@RequestMapping(produces = "text/html")
	public String list(@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "size", required = false) Integer size, Model uiModel) {
		if (page != null || size != null) {
			int sizeNo = size == null ? 10 : size.intValue();
			final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
			uiModel.addAttribute("forms", formService.findFormEntries(firstResult, sizeNo));
			float nrOfPages = (float) formService.countAllForms() / sizeNo;
			uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1
					: nrOfPages));
		} else {
			uiModel.addAttribute("forms", formService.findAllForms());
		}
		addDateTimeFormatPatterns(uiModel);
		return "forms/list";
	}

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
	public String update(@Valid Form form, BindingResult bindingResult, Model uiModel,
			HttpServletRequest httpServletRequest) {
		if (bindingResult.hasErrors()) {
			populateEditForm(uiModel, form);
			return "forms/update";
		}
		uiModel.asMap().clear();
		formService.updateForm(form);
		return "redirect:/forms/" + encodeUrlPathSegment(form.getId().toString(), httpServletRequest);
	}

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
	public String updateForm(@PathVariable("id") Long id, Model uiModel) {
		populateEditForm(uiModel, formService.findForm(id));
		return "forms/update";
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
	public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "size", required = false) Integer size, Model uiModel) {
		Form form = formService.findForm(id);
		formService.deleteForm(form);
		uiModel.asMap().clear();
		uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
		uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
		return "redirect:/forms";
	}

	void addDateTimeFormatPatterns(Model uiModel) {
		uiModel.addAttribute("form_formfilledat_date_format",
				DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
	}

	void populateEditForm(Model uiModel, Form form) {
		uiModel.addAttribute("form", form);
		addDateTimeFormatPatterns(uiModel);
		uiModel.addAttribute("formeditednumbervars", formEditedNumberVarService.findAllFormEditedNumberVars());
		uiModel.addAttribute("formeditedtextvars", formEditedTextVarService.findAllFormEditedTextVars());
		uiModel.addAttribute("formselectionvars", formSelectionVarService.findAllFormSelectionVars());
		uiModel.addAttribute("instanceforms", instanceFormService.findAllInstanceForms());
		uiModel.addAttribute("people", personService.findAllPeople());
	}

	String encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
		String enc = httpServletRequest.getCharacterEncoding();
		if (enc == null) {
			enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
		}
		try {
			pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
		} catch (UnsupportedEncodingException uee) {
		}
		return pathSegment;
	}
}

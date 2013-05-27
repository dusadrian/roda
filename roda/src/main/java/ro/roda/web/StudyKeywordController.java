package ro.roda.web;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.core.convert.ConversionService;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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

import ro.roda.domain.StudyKeyword;
import ro.roda.domain.StudyKeywordPK;
import ro.roda.service.KeywordService;
import ro.roda.service.StudyKeywordService;
import ro.roda.service.StudyService;
import ro.roda.service.UsersService;

@RequestMapping("/studykeywords")
@Controller
public class StudyKeywordController {

	private ConversionService conversionService;

	@Autowired
	StudyKeywordService studyKeywordService;

	@Autowired
	KeywordService keywordService;

	@Autowired
	StudyService studyService;

	@Autowired
	UsersService usersService;

	@Autowired
	public StudyKeywordController(ConversionService conversionService) {
		super();
		this.conversionService = conversionService;
	}

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
	public String create(@Valid StudyKeyword studyKeyword, BindingResult bindingResult, Model uiModel,
			HttpServletRequest httpServletRequest) {
		if (bindingResult.hasErrors()) {
			populateEditForm(uiModel, studyKeyword);
			return "studykeywords/create";
		}
		uiModel.asMap().clear();
		studyKeywordService.saveStudyKeyword(studyKeyword);
		return "redirect:/studykeywords/"
				+ encodeUrlPathSegment(conversionService.convert(studyKeyword.getId(), String.class),
						httpServletRequest);
	}

	@RequestMapping(params = "form", produces = "text/html")
	public String createForm(Model uiModel) {
		populateEditForm(uiModel, new StudyKeyword());
		return "studykeywords/create";
	}

	@RequestMapping(value = "/{id}", produces = "text/html")
	public String show(@PathVariable("id") StudyKeywordPK id, Model uiModel) {
		addDateTimeFormatPatterns(uiModel);
		uiModel.addAttribute("studykeyword", studyKeywordService.findStudyKeyword(id));
		uiModel.addAttribute("itemId", conversionService.convert(id, String.class));
		return "studykeywords/show";
	}

	@RequestMapping(produces = "text/html")
	public String list(@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "size", required = false) Integer size, Model uiModel) {
		if (page != null || size != null) {
			int sizeNo = size == null ? 10 : size.intValue();
			final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
			uiModel.addAttribute("studykeywords", studyKeywordService.findStudyKeywordEntries(firstResult, sizeNo));
			float nrOfPages = (float) studyKeywordService.countAllStudyKeywords() / sizeNo;
			uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1
					: nrOfPages));
		} else {
			uiModel.addAttribute("studykeywords", studyKeywordService.findAllStudyKeywords());
		}
		addDateTimeFormatPatterns(uiModel);
		return "studykeywords/list";
	}

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
	public String update(@Valid StudyKeyword studyKeyword, BindingResult bindingResult, Model uiModel,
			HttpServletRequest httpServletRequest) {
		if (bindingResult.hasErrors()) {
			populateEditForm(uiModel, studyKeyword);
			return "studykeywords/update";
		}
		uiModel.asMap().clear();
		studyKeywordService.updateStudyKeyword(studyKeyword);
		return "redirect:/studykeywords/"
				+ encodeUrlPathSegment(conversionService.convert(studyKeyword.getId(), String.class),
						httpServletRequest);
	}

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
	public String updateForm(@PathVariable("id") StudyKeywordPK id, Model uiModel) {
		populateEditForm(uiModel, studyKeywordService.findStudyKeyword(id));
		return "studykeywords/update";
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
	public String delete(@PathVariable("id") StudyKeywordPK id,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "size", required = false) Integer size, Model uiModel) {
		StudyKeyword studyKeyword = studyKeywordService.findStudyKeyword(id);
		studyKeywordService.deleteStudyKeyword(studyKeyword);
		uiModel.asMap().clear();
		uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
		uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
		return "redirect:/studykeywords";
	}

	void addDateTimeFormatPatterns(Model uiModel) {
		uiModel.addAttribute("studyKeyword_added_date_format",
				DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
	}

	void populateEditForm(Model uiModel, StudyKeyword studyKeyword) {
		uiModel.addAttribute("studyKeyword", studyKeyword);
		addDateTimeFormatPatterns(uiModel);
		uiModel.addAttribute("keywords", keywordService.findAllKeywords());
		uiModel.addAttribute("studys", studyService.findAllStudys());
		uiModel.addAttribute("userses", usersService.findAllUserses());
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

	@RequestMapping(value = "/{id}", headers = "Accept=application/json")
	@ResponseBody
	public ResponseEntity<String> showJson(@PathVariable("id") StudyKeywordPK id) {
		StudyKeyword studyKeyword = studyKeywordService.findStudyKeyword(id);
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json; charset=utf-8");
		if (studyKeyword == null) {
			return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>(studyKeyword.toJson(), headers, HttpStatus.OK);
	}

	@RequestMapping(headers = "Accept=application/json")
	@ResponseBody
	public ResponseEntity<String> listJson() {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json; charset=utf-8");
		List<StudyKeyword> result = studyKeywordService.findAllStudyKeywords();
		return new ResponseEntity<String>(StudyKeyword.toJsonArray(result), headers, HttpStatus.OK);
	}

	@RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
	public ResponseEntity<String> createFromJson(@RequestBody String json) {
		StudyKeyword studyKeyword = StudyKeyword.fromJsonToStudyKeyword(json);
		studyKeywordService.saveStudyKeyword(studyKeyword);
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		return new ResponseEntity<String>(headers, HttpStatus.CREATED);
	}

	@RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
	public ResponseEntity<String> createFromJsonArray(@RequestBody String json) {
		for (StudyKeyword studyKeyword : StudyKeyword.fromJsonArrayToStudyKeywords(json)) {
			studyKeywordService.saveStudyKeyword(studyKeyword);
		}
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		return new ResponseEntity<String>(headers, HttpStatus.CREATED);
	}

	@RequestMapping(method = RequestMethod.PUT, headers = "Accept=application/json")
	public ResponseEntity<String> updateFromJson(@RequestBody String json) {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		StudyKeyword studyKeyword = StudyKeyword.fromJsonToStudyKeyword(json);
		if (studyKeywordService.updateStudyKeyword(studyKeyword) == null) {
			return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>(headers, HttpStatus.OK);
	}

	@RequestMapping(value = "/jsonArray", method = RequestMethod.PUT, headers = "Accept=application/json")
	public ResponseEntity<String> updateFromJsonArray(@RequestBody String json) {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		for (StudyKeyword studyKeyword : StudyKeyword.fromJsonArrayToStudyKeywords(json)) {
			if (studyKeywordService.updateStudyKeyword(studyKeyword) == null) {
				return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
			}
		}
		return new ResponseEntity<String>(headers, HttpStatus.OK);
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
	public ResponseEntity<String> deleteFromJson(@PathVariable("id") StudyKeywordPK id) {
		StudyKeyword studyKeyword = studyKeywordService.findStudyKeyword(id);
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		if (studyKeyword == null) {
			return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
		}
		studyKeywordService.deleteStudyKeyword(studyKeyword);
		return new ResponseEntity<String>(headers, HttpStatus.OK);
	}
}

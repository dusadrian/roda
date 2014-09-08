package ro.roda.webjson.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ro.roda.domainjson.QuestionInfo;
import ro.roda.service.QuestionInfoService;

@RequestMapping("/admin/questioninfo")
@Controller
public class QuestionInfoController {

	@Autowired
	QuestionInfoService questionInfoService;

	@RequestMapping(headers = "Accept=application/json")
	@ResponseBody
	public ResponseEntity<String> listJson() {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json; charset=utf-8");
		List<QuestionInfo> result = questionInfoService.findAllQuestionInfos();
		return new ResponseEntity<String>(QuestionInfo.toJsonArr(result), headers, HttpStatus.OK);
	}

	@RequestMapping(value = "/{id}", headers = "Accept=application/json")
	@ResponseBody
	public ResponseEntity<String> showJson(@PathVariable("id") Long id) {
		QuestionInfo questionInfo = questionInfoService.findQuestionInfo(id);
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json; charset=utf-8");
		if (questionInfo == null) {
			return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>(questionInfo.toJson(), headers, HttpStatus.OK);
	}

}

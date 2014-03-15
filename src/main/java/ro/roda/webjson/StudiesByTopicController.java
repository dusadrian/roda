package ro.roda.webjson;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ro.roda.service.StudiesByTopicService;
import ro.roda.transformer.StudiesByTopic;

@RequestMapping("/studiesbytopic")
@Controller
public class StudiesByTopicController {

	@Autowired
	StudiesByTopicService studiesByTopicService;

	@RequestMapping(headers = "Accept=application/json")
	@ResponseBody
	public ResponseEntity<String> listJson() {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json; charset=utf-8");
		List<StudiesByTopic> result = studiesByTopicService.findAllStudiesByTopic();
		return new ResponseEntity<String>(StudiesByTopic.toJsonArray(result), headers, HttpStatus.OK);
	}

	@RequestMapping(value = "/{id}", headers = "Accept=application/json")
	@ResponseBody
	public ResponseEntity<String> showJson(@PathVariable("id") Integer id) {
		StudiesByTopic studiesByTopic = studiesByTopicService.findStudiesByTopic(id);
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json; charset=utf-8");
		if (studiesByTopic == null) {
			return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>(studiesByTopic.toJson(), headers, HttpStatus.OK);
	}

}
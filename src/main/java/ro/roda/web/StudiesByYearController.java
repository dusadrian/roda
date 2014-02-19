package ro.roda.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ro.roda.service.StudiesByYearService;
import ro.roda.transformer.StudiesByYear;

@RequestMapping("/studiesbyyear")
@Controller
public class StudiesByYearController {

	@Autowired
	StudiesByYearService studiesByYearService;

	// @Autowired
	// CatalogStudyService catalogStudyService;

	// @Autowired
	// SeriesService seriesService;

	// @Autowired
	// UsersService usersService;

	@RequestMapping(headers = "Accept=application/json")
	@ResponseBody
	public ResponseEntity<String> listJson() {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json; charset=utf-8");
		List<StudiesByYear> result = studiesByYearService.findAllStudiesByYear();
		return new ResponseEntity<String>(StudiesByYear.toJsonArray(result), headers, HttpStatus.OK);
	}

	@RequestMapping(value = "/{id}", headers = "Accept=application/json")
	@ResponseBody
	public ResponseEntity<String> showJson(@PathVariable("id") Integer id) {
		StudiesByYear catalogByYear = studiesByYearService.findStudiesByYear(id);
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json; charset=utf-8");
		if (catalogByYear == null) {
			return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>(catalogByYear.toJson(), headers, HttpStatus.OK);
	}

}
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

import ro.roda.domainjson.StudiesTree;
import ro.roda.service.StudiesTreeService;

@RequestMapping("/studiestree")
@Controller
public class StudiesTreeController {

	@Autowired
	StudiesTreeService studiesTreeService;

	@RequestMapping(headers = "Accept=application/json")
	@ResponseBody
	public ResponseEntity<String> listJson() {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json; charset=utf-8");
		List<StudiesTree> result = studiesTreeService.findAllStudiesTrees();
		return new ResponseEntity<String>(StudiesTree.toJsonArr(result), headers, HttpStatus.OK);
	}

	@RequestMapping(value = "/{id}", headers = "Accept=application/json")
	@ResponseBody
	public ResponseEntity<String> showJson(@PathVariable("id") Integer id) {
		StudiesTree studiesTree = studiesTreeService.findStudiesTree(id);
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json; charset=utf-8");
		if (studiesTree == null) {
			return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>(studiesTree.toJson(), headers, HttpStatus.OK);
	}

}

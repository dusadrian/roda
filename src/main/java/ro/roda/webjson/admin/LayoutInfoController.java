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

import ro.roda.domainjson.LayoutInfo;
import ro.roda.service.LayoutInfoService;

@RequestMapping("/adminjson/cmslayoutinfo")
@Controller
public class LayoutInfoController {

	@Autowired
	LayoutInfoService layoutInfoService;

	@RequestMapping(headers = "Accept=application/json")
	@ResponseBody
	public ResponseEntity<String> listJson() {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json; charset=utf-8");
		List<LayoutInfo> result = layoutInfoService.findAllLayoutInfos();
		return new ResponseEntity<String>(LayoutInfo.toJsonArr(result), headers, HttpStatus.OK);
	}

	@RequestMapping(value = "/{id}", headers = "Accept=application/json")
	@ResponseBody
	public ResponseEntity<String> showJson(@PathVariable("id") Integer id) {
		LayoutInfo layoutInfo = layoutInfoService.findLayoutInfo(id);
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json; charset=utf-8");
		if (layoutInfo == null) {
			return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>(layoutInfo.toJson(), headers, HttpStatus.OK);
	}

}

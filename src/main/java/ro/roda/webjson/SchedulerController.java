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

import ro.roda.scheduler.Execution;
import ro.roda.scheduler.Task;
import ro.roda.service.SchedulerService;

@RequestMapping("/scheduler")
@Controller
public class SchedulerController {

	@Autowired
	SchedulerService schedulerService;

	@RequestMapping(value = "/tasks", headers = "Accept=application/json")
	@ResponseBody
	public ResponseEntity<String> listTasks() {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json; charset=utf-8");
		List<Task> result = schedulerService.findTasksAll();
		return new ResponseEntity<String>(Task.toJsonArray(result), headers, HttpStatus.OK);
	}

	@RequestMapping(value = "/tasks/{id}", headers = "Accept=application/json")
	@ResponseBody
	public ResponseEntity<String> showTask(@PathVariable("id") Integer id) {
		Task s = schedulerService.findTask(id);
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json; charset=utf-8");
		if (s == null) {
			return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>(s.toJson(), headers, HttpStatus.OK);
	}

	@RequestMapping(value = "/executions", headers = "Accept=application/json")
	@ResponseBody
	public ResponseEntity<String> listExecutions() {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json; charset=utf-8");
		List<Execution> result = schedulerService.findExecutionsAll();
		return new ResponseEntity<String>(Execution.toJsonArray(result), headers, HttpStatus.OK);
	}

	@RequestMapping(value = "/executions/{id}", headers = "Accept=application/json")
	@ResponseBody
	public ResponseEntity<String> showExecution(@PathVariable("id") Integer id) {
		Execution e = schedulerService.findExecution(id);
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json; charset=utf-8");
		if (e == null) {
			return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>(e.toJson(), headers, HttpStatus.OK);
	}
}

package com.firatyazilim.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.firatyazilim.businies.abstracts.ScholarshipAppService;
import com.firatyazilim.core.utilities.result.DataResult;
import com.firatyazilim.entities.concretes.ScholarshipApp;
@RestController
@RequestMapping("api/scholarshipApp/")
public class ScholarshipAppController {
	@Autowired
	private ScholarshipAppService service;
	public ScholarshipAppController(ScholarshipAppService service) {
		this.service=service;
	}
	@GetMapping("/getAll")
	public DataResult<List<ScholarshipApp>> getAll(){
		return this.service.getAll();
	}
}

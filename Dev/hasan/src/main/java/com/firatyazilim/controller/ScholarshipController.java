package com.firatyazilim.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


import com.firatyazilim.businies.abstracts.ScholarsipService;
import com.firatyazilim.core.utilities.result.DataResult;
import com.firatyazilim.entities.concretes.Schoolarship;
@RestController
@RequestMapping("api/scholarship/")
public class ScholarshipController {
	@Autowired
	private ScholarsipService service;
	public ScholarshipController(ScholarsipService service) {
		this.service=service;
	}
	@GetMapping("/getAll")
	public DataResult<List<Schoolarship>> getAll(){
		return this.service.getAll();
	}
	
}

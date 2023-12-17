package com.firatyazilim.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.firatyazilim.businies.abstracts.ApplicationService;
import com.firatyazilim.core.utilities.result.DataResult;
import com.firatyazilim.entities.concretes.Application;


@RestController
@RequestMapping("api/application")
public class ApplicationController {
	@Autowired
	private ApplicationService service;
	
	 public ApplicationController(ApplicationService service) {
		this.service=service;
	}
	
	@GetMapping("/getall")
	public DataResult<List<Application>> getAll(){
		return this.service.getAll();
	}
}

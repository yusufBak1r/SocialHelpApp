package com.firatyazilim.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.firatyazilim.businies.abstracts.TranscriptService;
import com.firatyazilim.core.utilities.result.DataResult;
import com.firatyazilim.entities.concretes.Transcript;

@RestController
@RequestMapping("api/Transcript/")
public class TranscriptController {
@Autowired
private TranscriptService service;
public TranscriptController(TranscriptService service) {
	this.service=service;
}
@GetMapping("/getAll")
public DataResult<List<Transcript>> getAll() {
return this.service.getAll();
}
}
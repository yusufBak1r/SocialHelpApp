package com.firatyazilim.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.firatyazilim.businies.abstracts.PersonService;
import com.firatyazilim.core.utilities.result.DataResult;
import com.firatyazilim.entities.concretes.Person;
import com.firatyazilim.entities.concretes.Schoolarship;
@CrossOrigin
@RestController
@RequestMapping("api/person/")
public class PersonController {
@Autowired
private PersonService service;

	public PersonController(PersonService service) {
	this.service=service;
}
	@GetMapping("/getAll")
	public DataResult<List<Person>> getAll() {
		return this.service.getAll();
	}
	
	@GetMapping("/login")
	public DataResult<Person> login(@RequestParam String email,@RequestParam String password){
		return this.service.login(email, password);
	}
	// @PostMapping("/signUp")
	@RequestMapping(value = "/signUp",method = RequestMethod.POST)
	public DataResult<Person> signUp(@RequestBody Person person) {
		return this.service.signUp(person);
	}
	@PostMapping("/addScholarsip")
	public DataResult<Schoolarship> addScholarship(@RequestBody Schoolarship scholarship){
		return this.service.addScholarship(scholarship);
	}


}

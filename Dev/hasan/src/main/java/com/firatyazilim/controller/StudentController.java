package com.firatyazilim.controller;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


import com.firatyazilim.businies.abstracts.ScholarsipService;
import com.firatyazilim.businies.abstracts.StudentService;
import com.firatyazilim.core.utilities.result.DataResult;

import com.firatyazilim.entities.concretes.Application;

import com.firatyazilim.entities.concretes.Student;
import com.firatyazilim.entities.concretes.Transcript;

@RestController
@RequestMapping("api/student")
public class StudentController {
@Autowired
private StudentService service;
private ScholarsipService scholarshipAppService;
public StudentController(StudentService service,ScholarsipService scholarshipAppService) {
this.service=service;
this.scholarshipAppService=scholarshipAppService;
}

@GetMapping("/getall")
public DataResult<List<Student>> getAll(){
	return this.service.getAll();
}
@GetMapping("/login")
public DataResult<Student> login(@RequestParam String email,@RequestParam String password){
	return this.service.login(email, password);
}
@PostMapping("/signUp")
public DataResult<Student> signUp(@RequestBody Student student) {
	return this.service.signUp(student);
}
@PostMapping("/addTranscript")
public DataResult<Transcript> addTranscript(@RequestParam int studentId,@RequestParam String term,@RequestParam byte[] pdf) {
return this.service.addTranscript(studentId,term,pdf);
}
@PostMapping("/createApplication")
public DataResult<Application> createApplication(@RequestParam int studentId,
		@RequestParam int scholarshipId){
	return this.service.createApplication(studentId, scholarshipId);
}
//buna tekrar bak -geçiçi çözüldü

@GetMapping("/{id}")
public DataResult<Student> getStudentById(@PathVariable  int id){
	return this.service.findById(id);
}
@PutMapping("update/{id}")
public DataResult<Student> updateStudent(@RequestBody Student student){
	return this.service.updateUser(student);
}
@PutMapping("updatePassword/{id}")
public DataResult<Student> updatePassword(@RequestParam String password,@RequestParam int id){
	return this.service.updatePassword(password, id);
}

}

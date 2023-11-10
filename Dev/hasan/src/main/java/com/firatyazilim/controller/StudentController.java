package com.firatyazilim.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.firatyazilim.businies.abstracts.ScholarshipAppService;
import com.firatyazilim.businies.abstracts.ScholarsipService;
import com.firatyazilim.businies.abstracts.StudentService;
import com.firatyazilim.core.utilities.result.DataResult;
import com.firatyazilim.core.utilities.result.Result;
import com.firatyazilim.entities.concretes.Application;
import com.firatyazilim.entities.concretes.Schoolarship;
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
public DataResult<List<Transcript>> addTranscript(@RequestBody Transcript transcript) {
return this.service.addTranscript(transcript);
}
@PostMapping("/createApplication")
public DataResult<Application> createApplication(@RequestParam int studentId , 
		@RequestParam int scholarshipId) {
	Student student = service.findById(studentId);
    Schoolarship scholarship = scholarshipAppService.findById(scholarshipId);
    
	return this.service.createApplication(student, scholarship);

}


}

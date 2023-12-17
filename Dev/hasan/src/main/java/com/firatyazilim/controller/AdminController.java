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

import com.firatyazilim.businies.abstracts.AdminService;
import com.firatyazilim.core.utilities.result.DataResult;
import com.firatyazilim.entities.concretes.Admin;
import com.firatyazilim.entities.concretes.Student;


@RestController
@RequestMapping("api/admin")
public class AdminController {
@Autowired
private AdminService service
;
public AdminController(AdminService service) {
	this.service=service;
}
@GetMapping("/getAll")
public DataResult<List<Admin>> getAll() {
	return this.service.getAll();
}

@GetMapping("/login")
public DataResult<Admin> login(@RequestParam String email,@RequestParam String password){
	return this.service.login(email, password);
}
@PostMapping("/signUp")
public DataResult<Admin> signUp(@RequestBody Admin admin) {
	return this.service.signUp(admin);
}
@GetMapping("/{id}")
public DataResult<Admin> getAdminById(@PathVariable  int id){
	return this.service.findById(id);
}
@PutMapping("update/{id}")
public DataResult<Admin> updateAdmin(@RequestBody Admin admin){
	return this.service.updateUser(admin);
}
@PutMapping("updatePassword/{id}")
public DataResult<Admin> updatePassword(@RequestParam String password,@RequestParam int id){
	return this.service.updatePassword(password, id);
}
}

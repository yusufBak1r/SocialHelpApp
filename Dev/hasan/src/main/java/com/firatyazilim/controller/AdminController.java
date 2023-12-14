package com.firatyazilim.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.firatyazilim.businies.abstracts.AdminService;
import com.firatyazilim.core.utilities.result.DataResult;
import com.firatyazilim.entities.concretes.Admin;


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
}

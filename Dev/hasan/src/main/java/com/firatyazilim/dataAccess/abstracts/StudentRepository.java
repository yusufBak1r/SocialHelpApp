package com.firatyazilim.dataAccess.abstracts;

import org.springframework.data.jpa.repository.JpaRepository;

import com.firatyazilim.core.utilities.result.Result;
import com.firatyazilim.entities.concretes.Student;

public interface StudentRepository extends JpaRepository<Student, Integer> {
	Student findByEmail(String email);
	Student getById(int id);
	
	
	
}

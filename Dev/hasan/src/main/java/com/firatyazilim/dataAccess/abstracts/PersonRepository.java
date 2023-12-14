package com.firatyazilim.dataAccess.abstracts;

import org.springframework.data.jpa.repository.JpaRepository;

import com.firatyazilim.core.utilities.result.Result;
import com.firatyazilim.entities.concretes.Person;

public interface PersonRepository extends JpaRepository<Person, Integer>{
	Person findByEmail(String email);
	
}

package com.firatyazilim.dataAccess.abstracts;

import org.springframework.data.jpa.repository.JpaRepository;

import com.firatyazilim.businies.abstracts.UserService;
import com.firatyazilim.core.utilities.result.DataResult;
import com.firatyazilim.core.utilities.result.SuccessDataResult;
import com.firatyazilim.entities.concretes.Person;
import com.firatyazilim.entities.concretes.Schoolarship;

public interface SchoolarshipRepository extends JpaRepository<Schoolarship, Integer>{

}


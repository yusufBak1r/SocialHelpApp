package com.firatyazilim.dataAccess.abstracts;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.firatyazilim.businies.abstracts.UserService;
import com.firatyazilim.core.utilities.result.DataResult;
import com.firatyazilim.core.utilities.result.SuccessDataResult;
import com.firatyazilim.entities.concretes.Application;
import com.firatyazilim.entities.concretes.Person;
import com.firatyazilim.entities.concretes.Schoolarship;
import com.firatyazilim.entities.concretes.Student;

public interface SchoolarshipRepository extends JpaRepository<Schoolarship, Integer>{
Schoolarship getById(int id);
List<Schoolarship> findByPerson_Id(int personId);

}


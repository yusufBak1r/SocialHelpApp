package com.firatyazilim.businies.abstracts;

import java.time.LocalDate;
import java.util.List;

import com.firatyazilim.core.utilities.result.DataResult;
import com.firatyazilim.entities.concretes.Application;
import com.firatyazilim.entities.concretes.Person;
import com.firatyazilim.entities.concretes.Schoolarship;


public interface PersonService extends UserService<Person>{
    DataResult<Schoolarship> addScholarship(int personId,String description,String name,int amount,
    		LocalDate applicationDate);
    DataResult<Person> findById(int personId);
    DataResult<List<Schoolarship>> getAllReferancesById(int personId); 
    DataResult<List<Application>> getAllScholarsipsById(int scholarsipsId);
}

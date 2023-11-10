package com.firatyazilim.businies.abstracts;

import com.firatyazilim.core.utilities.result.DataResult;
import com.firatyazilim.entities.concretes.Person;
import com.firatyazilim.entities.concretes.Schoolarship;

public interface PersonService extends UserService<Person>{
    DataResult<Schoolarship> addScholarship(Schoolarship scholarship);
}

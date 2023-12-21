package com.firatyazilim.businies.abstracts;

import java.util.List;

import com.firatyazilim.core.utilities.result.DataResult;
import com.firatyazilim.entities.concretes.Schoolarship;

public interface ScholarsipService {
    DataResult<Schoolarship> addScholarship(Schoolarship scholarship);
    DataResult<List<Schoolarship>> getAll();
    Schoolarship findById(int scholarshipId);
    List<Schoolarship> SchoolarshipsByPersonId(int personId);}
    

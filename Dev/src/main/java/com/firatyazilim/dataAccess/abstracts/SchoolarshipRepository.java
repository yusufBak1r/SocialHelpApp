package com.firatyazilim.dataAccess.abstracts;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;


import com.firatyazilim.entities.concretes.Schoolarship;


public interface SchoolarshipRepository extends JpaRepository<Schoolarship, Integer>{
Schoolarship getById(int id);
List<Schoolarship> findByPerson_Id(int personId);

}


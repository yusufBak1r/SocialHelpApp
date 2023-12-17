package com.firatyazilim.dataAccess.abstracts;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.firatyazilim.entities.concretes.Application;

public interface ApplicationRepository extends JpaRepository<Application, Integer> {
List<Application> findBySchoolarship_Id(int scholarshipId);
List<Application> findByStudent_Id(int studentId);
Application getById(int id);

}

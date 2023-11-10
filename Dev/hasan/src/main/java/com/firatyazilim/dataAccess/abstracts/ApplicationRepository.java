package com.firatyazilim.dataAccess.abstracts;

import org.springframework.data.jpa.repository.JpaRepository;

import com.firatyazilim.entities.concretes.Application;

public interface ApplicationRepository extends JpaRepository<Application, Integer> {

}

package com.firatyazilim.dataAccess.abstracts;

import org.springframework.data.jpa.repository.JpaRepository;

import com.firatyazilim.entities.concretes.Transcript;

public interface TranscriptRepository extends JpaRepository<Transcript, Integer> {
Transcript getById(int id);
}

package com.firatyazilim.entities.concretes;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;

import javax.persistence.OneToMany;

import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.firatyazilim.entities.abstracts.User;

import lombok.AllArgsConstructor;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@EqualsAndHashCode(callSuper = true ) 
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "students")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler", "applications", "transcripts"})

public class Student extends User{
	 
	 @Column(name = "name")	
	  private String name;
	  
	  @Column(name = "surname")	
	  private String surname;
	  
	  @Column(name = "isScholarship")	
	  private boolean isScholarship;
	  @OneToMany(mappedBy = "student")
	  private List<Transcript> transcripts;
	  @OneToMany(mappedBy = "student")
	  private List<Application> applications;
}

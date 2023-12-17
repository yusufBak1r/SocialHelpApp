package com.firatyazilim.entities.concretes;

import java.time.LocalDate;
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
@Table(name = "persons")
@JsonIgnoreProperties({"hibernateLazyInitializer","handler","schoolarships"}) 
public class Person extends User{
  
  @Column(name = "name")	
  private String name;
  
  @Column(name = "surname")	
  private String surname;
  
  @Column(name="birth_of_date_year")
  private int birthOfDateYear;
  
  @Column(name="identity_number")
  private String identityNumber;
  
  @Column(name = "job")	
  private String job;
  
  @OneToMany(mappedBy = "person")
  private List<Schoolarship> schoolarships;
 
}

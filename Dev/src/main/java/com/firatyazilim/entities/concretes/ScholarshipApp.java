package com.firatyazilim.entities.concretes;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "scholarship_apps")
public class ScholarshipApp {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
	
	 @ManyToOne
	 @JoinColumn(name = "person_id")
	 private Person person;
	 
	 @ManyToOne
	 @JoinColumn(name = "scolarsip_id")
	 private Schoolarship schoolarship;
}

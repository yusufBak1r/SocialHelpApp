package com.firatyazilim.entities.concretes;

import javax.persistence.Column;
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
@Table(name = "applications")
public class Application {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
	  
	 @ManyToOne
	 @JoinColumn(name = "student_id")
	 private Student student;
	 
	 @ManyToOne
	 @JoinColumn(name = "scholarship_id")
	 private Schoolarship schoolarship;
	  
	 @Column(name = "is_aproved")
	 private boolean isAproved=false; 
	 
	 
}

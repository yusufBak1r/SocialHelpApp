package com.firatyazilim.entities.concretes;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "schoolarships")
@JsonIgnoreProperties({"hibernateLazyInitializer","handler","applications"}) 
public class Schoolarship {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "description")
	private String description;
	
	@Column(name = "amount")
	private long amount;
	
	@Column(name="isFull")
	private boolean isFull;
	 
	@Column(name = "applicaionDate")
	private LocalDate applicaionDate;
	@OneToMany(mappedBy = "schoolarship")
	private List<Application> applications;
	
	@ManyToOne
	@JoinColumn(name = "person_id")
	private Person person; 
	
	@ManyToOne
	@JoinColumn(name = "student_id")
	private Student student;
}

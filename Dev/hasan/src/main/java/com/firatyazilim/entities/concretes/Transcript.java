package com.firatyazilim.entities.concretes;

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
@Table(name = "transcripts")

public class Transcript {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
	 @ManyToOne
	 @JoinColumn(name = "student_id")
	 private Student student;
	 
	 @Column(name="term")
	 private String term;
	 
	 @Column(name="transcript_pdf")
	 //private String transcriptPdf;
	 private byte[] transcriptPdf;
	 
}  

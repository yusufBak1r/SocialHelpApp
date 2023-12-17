package com.firatyazilim.businies.concretes;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.firatyazilim.businies.abstracts.StudentService;
import com.firatyazilim.businies.abstracts.TranscriptService;
import com.firatyazilim.core.utilities.result.DataResult;
import com.firatyazilim.core.utilities.result.ErrorDataResult;
import com.firatyazilim.core.utilities.result.Result;
import com.firatyazilim.core.utilities.result.SuccessDataResult;
import com.firatyazilim.core.utilities.result.SuccessResult;
import com.firatyazilim.dataAccess.abstracts.StudentRepository;
import com.firatyazilim.dataAccess.abstracts.TranscriptRepository;
import com.firatyazilim.entities.concretes.Student;
import com.firatyazilim.entities.concretes.Transcript;

@Service

public class TranscriptManager implements TranscriptService {
@Autowired
private TranscriptRepository repository;
@Autowired private StudentRepository studentRepository;
public TranscriptManager(TranscriptRepository repository,StudentRepository studentRepository) {
this.repository=repository;
this.studentRepository=studentRepository;
}
@Override
public DataResult<Transcript> addTranscript(Transcript transcript) {
	
	if(transcript.getStudent()!=null && transcript.getTerm()!=null && transcript.getTranscriptPdf()!=null) {
		
		return new SuccessDataResult<Transcript>
		(this.repository.save(transcript),"Transkript başarı ile  eklendi");

	}
	else {
		return new ErrorDataResult<Transcript>("Tüm alanlar doldurulmak zorundadır");

	
	
}}
@Override
public DataResult<List<Transcript>> getAll() {
	return new SuccessDataResult<List<Transcript>>(this.repository.findAll(),"Transkriptler getirildi");
	
}
@Override
public Result deleteById(int transId) {
	this.repository.deleteById(transId);
	return new SuccessResult("Transcript silindi");
}
}

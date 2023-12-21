package com.firatyazilim.businies.abstracts;

import java.util.List;

import com.firatyazilim.core.utilities.result.DataResult;
import com.firatyazilim.core.utilities.result.Result;
import com.firatyazilim.entities.concretes.Application;
import com.firatyazilim.entities.concretes.Schoolarship;
import com.firatyazilim.entities.concretes.Student;
import com.firatyazilim.entities.concretes.Transcript;

public interface StudentService extends UserService<Student>{
	//ekleme listeleme getirme eklendi 
	//
	DataResult<Transcript> addTranscript(Transcript transcript);
	
	
	
	//DataResult<List<Transcript>> addTranscript(Transcript transcript);
	//Result applyScholarsip(int studentId,int scholarshipId);
	DataResult<Application> createApplication(int studentId, int scholarshipId);
	DataResult<Student> findById(int studentId);
	Result deleteById(int transId);

}

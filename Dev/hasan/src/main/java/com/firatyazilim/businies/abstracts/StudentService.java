package com.firatyazilim.businies.abstracts;

import java.util.List;

import com.firatyazilim.core.utilities.result.DataResult;
import com.firatyazilim.core.utilities.result.Result;
import com.firatyazilim.entities.concretes.Application;
import com.firatyazilim.entities.concretes.Schoolarship;
import com.firatyazilim.entities.concretes.Student;
import com.firatyazilim.entities.concretes.Transcript;

public interface StudentService extends UserService<Student>{
	DataResult<List<Transcript>> addTranscript(Transcript transcript);
	//Result applyScholarsip(int studentId,int scholarshipId);
	DataResult<Application> createApplication(Student student, Schoolarship scholarship);
	Student findById(int studentId);
}

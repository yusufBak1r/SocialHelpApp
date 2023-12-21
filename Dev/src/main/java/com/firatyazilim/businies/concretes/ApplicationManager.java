package com.firatyazilim.businies.concretes;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.firatyazilim.businies.abstracts.ApplicationService;
import com.firatyazilim.businies.abstracts.ScholarsipService;
import com.firatyazilim.businies.abstracts.StudentService;
import com.firatyazilim.core.utilities.result.DataResult;
import com.firatyazilim.core.utilities.result.ErrorDataResult;
import com.firatyazilim.core.utilities.result.SuccessDataResult;
import com.firatyazilim.dataAccess.abstracts.ApplicationRepository;
import com.firatyazilim.dataAccess.abstracts.SchoolarshipRepository;
import com.firatyazilim.dataAccess.abstracts.StudentRepository;
import com.firatyazilim.entities.concretes.Application;
import com.firatyazilim.entities.concretes.Schoolarship;
import com.firatyazilim.entities.concretes.Student;


@Service
public class ApplicationManager implements ApplicationService{
@Autowired
private ApplicationRepository repository;
@Autowired
private StudentRepository studentRepository;
@Autowired
private SchoolarshipRepository scholarsipRepository;


public ApplicationManager(ApplicationRepository repository,
		SchoolarshipRepository scholarsipService,
		StudentRepository studentService) {
	this.repository=repository;
	this.scholarsipRepository=scholarsipService;
	this.studentRepository=studentService;
}

@Override
public DataResult<Application> createApplication(int studentId, int scholarshipId) {
	
	Student student=this.studentRepository.getById(studentId);
	Schoolarship schoolarship=this.scholarsipRepository.getById(scholarshipId);
	for(Application apps:this.repository.findAll()) {
		if(apps.getStudent().equals(student) && apps.getSchoolarship().equals(schoolarship))
			return new ErrorDataResult<Application>("Önceden başvuru yapmışssınız.");
	}
	if(schoolarship!=null && student!=null) {
		Application application=new Application();
		application.setSchoolarship(schoolarship);
		application.setStudent(student);
		application.setAproved(false);
		
		return new SuccessDataResult<Application>(this.repository.save(application))	;
	}
	else {
		return new ErrorDataResult<Application>("Burs veya öğrenci boş olamaz");
	}
	
}

@Override
public DataResult<List<Application>> getByScholarsipId(int scholarshipId) {
	
	return new SuccessDataResult<List<Application>>(this.repository.findBySchoolarship_Id(scholarshipId));
}

@Override
public DataResult<List<Application>> getByStudentId(int studentId) {
	return new SuccessDataResult<List<Application>>(this.repository.findByStudent_Id(studentId));

}

@Override
public DataResult<List<Application>> getAll() {
	// TODO Auto-generated method stub
	return new SuccessDataResult<List<Application>>(this.repository.findAll(),"Tüm başvurular getirildi");
}



}

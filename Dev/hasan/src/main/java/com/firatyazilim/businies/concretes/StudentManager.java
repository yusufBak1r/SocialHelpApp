package com.firatyazilim.businies.concretes;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.firatyazilim.businies.abstracts.ApplicationService;
import com.firatyazilim.businies.abstracts.StudentService;
import com.firatyazilim.businies.abstracts.TranscriptService;
import com.firatyazilim.core.utilities.result.DataResult;
import com.firatyazilim.core.utilities.result.ErrorDataResult;
import com.firatyazilim.core.utilities.result.ErrorResult;
import com.firatyazilim.core.utilities.result.Result;
import com.firatyazilim.core.utilities.result.SuccessDataResult;
import com.firatyazilim.core.utilities.result.SuccessResult;
import com.firatyazilim.dataAccess.abstracts.ApplicationRepository;
import com.firatyazilim.dataAccess.abstracts.SchoolarshipRepository;
import com.firatyazilim.dataAccess.abstracts.StudentRepository;
import com.firatyazilim.dataAccess.abstracts.TranscriptRepository;
import com.firatyazilim.entities.concretes.Application;
import com.firatyazilim.entities.concretes.Schoolarship;
import com.firatyazilim.entities.concretes.Student;
import com.firatyazilim.entities.concretes.Transcript;

@Service

public class StudentManager implements StudentService {
	
@Autowired
private StudentRepository repository;
private TranscriptService transcriptService;
private ApplicationService applicationService;
private SchoolarshipRepository schoolarshipRepository;
public StudentManager(StudentRepository repository,
		TranscriptService transcriptService,
		ApplicationService applicationService,
		SchoolarshipRepository schoolarshipRepository
		) {
	this.repository=repository;
	this.transcriptService=transcriptService;
	this.applicationService=applicationService;
	this.schoolarshipRepository=schoolarshipRepository;
}
@Override
public DataResult<Student> login(String email, String password) {
	Student student=repository.findByEmail(email);
	if(student==null) {
		return new ErrorDataResult<Student>("Email bulunamadı");
	}
	else if (student.getPassword().equals(password)) {
		return new SuccessDataResult<Student>("Giriş başarılı");

	}
	else {
		return new ErrorDataResult<Student>("Şifre yanlış");
	}
}


@Override
public DataResult<List<Student>> getAll() {
	return new SuccessDataResult<List<Student>>(this.repository.findAll(),
			"Tüm öğrenciler getirildi");

}
@Override
public DataResult<Student> signUp(Student user) {
	if(user.getEmail()==null && user.getPassword()==null
			&& user.getPhone()==null && user.getName()==null
			&& user.getSurname()==null 
			) return new ErrorDataResult<Student>("Tüm alanlar doldurulması zorunludur");
	
	else if (user.getEmail().length()<5) 
		return new ErrorDataResult<Student>("Mailin 6 karakterden uzun olması lazım");
	
	
	
	else if (user.getPassword().length()<5) 
		return new ErrorDataResult<Student>("Şifrenin 6 karakterden uzun olması lazım");
	
	
	
	else if (user.getPhone().length()!=11) 
		return new ErrorDataResult<Student>("Telefon numarası tam girilmemis");
	
	else if (user.getName().length()<2) 
		return new ErrorDataResult<Student>("Bu kadar kısa isim olamaz");
	
	else if (user.getSurname().length()<2) 
		return new ErrorDataResult<Student>("Bu kadar kısa soyisim olamaz");
	else {
		for(Student student:repository.findAll()) {
			if (student.getEmail().equals(user.getEmail())) {
				return new ErrorDataResult<Student>("Email önce kullanılmış");
			}
			
			

			
		
		}return new SuccessDataResult<Student>(this.repository.save(user),"eklendi");}
}
@Override
public DataResult<List<Transcript>> addTranscript(Transcript transcript) {
	
	return this.transcriptService.addTranscript(transcript);
}
@Override
public DataResult<Application> createApplication(Student student, Schoolarship scholarship) {
	return this.applicationService.createApplication(student, scholarship);
}
@Override
public Student findById(int studentId) {
	return this.repository.findById(studentId).orElse(null);
	
}



}

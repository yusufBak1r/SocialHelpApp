package com.firatyazilim.businies.concretes;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.firatyazilim.businies.abstracts.ApplicationService;
import com.firatyazilim.businies.abstracts.StudentService;
import com.firatyazilim.businies.abstracts.TranscriptService;
import com.firatyazilim.businies.abstracts.CheckServices.StudentCheckService;
import com.firatyazilim.businies.concretes.CheckManager.StudentCheckManager;
import com.firatyazilim.core.utilities.result.DataResult;
import com.firatyazilim.core.utilities.result.ErrorDataResult;
import com.firatyazilim.core.utilities.result.ErrorResult;
import com.firatyazilim.core.utilities.result.Result;
import com.firatyazilim.core.utilities.result.SuccessDataResult;
import com.firatyazilim.core.utilities.result.SuccessResult;
import com.firatyazilim.dataAccess.abstracts.SchoolarshipRepository;
import com.firatyazilim.dataAccess.abstracts.StudentRepository;

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
			
			
			StudentCheckService checkService=new StudentCheckManager();
			if(checkService.checkIfRealPerson(user)) {
				return new SuccessDataResult<Student>(this.repository.save(user),"eklendi");
			}else {
				return new ErrorDataResult<Student>("Girilen kullanıcı doğrulanmadı."
						+ "Lütfen gerçek bir insan girin");

			}
			
		
		}return new SuccessDataResult<Student>(this.repository.save(user),"eklendi");}
}
//@Override
//public DataResult<List<Transcript>> addTranscript(Transcript transcript) {
	
//	return this.transcriptService.addTranscript(transcript);
//}
@Override
public DataResult<Application> createApplication(int studentId, int scholarshipId) {
	return this.applicationService.createApplication(studentId, scholarshipId);
}
@Override
public DataResult<Student> findById(int studentId) {
	Student student=this.repository.getById(studentId);
	return (student==null) ? new ErrorDataResult<Student>("bulunamadı") :
		new SuccessDataResult<Student>(this.repository.getById(studentId),"Öğrenci getirildi");
}
@Override
public DataResult<Student> updateUser(Student user) {
	Student student=this.repository.getById(user.getId());
	if(student==null) {
		return new ErrorDataResult<Student>("Öğrenci bulunamadı");
	}
	else {
		return new SuccessDataResult<Student>(this.repository.save(user),"Güncellendi");

	}
	
}
@Override
public DataResult<Student> updatePassword(String password, int id) {
	Student student=this.repository.getById(id);
	if(student==null) return new ErrorDataResult<Student>("bulunamadı");
	else {
		if(password.length()<6) 
		 return new ErrorDataResult<Student>("Şifre çok kısa");
			else {
				student.setPassword(password);
				return new SuccessDataResult<Student>(this.repository.save(student),"Şifre değiştirildi");
			}

		
	}
	
	
	
}
@Override
public DataResult<Transcript> addTranscript(int studentId,String term,byte[] pdf) {
	Transcript transcript=new Transcript();
	Student student=this.repository.getById(studentId);
	
	transcript.setStudent(student);
	transcript.setTerm(term);
	transcript.setTranscriptPdf(pdf);
	return this.transcriptService.addTranscript(transcript);
	
}





}

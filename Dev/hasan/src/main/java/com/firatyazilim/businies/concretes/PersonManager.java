package com.firatyazilim.businies.concretes;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.firatyazilim.businies.abstracts.PersonService;
import com.firatyazilim.businies.abstracts.ScholarsipService;
import com.firatyazilim.core.utilities.result.DataResult;
import com.firatyazilim.core.utilities.result.ErrorDataResult;
import com.firatyazilim.core.utilities.result.SuccessDataResult;
import com.firatyazilim.dataAccess.abstracts.PersonRepository;
import com.firatyazilim.dataAccess.abstracts.SchoolarshipRepository;
import com.firatyazilim.entities.concretes.Person;
import com.firatyazilim.entities.concretes.Schoolarship;


@Service
public class PersonManager implements PersonService{
@Autowired
private ScholarsipService sholarsipService;
@Autowired
private PersonRepository repository;
public PersonManager(PersonRepository personRepository,ScholarsipService scholarsipService) {
	
	this.repository=repository;
	this.sholarsipService=scholarsipService;
}
@Override
public DataResult<Person> login(String email, String password) {
	Person person=repository.findByEmail(email);
	if(person==null) {
		return new ErrorDataResult<Person>("Email bulunamadı");
	}
	else if (person.getPassword().equals(password)) {
		return new SuccessDataResult<Person>("Giriş başarılı");

	}
	else {
		return new ErrorDataResult<Person>("Şifre yanlış");
	}
}

@Override
public DataResult<List<Person>> getAll() {
	return new SuccessDataResult<List<Person>>(this.repository.findAll(),"Listelendi");
}
@Override
public DataResult<Person> signUp(Person user) {
	if(user.getEmail()==null && user.getPassword()==null
			&& user.getPhone()==null && user.getName()==null
			&& user.getSurname()==null && user.getJob()==null
			) return new ErrorDataResult<Person>("Tüm alanlar doldurulması zorunludur");
	
	else if (user.getEmail().length()<5) 
		return new ErrorDataResult<Person>("Mailin 6 karakterden uzun olması lazım");
	
	
	
	else if (user.getPassword().length()<5) 
		return new ErrorDataResult<Person>("Şifrenin 6 karakterden uzun olması lazım");
	
	
	
	else if (user.getPhone().length()!=11) 
		return new ErrorDataResult<Person>("Telefon numarası tam girilmemis");
	
	else if (user.getName().length()<2) 
		return new ErrorDataResult<Person>("Bu kadar kısa isim olamaz");
	
	else if (user.getSurname().length()<2) 
		return new ErrorDataResult<Person>("Bu kadar kısa soyisim olamaz");
	
	else if (user.getJob().length()<5) 
		return new ErrorDataResult<Person>("Meslek adı bu kadar kısa olamaz");
	
	else {
		for(Person person:repository.findAll()) {
			if (person.getEmail().equals(user.getEmail())) {
				return new ErrorDataResult<Person>("Email önce kullanılmış");
			}
			
			

			
		
		}return new SuccessDataResult<Person>(this.repository.save(user),"eklendi");
		}
}
@Override
public DataResult<Schoolarship> addScholarship(Schoolarship scholarship) {
	return this.sholarsipService.addScholarship(scholarship);
	

}




}

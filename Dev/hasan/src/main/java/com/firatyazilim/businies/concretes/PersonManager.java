package com.firatyazilim.businies.concretes;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.firatyazilim.businies.abstracts.PersonService;
import com.firatyazilim.businies.abstracts.ScholarsipService;
import com.firatyazilim.businies.abstracts.CheckServices.PersonCheckService;
import com.firatyazilim.businies.concretes.CheckManager.PersonCheckManager;

import com.firatyazilim.core.utilities.result.DataResult;
import com.firatyazilim.core.utilities.result.ErrorDataResult;
import com.firatyazilim.core.utilities.result.SuccessDataResult;
import com.firatyazilim.dataAccess.abstracts.ApplicationRepository;
import com.firatyazilim.dataAccess.abstracts.PersonRepository;
import com.firatyazilim.entities.concretes.Application;
import com.firatyazilim.entities.concretes.Person;
import com.firatyazilim.entities.concretes.Schoolarship;
import com.firatyazilim.entities.concretes.Student;


@Service
public class PersonManager implements PersonService{
@Autowired
private ScholarsipService sholarsipService;
@Autowired
private PersonRepository repository;
@Autowired
private ApplicationRepository applicationRepository;


public PersonManager(PersonRepository repository,
		ScholarsipService scholarsipService,
		ApplicationRepository applicationRepository) {
	this.applicationRepository=applicationRepository;
	this.repository=repository;
	this.sholarsipService=scholarsipService;
	//this.checkService=checkService;
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
			&& user.getBirthOfDateYear()==0
			&& user.getIdentityNumber()==null
			) return new ErrorDataResult<Person>("Tüm alanlar doldurulması zorunludur");
	
	else if (user.getEmail().length()<5) 
		return new ErrorDataResult<Person>("Mailin 6 karakterden uzun olması lazım");
	
	
	
	else if (user.getPassword().length()<5) 
		return new ErrorDataResult<Person>("Şifrenin 6 karakterden uzun olması lazım");
	
	
	
	else if (user.getPhone().length()!=11) 
		return new ErrorDataResult<Person>("Telefon numarası "+user.getPhone().length()+" karakter olamaz");
	
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
			
			

			
		
		}
		PersonCheckService checkService=new PersonCheckManager();
		if(checkService.checkIfRealPerson(user)) {
		return new SuccessDataResult<Person>(this.repository.save(user),"eklendi");
		}else {
			return new ErrorDataResult<Person>("Girilen kullanıcı doğrulanmadı."
					+ "Lütfen gerçek bir insan girin");

		}
		}
}

@Override
public DataResult<Person> updateUser(Person user) {
	Person person=this.repository.getById(user.getId());
	if(person==null) {
		return new ErrorDataResult<Person >("Personel bulunamadı");
	}
	else {
		return new SuccessDataResult<Person >(this.repository.save(user),"Güncellendi");

	}
} 
@Override
public DataResult<Person> findById(int personId) {
	Person person=this.repository.getById(personId);
	return (person==null) ? new ErrorDataResult<Person>("bulunamadı") :
	new SuccessDataResult<Person>(this.repository.getById(personId),"Kullanıcı getirildi");

}
@Override
public DataResult<Person> updatePassword(String password, int id) {
	Person person=this.repository.getById(id);
	if(person==null) return new ErrorDataResult<Person>("bulunamadı");
	else {
		if(password.length()<6) 
			 return new ErrorDataResult<Person>("Şifre çok kısa");
		else {
			person.setPassword(password);
			return new SuccessDataResult<Person>(this.repository.save(person),"Şifre değiştirildi");
		
		}
	}

}
@Override
public DataResult<Schoolarship> addScholarship(int personId, 
	String description, String name, int amount,
	LocalDate applicationDate) {
	Person person=this.repository.getById(personId);
	Schoolarship schoolarship=new Schoolarship();
	schoolarship.setAmount(amount);
	schoolarship.setApplicaionDate(applicationDate);
	schoolarship.setDescription(description);
	schoolarship.setFull(false);
	schoolarship.setName(name);
	schoolarship.setPerson(person);
	schoolarship.setStudent(null);
	
	return this.sholarsipService.addScholarship(schoolarship);
}
@Override
public DataResult<List<Schoolarship>> getAllReferancesById(int personId) {
	Person person=this.repository.getById(personId);
	
	if (person!=null) 
		return new SuccessDataResult<List<Schoolarship>>
		(this.sholarsipService.SchoolarshipsByPersonId(personId));
	else return new ErrorDataResult<List<Schoolarship>>("Person boş  olamaz");

	


}
@Override
public DataResult<List<Application>> getAllScholarsipsById(int scholarsipsId) {
	Schoolarship schoolarship=this.sholarsipService.findById(scholarsipsId);
	if (schoolarship==null) {
		return new ErrorDataResult<Application>("Burs id ye  göre burs bulunamadı");
	}
	else 
	return new SuccessDataResult<List<Application>>(this.applicationRepository.findBySchoolarship_Id(scholarsipsId));
}}

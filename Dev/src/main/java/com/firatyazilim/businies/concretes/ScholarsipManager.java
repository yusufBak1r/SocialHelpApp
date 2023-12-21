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
public class ScholarsipManager implements ScholarsipService{
@Autowired	
private SchoolarshipRepository repository;
@Autowired PersonRepository personRepository;
	public ScholarsipManager(SchoolarshipRepository repository,PersonRepository personRepository) {
	this.repository=repository;
	this.personRepository=personRepository;
	}
	@Override
	public DataResult<Schoolarship> addScholarship(Schoolarship scholarship) {
		if(scholarship.getAmount()==0 && scholarship.getApplicaionDate()==null &&
				scholarship.getDescription()==null && scholarship.getName()==null && scholarship.getPerson()==null) {
			return new ErrorDataResult<Schoolarship>("Lütfen tüm alanları eksiksiz doldurun");
			
		}
		else if(scholarship.getName().length()<5) {
			return new ErrorDataResult<Schoolarship>("İsim alanı bu kadar kısa olamaz ");

		}
		else if(scholarship.getDescription().length()<5) {
			return new ErrorDataResult<Schoolarship>("Açıklama Alanı bu kadar kısa olamaz ");

		}
		else {
			return new SuccessDataResult<Schoolarship>(this.repository.save(scholarship),"Başarılı bir şekilde eklendi");

		}
	}
	@Override
	public DataResult<List<Schoolarship>> getAll() {
		return new SuccessDataResult<List<Schoolarship>>(this.repository.findAll(),"Tüm burslar getirildi");
	}
	@Override
	public Schoolarship findById(int scholarshipId) {
		return this.repository.findById(scholarshipId).orElse(null);
		
	}
	@Override
	public List<Schoolarship> SchoolarshipsByPersonId(int personId) {
		
	return this.repository.findByPerson_Id(personId);
	
		
	}
	
	
	
}

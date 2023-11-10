package com.firatyazilim.businies.concretes;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.firatyazilim.businies.abstracts.AdminService;
import com.firatyazilim.core.utilities.result.DataResult;
import com.firatyazilim.core.utilities.result.ErrorDataResult;
import com.firatyazilim.core.utilities.result.SuccessDataResult;
import com.firatyazilim.dataAccess.abstracts.AdminRepository;
import com.firatyazilim.entities.concretes.Admin;
import com.firatyazilim.entities.concretes.Person;

@Service
public class AdminManager implements AdminService{
@Autowired
private AdminRepository repository;

public AdminManager(AdminRepository repository) {
	// TODO Auto-generated constructor stub
	this.repository=repository;
}




@Override
public DataResult<List<Admin>> getAll() {
	
	return new SuccessDataResult<List<Admin>>(this.repository.findAll(),"Listelendi");
}


@Override
public DataResult<Admin> login(String email, String password) {
	Admin admin=repository.findByEmail(email);
	if(admin==null) {
		return new ErrorDataResult<Person>("Email bulunamadı");
	}
	else if (admin.getPassword().equals(password)) {
		return new SuccessDataResult<Person>("Giriş başarılı");

	}
	else {
		return new ErrorDataResult<Person>("Şifre yanlış");
	}
}


@Override
public DataResult<Admin> signUp(Admin user) {
	if(user.getEmail()==null && user.getPassword()==null
			&& user.getPhone()==null
			) return new ErrorDataResult<Admin>("Tüm alanlar doldurulması zorunludur");
	
	else if (user.getEmail().length()<5) 
		return new ErrorDataResult<Admin>("Mailin 6 karakterden uzun olması lazım");
	
	
	
	else if (user.getPassword().length()<5) 
		return new ErrorDataResult<Admin>("Şifrenin 6 karakterden uzun olması lazım");
	
	
	
	else if (user.getPhone().length()!=11) 
		return new ErrorDataResult<Admin>("Telefon numarası tam girilmemis");
	
	else {
		for(Admin admins:repository.findAll()) {
			if (admins.getEmail().equals(user.getEmail())) {
				return new ErrorDataResult<Admin>("Email önce kullanılmış");
			}
			
			

			
		
		}return new SuccessDataResult<Admin>(this.repository.save(user),"eklendi");
		}	
		
}
}
		
		
	
	



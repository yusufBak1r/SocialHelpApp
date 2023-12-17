package com.firatyazilim.businies.abstracts;


import java.util.List;

import com.firatyazilim.core.utilities.result.DataResult;
import com.firatyazilim.entities.abstracts.User;
import com.firatyazilim.entities.concretes.Student;



public interface UserService<T extends User> {
	DataResult<T> login(String email,String password);
	DataResult<T> updatePassword(String password,int id);
	DataResult<List<T>> getAll();
	DataResult<T> signUp(T user);
	DataResult<T> updateUser(T user);
	
}

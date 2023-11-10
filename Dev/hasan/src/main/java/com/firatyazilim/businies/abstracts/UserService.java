package com.firatyazilim.businies.abstracts;


import java.util.List;

import com.firatyazilim.core.utilities.result.DataResult;
import com.firatyazilim.entities.abstracts.User;



public interface UserService<T extends User> {
	DataResult<T> login(String email,String password);
	
	DataResult<List<T>> getAll();
	DataResult<T> signUp(T user);
	
}

package com.firatyazilim.businies.abstracts;

import com.firatyazilim.core.utilities.result.DataResult;
import com.firatyazilim.entities.concretes.Admin;

public interface AdminService  extends UserService<Admin>{
	DataResult<Admin> findById(int adminId);
}

package com.firatyazilim.businies.concretes.CheckManager;

import com.firatyazilim.businies.abstracts.CheckServices.StudentCheckService;
import com.firatyazilim.entities.concretes.Student;

public class StudentCheckManager implements StudentCheckService{

	@Override
	public boolean checkIfRealPerson(Student person) {
		// TODO Auto-generated method stub
		return true;
	}

}

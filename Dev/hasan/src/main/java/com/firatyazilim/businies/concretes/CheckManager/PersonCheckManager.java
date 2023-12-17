package com.firatyazilim.businies.concretes.CheckManager;

import com.firatyazilim.businies.abstracts.CheckServices.PersonCheckService;
import com.firatyazilim.entities.concretes.Person;

public class PersonCheckManager implements PersonCheckService{

	@Override
	public boolean checkIfRealPerson(Person person) {
		// TODO Auto-generated method stub
		return true;
	}

}

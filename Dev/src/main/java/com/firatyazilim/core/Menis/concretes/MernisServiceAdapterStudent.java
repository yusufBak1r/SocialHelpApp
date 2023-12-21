package com.firatyazilim.core.Menis.concretes;

import java.rmi.RemoteException;


import com.firatyazilim.businies.abstracts.CheckServices.StudentCheckService;

import com.firatyazilim.entities.concretes.Student;

import tr.gov.nvi.tckimlik.WS.KPSPublicSoapProxy;

public class MernisServiceAdapterStudent implements StudentCheckService{

	@Override
	public boolean checkIfRealPerson(Student user) {
		KPSPublicSoapProxy soap=new KPSPublicSoapProxy();
		try {
			return soap.TCKimlikNoDogrula(Long.valueOf(user.getIdentityNumber()),user.getName(),user.getSurname(),user.getBirthOfDateYear());
		} catch (NumberFormatException | RemoteException e) {
			
			return false;
		}
		
	}

	

}

package com.firatyazilim.core.Menis.concretes;

import java.rmi.RemoteException;

import com.firatyazilim.businies.abstracts.CheckServices.PersonCheckService;
import com.firatyazilim.core.utilities.result.ErrorResult;
import com.firatyazilim.entities.concretes.Person;


import tr.gov.nvi.tckimlik.WS.KPSPublicSoapProxy;

public class MernisServiceAdapterPerson implements PersonCheckService{

	

	@Override
	public boolean checkIfRealPerson(Person user) {
		KPSPublicSoapProxy soap=new KPSPublicSoapProxy();
		try {
			return soap.TCKimlikNoDogrula(Long.valueOf(user.getIdentityNumber()),user.getName(),user.getSurname(),user.getBirthOfDateYear().getYear());
		} catch (NumberFormatException | RemoteException e) {
			new ErrorResult("Sıkıntı");
			
		}
		return false;
	}

}

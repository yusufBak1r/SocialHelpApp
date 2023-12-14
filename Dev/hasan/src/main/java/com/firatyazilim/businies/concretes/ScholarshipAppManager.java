package com.firatyazilim.businies.concretes;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.firatyazilim.businies.abstracts.ScholarshipAppService;
import com.firatyazilim.controller.ScholarshipAppRepository;
import com.firatyazilim.core.utilities.result.DataResult;
import com.firatyazilim.core.utilities.result.SuccessDataResult;
import com.firatyazilim.entities.concretes.ScholarshipApp;

@Service

public class ScholarshipAppManager implements ScholarshipAppService{
@Autowired
private ScholarshipAppRepository repository;
public ScholarshipAppManager(ScholarshipAppRepository repository) {
	this.repository=repository;
}
@Override
public DataResult<List<ScholarshipApp>> getAll() {
	return new SuccessDataResult<List<ScholarshipApp>>(this.repository.findAll(),"Tüm burs ilişkilendilmeler getirildi");
}

}

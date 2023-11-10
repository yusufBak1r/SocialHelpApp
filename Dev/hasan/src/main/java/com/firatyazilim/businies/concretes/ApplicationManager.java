package com.firatyazilim.businies.concretes;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.firatyazilim.businies.abstracts.ApplicationService;
import com.firatyazilim.core.utilities.result.DataResult;
import com.firatyazilim.core.utilities.result.SuccessDataResult;
import com.firatyazilim.dataAccess.abstracts.ApplicationRepository;
import com.firatyazilim.entities.concretes.Application;
import com.firatyazilim.entities.concretes.Schoolarship;
import com.firatyazilim.entities.concretes.Student;


@Service
public class ApplicationManager implements ApplicationService{
@Autowired
private ApplicationRepository repository;
public ApplicationManager(ApplicationRepository repository) {
	this.repository=repository;
}
@Override
public DataResult<Application> createApplication(Student student, Schoolarship scholarship) {
    Application application = new Application();
	application.setStudent(student);
    application.setSchoolarship(scholarship);
	return new SuccessDataResult<Application>(this.repository.save(application));
}

}

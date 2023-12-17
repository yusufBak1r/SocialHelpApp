package com.firatyazilim.businies.abstracts;

import java.util.List;

import com.firatyazilim.core.utilities.result.DataResult;
import com.firatyazilim.core.utilities.result.Result;
import com.firatyazilim.entities.concretes.Application;
import com.firatyazilim.entities.concretes.Schoolarship;
import com.firatyazilim.entities.concretes.Student;

public interface ApplicationService {
//Result applyScholarsip(Application application);
    DataResult< Application> createApplication(int studentId,int scholarshipId);
    DataResult< List<Application>> getByScholarsipId(int scholarshipId);
    DataResult< List<Application>> getByStudentId(int studentId);
    DataResult< List<Application>> getAll();


}

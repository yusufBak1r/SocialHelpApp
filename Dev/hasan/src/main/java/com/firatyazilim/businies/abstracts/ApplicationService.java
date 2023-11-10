package com.firatyazilim.businies.abstracts;

import com.firatyazilim.core.utilities.result.DataResult;
import com.firatyazilim.core.utilities.result.Result;
import com.firatyazilim.entities.concretes.Application;
import com.firatyazilim.entities.concretes.Schoolarship;
import com.firatyazilim.entities.concretes.Student;

public interface ApplicationService {
//Result applyScholarsip(Application application);
    DataResult< Application> createApplication(Student student, Schoolarship scholarship);
    
}

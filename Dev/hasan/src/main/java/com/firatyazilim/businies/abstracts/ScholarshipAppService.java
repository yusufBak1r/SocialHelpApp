package com.firatyazilim.businies.abstracts;

import java.util.List;

import com.firatyazilim.core.utilities.result.DataResult;
import com.firatyazilim.entities.concretes.ScholarshipApp;

public interface ScholarshipAppService {
DataResult<List<ScholarshipApp>> getAll();
}

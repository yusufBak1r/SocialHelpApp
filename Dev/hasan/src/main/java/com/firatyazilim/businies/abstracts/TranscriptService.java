package com.firatyazilim.businies.abstracts;

import java.util.List;

import com.firatyazilim.core.utilities.result.DataResult;
import com.firatyazilim.core.utilities.result.Result;
import com.firatyazilim.entities.concretes.Transcript;

public interface TranscriptService {
DataResult<Transcript> addTranscript(Transcript transcript);
DataResult<List<Transcript>> getAll();
Result deeteById(int transId);
}

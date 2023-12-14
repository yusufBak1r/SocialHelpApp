package com.firatyazilim.businies.abstracts;

import java.util.List;

import com.firatyazilim.core.utilities.result.DataResult;
import com.firatyazilim.entities.concretes.Transcript;

public interface TranscriptService {
DataResult<List<Transcript>> addTranscript(Transcript transcript);
DataResult<List<Transcript>> getAll();

}

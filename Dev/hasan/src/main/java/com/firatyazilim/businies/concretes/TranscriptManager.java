package com.firatyazilim.businies.concretes;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.firatyazilim.businies.abstracts.TranscriptService;
import com.firatyazilim.core.utilities.result.DataResult;
import com.firatyazilim.core.utilities.result.ErrorDataResult;
import com.firatyazilim.core.utilities.result.SuccessDataResult;
import com.firatyazilim.dataAccess.abstracts.TranscriptRepository;
import com.firatyazilim.entities.concretes.Transcript;

@Service

public class TranscriptManager implements TranscriptService {
@Autowired
private TranscriptRepository repository;
public TranscriptManager(TranscriptRepository repository) {
this.repository=repository;	
}
@Override
public DataResult<List<Transcript>> addTranscript(Transcript transcript) {
	if (transcript.getTerm()==null && transcript.getTranscriptPdf()==null ) {
		return new ErrorDataResult<Transcript>("Tüm alanlar doldurulmak zorundadır");
	}
	else if (transcript.getTerm().length()<5) {
		return new ErrorDataResult<Transcript>("Tüm alanlar doldurulmak zorundadır");

	}
	else {
		return new SuccessDataResult<Transcript>(this.repository.save(transcript),"Transkript başarı ile  eklendi");
	}
}
@Override
public DataResult<List<Transcript>> getAll() {
	return new SuccessDataResult<List<Transcript>>(this.repository.findAll(),"Transkriptler getirildi");
	
}
}

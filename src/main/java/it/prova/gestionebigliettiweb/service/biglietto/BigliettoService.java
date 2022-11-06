package it.prova.gestionebigliettiweb.service.biglietto;

import java.util.List;

import it.prova.gestionebigliettiweb.dao.biglietto.BigliettoDAO;
import it.prova.gestionebigliettiweb.model.Biglietto;

public interface BigliettoService {

	public List<Biglietto> listAll() throws Exception;

	public Biglietto caricaSingolo(Long id) throws Exception;

	public void aggiorna(Biglietto input) throws Exception;

	public void inserisci(Biglietto input) throws Exception;

	public void rimuovi(Long input) throws Exception;

	public void setBigliettoDao(BigliettoDAO bigliettoDAO);

	public List<Biglietto> findByExample(Biglietto input) throws Exception;
}

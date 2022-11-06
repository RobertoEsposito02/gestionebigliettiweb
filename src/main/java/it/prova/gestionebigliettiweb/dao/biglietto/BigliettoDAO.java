package it.prova.gestionebigliettiweb.dao.biglietto;

import java.util.List;

import it.prova.gestionebigliettiweb.dao.IBaseDAO;
import it.prova.gestionebigliettiweb.model.Biglietto;

public interface BigliettoDAO extends IBaseDAO<Biglietto> {
	public List<Biglietto> findByExample(Biglietto input) throws Exception;
}

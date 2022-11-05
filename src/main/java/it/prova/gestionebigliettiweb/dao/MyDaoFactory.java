package it.prova.gestionebigliettiweb.dao;

import it.prova.gestionebigliettiweb.dao.biglietto.BigliettoDAO;
import it.prova.gestionebigliettiweb.dao.biglietto.BigliettoDAOImpl;

public class MyDaoFactory {

	private static BigliettoDAO bigliettoDaoInstance = null;

	public static BigliettoDAO getBigliettoDAOInstance() {
		if (bigliettoDaoInstance == null)
			bigliettoDaoInstance = new BigliettoDAOImpl();

		return bigliettoDaoInstance;
	}

}

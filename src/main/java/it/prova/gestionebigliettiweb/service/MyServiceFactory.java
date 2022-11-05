package it.prova.gestionebigliettiweb.service;

import it.prova.gestionebigliettiweb.dao.MyDaoFactory;
import it.prova.gestionebigliettiweb.service.biglietto.BigliettoService;
import it.prova.gestionebigliettiweb.service.biglietto.BigliettoServiceImpl;

public class MyServiceFactory {

	private static BigliettoService bigliettoServiceInstance = null;

	public static BigliettoService getBigliettoServiceInstance() {
		if (bigliettoServiceInstance == null)
			bigliettoServiceInstance = new BigliettoServiceImpl();

		bigliettoServiceInstance.setBigliettoDao(MyDaoFactory.getBigliettoDAOInstance());

		return bigliettoServiceInstance;
	}
}

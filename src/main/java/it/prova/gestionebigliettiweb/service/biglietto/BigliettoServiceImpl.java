package it.prova.gestionebigliettiweb.service.biglietto;

import java.util.List;

import javax.persistence.EntityManager;

import it.prova.gestionebigliettiweb.dao.biglietto.BigliettoDAO;
import it.prova.gestionebigliettiweb.model.Biglietto;
import it.prova.gestionebigliettiweb.web.listener.LocalEntityManagerFactoryListener;

public class BigliettoServiceImpl implements BigliettoService {
	private BigliettoDAO bigliettoDAO;

	@Override
	public void setBigliettoDao(BigliettoDAO bigliettoDAO) {
		this.bigliettoDAO = bigliettoDAO;
	}

	@Override
	public List<Biglietto> listAll() throws Exception {
		EntityManager entityManager = LocalEntityManagerFactoryListener.getEntityManager();

		try {

			bigliettoDAO.setEntityManager(entityManager);

			return bigliettoDAO.list();

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			LocalEntityManagerFactoryListener.closeEntityManager(entityManager);
		}
	}

	@Override
	public Biglietto caricaSingolo(Long id) throws Exception {
		EntityManager entityManager = LocalEntityManagerFactoryListener.getEntityManager();

		try {

			bigliettoDAO.setEntityManager(entityManager);

			return bigliettoDAO.findOne(id);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			LocalEntityManagerFactoryListener.closeEntityManager(entityManager);
		}
	}

	@Override
	public void aggiorna(Biglietto input) throws Exception {
		EntityManager entityManager = LocalEntityManagerFactoryListener.getEntityManager();

		try {

			entityManager.getTransaction().begin();

			bigliettoDAO.setEntityManager(entityManager);

			bigliettoDAO.update(input);

			entityManager.getTransaction().commit();
		} catch (Exception e) {
			entityManager.getTransaction().rollback();
			e.printStackTrace();
			throw e;
		} finally {
			LocalEntityManagerFactoryListener.closeEntityManager(entityManager);
		}

	}

	@Override
	public void inserisci(Biglietto input) throws Exception {
		EntityManager entityManager = LocalEntityManagerFactoryListener.getEntityManager();

		try {

			entityManager.getTransaction().begin();

			bigliettoDAO.setEntityManager(entityManager);

			bigliettoDAO.insert(input);

			entityManager.getTransaction().commit();
		} catch (Exception e) {
			entityManager.getTransaction().rollback();
			e.printStackTrace();
			throw e;
		} finally {
			LocalEntityManagerFactoryListener.closeEntityManager(entityManager);
		}

	}

	@Override
	public void rimuovi(Long input) throws Exception {
		EntityManager entityManager = LocalEntityManagerFactoryListener.getEntityManager();

		try {

			entityManager.getTransaction().begin();

			bigliettoDAO.setEntityManager(entityManager);

			bigliettoDAO.delete(bigliettoDAO.findOne(input));

			entityManager.getTransaction().commit();
		} catch (Exception e) {
			entityManager.getTransaction().rollback();
			e.printStackTrace();
			throw e;
		} finally {
			LocalEntityManagerFactoryListener.closeEntityManager(entityManager);
		}
	}

	@Override
	public List<Biglietto> findByExample(Biglietto input) throws Exception {
		EntityManager entityManager = LocalEntityManagerFactoryListener.getEntityManager();

		try {

			bigliettoDAO.setEntityManager(entityManager);

			return bigliettoDAO.findByExample(input);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			LocalEntityManagerFactoryListener.closeEntityManager(entityManager);
		}
	}

}

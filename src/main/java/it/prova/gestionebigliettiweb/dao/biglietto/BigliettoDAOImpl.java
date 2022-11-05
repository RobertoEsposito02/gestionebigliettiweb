package it.prova.gestionebigliettiweb.dao.biglietto;

import java.util.List;

import javax.persistence.EntityManager;

import it.prova.gestionebigliettiweb.model.Biglietto;

public class BigliettoDAOImpl implements BigliettoDAO{

	private EntityManager entityManager;
	
	@Override
	public List<Biglietto> list() throws Exception {
		return entityManager.createQuery("from Biglietto", Biglietto.class).getResultList();
	}

	@Override
	public Biglietto findOne(Long id) throws Exception {
		return entityManager.find(Biglietto.class, id);
	}

	@Override
	public void update(Biglietto input) throws Exception {
		if(input == null)
			throw new RuntimeException("input non valido");
		
		input = entityManager.merge(input);
	}

	@Override
	public void insert(Biglietto input) throws Exception {
		if (input == null)
			throw new RuntimeException("input non valido");
		entityManager.persist(input);
	}

	@Override
	public void delete(Biglietto input) throws Exception {
		if(input == null)
			throw new RuntimeException("input non valido");
		entityManager.remove(input);
	}

	@Override
	public void setEntityManager(EntityManager entityManager) {
		this.entityManager = entityManager;
	}

	@Override
	public List<Biglietto> findByExample(Biglietto input) throws Exception {
		return null;
	}

}

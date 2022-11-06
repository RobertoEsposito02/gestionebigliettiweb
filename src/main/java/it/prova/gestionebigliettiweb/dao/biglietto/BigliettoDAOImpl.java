package it.prova.gestionebigliettiweb.dao.biglietto;

import java.util.List;

import javax.persistence.EntityManager;

import it.prova.gestionebigliettiweb.model.Biglietto;

public class BigliettoDAOImpl implements BigliettoDAO {

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
		if (input == null)
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
		if (input == null)
			throw new RuntimeException("input non valido");
		entityManager.remove(input);
	}

	@Override
	public void setEntityManager(EntityManager entityManager) {
		this.entityManager = entityManager;
	}

	@Override
	public List<Biglietto> findByExample(Biglietto input) throws Exception {
		String queryString = "from Biglietto where 1=1";

		if (!(input.getProvenienza().isEmpty()))
			queryString += " and provenienza = '" + input.getProvenienza() + "'";
		if (!(input.getDestinazione().isEmpty()))
			queryString += " and destinazione = '" + input.getDestinazione() + "'";
		if (input.getPrezzo() != null)
			queryString += " and prezzo = " + input.getPrezzo();
		if (!(input.getData() == null))
			queryString += " and data = '" + input.getData().toInstant() + "'";

		return entityManager.createQuery(queryString, Biglietto.class).getResultList();
	}

}

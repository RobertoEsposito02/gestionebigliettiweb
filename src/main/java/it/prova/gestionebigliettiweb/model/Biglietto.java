package it.prova.gestionebigliettiweb.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "biglietto")
public class Biglietto {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;
	@Column(name = "provenienza")
	private String provenienza;
	@Column(name = "destinazione")
	private String destinazione;
	@Column(name = "data")
	private Date data;
	@Column(name = "prezzo")
	private Integer prezzo;
	
	public Biglietto() {
	}
	
	public Biglietto(String provenienza, String destinazione) {
		this.provenienza = provenienza;
		this.destinazione = destinazione;
	}
	
	public Biglietto(String provenienza,String destinazione,Date data,Integer prezzo) {
		this.provenienza = provenienza;
		this.destinazione = destinazione;
		this.data = data;
		this.prezzo = prezzo;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getProvenienza() {
		return provenienza;
	}

	public void setProvenienza(String provenienza) {
		this.provenienza = provenienza;
	}

	public String getDestinazione() {
		return destinazione;
	}

	public void setDestinazione(String destinazione) {
		this.destinazione = destinazione;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public Integer getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(Integer prezzo) {
		this.prezzo = prezzo;
	}
}

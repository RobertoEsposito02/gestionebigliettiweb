package it.prova.gestionebigliettiweb.utility;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;

import it.prova.gestionebigliettiweb.model.Biglietto;

public class UtilityBigliettoForm {
	public static Biglietto createBigliettoFromParam(String provenienzaParam, String destinazioneParam,
			String dataParam, String prezzoParam) {
		Biglietto result = new Biglietto(provenienzaParam,destinazioneParam);

		if(NumberUtils.isCreatable(prezzoParam)) {
			result.setPrezzo(Integer.parseInt(prezzoParam));
		}
		result.setData(parseDataFromString(dataParam));
		
		return result;
	}
	
	public static Date parseDataFromString(String dataParam) {
		if (StringUtils.isBlank(dataParam))
			return null;

		try {
			return new SimpleDateFormat("yyyy-MM-dd").parse(dataParam);
		} catch (ParseException e) {
			return null;
		}
	}
	
	public static boolean validazioneFormBiglietto(Biglietto input) {
		if(StringUtils.isBlank(input.getProvenienza()) || 
		   StringUtils.isBlank(input.getDestinazione()) || 
		   input.getPrezzo() == null ||
		   input.getPrezzo() < 1 ||
		   input.getData() == null) {
			return false;
		}
		return true;
	}
}

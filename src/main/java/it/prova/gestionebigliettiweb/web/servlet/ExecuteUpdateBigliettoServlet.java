package it.prova.gestionebigliettiweb.web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.math.NumberUtils;

import it.prova.gestionebigliettiweb.model.Biglietto;
import it.prova.gestionebigliettiweb.service.MyServiceFactory;
import it.prova.gestionebigliettiweb.utility.UtilityBigliettoForm;

@WebServlet("/ExecuteUpdateBigliettoServlet")
public class ExecuteUpdateBigliettoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ExecuteUpdateBigliettoServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String provenienzaParam = request.getParameter("provenienza");
		String destinazioneParam = request.getParameter("destinazione");
		String prezzoParam = request.getParameter("prezzo");
		String dataParam = request.getParameter("data");
		String idBiglietto = request.getParameter("idBiglietto");
		
		if (!NumberUtils.isCreatable(idBiglietto)) {
			request.setAttribute("errorMessage", "Attenzione si è verificato un errore.");
			request.getRequestDispatcher("/home.jsp").forward(request, response);
			return;
		}
		
		Biglietto input = UtilityBigliettoForm.createBigliettoFromParam(provenienzaParam, destinazioneParam, dataParam,
				prezzoParam);
		input.setId(Long.parseLong(idBiglietto));

		if (!UtilityBigliettoForm.validazioneFormBiglietto(input)) {
			request.setAttribute("nuovoBigliettoAttribute", input);
			request.setAttribute("errorMessage", "Attenzione sono presenti errori di validazione");
			request.getRequestDispatcher("biglietto/insert.jsp").forward(request, response);
			return;
		}
		
		try {
			MyServiceFactory.getBigliettoServiceInstance().aggiorna(input);
			request.setAttribute("listAllAttribute", MyServiceFactory.getBigliettoServiceInstance().listAll());
			request.setAttribute("successMessage", "Operazione effettuata con successo");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "Attenzione sono presenti errori di validazione");
			request.getRequestDispatcher("home.jsp").forward(request, response);
			return;
		}
		
		request.getRequestDispatcher("biglietto/results.jsp").forward(request, response);
	}

}

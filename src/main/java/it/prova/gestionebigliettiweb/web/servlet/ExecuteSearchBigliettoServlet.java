package it.prova.gestionebigliettiweb.web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.prova.gestionebigliettiweb.model.Biglietto;
import it.prova.gestionebigliettiweb.service.MyServiceFactory;
import it.prova.gestionebigliettiweb.utility.UtilityBigliettoForm;

@WebServlet("/ExecuteSearchBigliettoServlet")
public class ExecuteSearchBigliettoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ExecuteSearchBigliettoServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String provenienzaInput = request.getParameter("provenienza");
		String destinazioneInput = request.getParameter("destinazione");
		String dataInput = request.getParameter("data");
		String prezzoInput = request.getParameter("prezzo");

		Biglietto input = UtilityBigliettoForm.createBigliettoFromParam(provenienzaInput, destinazioneInput, dataInput,
				prezzoInput);

		try {
			request.setAttribute("listAllAttribute",
					MyServiceFactory.getBigliettoServiceInstance().findByExample(input));
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

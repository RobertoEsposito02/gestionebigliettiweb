package it.prova.gestionebigliettiweb.web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.math.NumberUtils;

import it.prova.gestionebigliettiweb.service.MyServiceFactory;

@WebServlet("/admin/PrepareDeleteBigliettoServlet")
public class PrepareDeleteBigliettoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PrepareDeleteBigliettoServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String idBiglietto = request.getParameter("idBiglietto");

		if (!NumberUtils.isCreatable(idBiglietto)) {
			request.setAttribute("errorMessage", "Attenzione si è verificato un errore.");
			request.getRequestDispatcher("/home.jsp").forward(request, response);
			return;
		}

		try {
			request.setAttribute("bigliettoDeleteAttribute",
					MyServiceFactory.getBigliettoServiceInstance().caricaSingolo(Long.parseLong(idBiglietto)));
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "Attenzione si è verificato un errore.");
			request.getRequestDispatcher("/home.jsp").forward(request, response);
			return;
		}

		request.getRequestDispatcher("/biglietto/delete.jsp").forward(request, response);
	}
}

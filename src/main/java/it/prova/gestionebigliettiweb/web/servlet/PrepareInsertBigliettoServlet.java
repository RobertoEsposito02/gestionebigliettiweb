package it.prova.gestionebigliettiweb.web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.prova.gestionebigliettiweb.model.Biglietto;

@WebServlet("/admin/PrepareInsertBigliettoServlet")
public class PrepareInsertBigliettoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PrepareInsertBigliettoServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/biglietto/insert.jsp").forward(request, response);
	}

}

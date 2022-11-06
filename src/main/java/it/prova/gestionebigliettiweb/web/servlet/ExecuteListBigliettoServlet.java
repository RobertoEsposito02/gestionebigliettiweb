package it.prova.gestionebigliettiweb.web.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.prova.gestionebigliettiweb.service.MyServiceFactory;

@WebServlet("/ExecuteListBigliettoServlet")
public class ExecuteListBigliettoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ExecuteListBigliettoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setAttribute("listAllAttribute", MyServiceFactory.getBigliettoServiceInstance().listAll());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("biglietto/results.jsp");
		rd.forward(request, response);
	}
}

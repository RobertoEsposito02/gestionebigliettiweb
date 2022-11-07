package it.prova.gestionebigliettiweb.web.servlet.login;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.prova.gestionebigliettiweb.model.Ruolo;
import it.prova.gestionebigliettiweb.model.Utente;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String usernameParam = request.getParameter("username");
		String passwordParam = request.getParameter("password");
		
		if(usernameParam.equals("admin") && passwordParam.equals("admin")) {
			request.getSession().setAttribute("userInfo", new Utente(usernameParam, passwordParam, "Admin", "User",
					Arrays.asList(new Ruolo(Ruolo.ADMIN_ROLE))));
			request.getRequestDispatcher("home.jsp").forward(request, response);
			return;
		}
		
		if(usernameParam.equals("user") && passwordParam.equals("user")) {
			request.getSession().setAttribute("userInfo", new Utente(usernameParam, passwordParam, "Classic", "User",
					Arrays.asList(new Ruolo(Ruolo.CLASSIC_USER_ROLE))));
			request.getRequestDispatcher("home.jsp").forward(request, response);
			return;
		}

		request.setAttribute("loginUtente", new Utente(usernameParam, passwordParam));
		request.setAttribute("messaggio", "Credenziali errate");
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}

}

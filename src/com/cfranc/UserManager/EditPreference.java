package com.cfranc.UserManager;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cfranc.UserManger.model.Utilisateur;

import dao.UserDAO;

import com.cfranc.UserManger.model.ListeUtilisateur;
import com.cfranc.UserManger.model.Preferences;


@WebServlet("/EditPreference")
public class EditPreference extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public EditPreference() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		HashMap<Long, Utilisateur> users = (HashMap<Long, Utilisateur>)session.getAttribute("users");	
		long id = Long.parseLong((String) request.getParameter("user"));	
		Utilisateur user = users.get(id);
		session.setAttribute("user", user);
		
		RequestDispatcher dispatch = request.getRequestDispatcher("WEB-INF/views/PreferenceEdit.jsp");
		dispatch.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ListeUtilisateur users = (ListeUtilisateur) session.getAttribute("users");
		Utilisateur user = (Utilisateur) request.getSession().getAttribute("user");
		
		String conducteur = request.getParameter("conducteur");

		String music = request.getParameter("music");
		String fumeur = request.getParameter("fumeur");
		String blabla = request.getParameter("blabla");		
		String detourString = request.getParameter("detour");
		Preferences preference = new Preferences();

		if ("oui".equals(conducteur)) {
			preference.setConducteur("oui");
		} else if ("non".equals(conducteur)) {
			preference.setConducteur("non");
		}

		if ("oui".equals(music)) {
			preference.setMusic("oui");
		} else if ("non".equals(music)) {
			preference.setMusic("non");
		}

		if ("oui".equals(fumeur)) {
			preference.setFumeur("oui");
		} else if ("non".equals(fumeur)) {
			preference.setFumeur("non");
		}

		if ("oui".equals(blabla)) {
			preference.setBlabla("beaucoup");
		} else if ("non".equals(blabla)) {
			preference.setBlabla("pas du tout");
		}

		long detour = Long.parseLong(detourString);
		preference.setDetour(detour);

		user.setPreferences(preference);
		UserDAO.editPreferences(user);
		session.setAttribute("users", UserDAO.findAll2());
		response.sendRedirect("DetailUser?user=" + user.getId());
		
		
		
	}

}

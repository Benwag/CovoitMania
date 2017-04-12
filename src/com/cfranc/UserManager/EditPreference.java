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
		Utilisateur user = (Utilisateur) request.getSession().getAttribute("loggedUser");
		
		String conducteur = request.getParameter("conducteur");

		String music = request.getParameter("music");
		String fumeur = request.getParameter("fumeur");
		String blabla = request.getParameter("blabla");		
		String detourString = request.getParameter("detour");
		long userId = user.getId();
		UserDAO.editPreferences(userId, conducteur, music, fumeur, blabla, detourString);
		HttpSession session = request.getSession();
		session.setAttribute("loggedUser", user);
		RequestDispatcher dispatch = request.getRequestDispatcher("/WEB-INF/views/UserAccount.jsp");
		dispatch.forward(request, response);
//		response.sendRedirect("UserAccount?user=" + user.getId());
		
		
		
	}

}

package com.cfranc.UserManager;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cfranc.UserManger.model.ListeMessage;
import com.cfranc.UserManger.model.ListeUtilisateur;
import com.cfranc.UserManger.model.Utilisateur;
import dao.UserDAO;

@WebServlet("/Accueil")
public class Accueil extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Accueil() {
        super();
    }

    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("users") == null){	
			ListeUtilisateur users = UserDAO.getStaticUsers();
			session.setAttribute("users", users);
			session.setAttribute("listeMessage", listeMessage);
			System.out.println("Session users created");
		}
		RequestDispatcher dispatch = request.getRequestDispatcher("/index.jsp");
		dispatch.forward(request, response);
	}
	ListeMessage listeMessage=new ListeMessage();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

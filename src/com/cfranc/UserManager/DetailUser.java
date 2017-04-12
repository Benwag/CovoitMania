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

import com.cfranc.UserManger.model.ListeMessage;
import com.cfranc.UserManger.model.ListeUtilisateur;
import com.cfranc.UserManger.model.Message;
import com.cfranc.UserManger.model.Utilisateur;

@WebServlet("/DetailUser")
public class DetailUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DetailUser() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("user");
		if(userId == null)
		{
			getServletContext().setAttribute("error", "User doesn't exist");
			response.sendRedirect("AllUsers");
		}
		else
		{
			HttpSession session = request.getSession();
			HashMap<Long, Utilisateur> users = (HashMap<Long, Utilisateur>)session.getAttribute("users");	
			long id = Long.parseLong(userId);	
			Utilisateur user = users.get(id);
			session.setAttribute("user", user);
			
			RequestDispatcher dispatch = request.getRequestDispatcher("/WEB-INF/views/UserDetail.jsp");
			dispatch.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String destinataireId = request.getParameter("user");
		HttpSession session = request.getSession();
		String expediteurId="1";
		if (session.getAttribute("loggedUser")!=null){
		expediteurId= ((Long)((Utilisateur)session.getAttribute("loggedUser")).getId()).toString();}
		String messageContent=request.getParameter("Message");
		ListeMessage listeMessage=new ListeMessage();
		if (session.getAttribute("listeMessage")!=null){listeMessage=(ListeMessage)session.getAttribute("listeMessage");}
		ListeUtilisateur users=(ListeUtilisateur)session.getAttribute("users");
		Long nextId=listeMessage.nextId();
		Message message=new Message(expediteurId, destinataireId,messageContent, users.get(Long.parseLong(expediteurId)).getFirstname(),users.get(Long.parseLong(destinataireId)).getFirstname(),nextId);
		listeMessage.put(nextId, message);
		session.setAttribute("listeMessage", listeMessage);
		response.sendRedirect("AfficherRoutes");
	}

}

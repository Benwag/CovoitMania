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

/**
 * Servlet implementation class UserAccount
 */
@WebServlet("/UserAccount")
public class UserAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserAccount() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("user");
		if(userId == null)
		{
			getServletContext().setAttribute("error", "User doesn't exist");
			response.sendRedirect("/index.jsp");
		}
		else
		{
			HttpSession session = request.getSession();
			HashMap<Long, Utilisateur> users = (HashMap<Long, Utilisateur>)session.getAttribute("users");	
			long id = Long.parseLong(userId);	
			Utilisateur user = users.get(id);
			session.setAttribute("loggedUser", user);
			
			RequestDispatcher dispatch = request.getRequestDispatcher("/WEB-INF/views/UserAccount.jsp");
			dispatch.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

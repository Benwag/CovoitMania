package com.cfranc.UserManager;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cfranc.UserManger.model.ListeUtilisateur;
import com.cfranc.UserManger.model.Utilisateur;

import dao.UserDAO;

/**
 * Servlet implementation class AddUser
 */
@WebServlet("/AddUser")
public class AddUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddUser() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("users") == null){	
			ListeUtilisateur users = UserDAO.getStaticUsers();
			session.setAttribute("users", users);
			System.out.println("Session users created");
		}
		RequestDispatcher dispatch = request.getRequestDispatcher("WEB-INF/views/UserAdd.jsp");
		dispatch.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		ListeUtilisateur users = (ListeUtilisateur) session.getAttribute("users");

		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String password = request.getParameter("password");
		

		if (firstname.isEmpty() || lastname.isEmpty()) {
			getServletContext().setAttribute("error", "First and Last name are required");
			response.sendRedirect("AddUser");
		} else {
			int age = Integer.parseInt(request.getParameter("age"));
			String email = request.getParameter("email");
			String address = request.getParameter("address");
			String city = request.getParameter("city");
			int postalCode = Integer.parseInt(request.getParameter("postalCode"));
			
			
			Collection<Utilisateur> userList = users.values();
			boolean isAdressGood = true;
			for (Utilisateur utilisateur : userList) {

				if (email.equals(utilisateur.getEmail())) {
					response.getWriter().append("This email is already used");
					isAdressGood = false;
					response.sendRedirect("AddUser");
					break;
				}
			}
			if (isAdressGood) {

				Utilisateur user = UserDAO.addUser(firstname, lastname, age, email, address, city, postalCode, password);
				response.sendRedirect("DetailUser?user=" + user.getId());
			}
		}
	}
}



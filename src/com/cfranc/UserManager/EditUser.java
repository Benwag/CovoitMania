package com.cfranc.UserManager;

import java.io.IOException;
import java.util.Collection;
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

/**
 * Servlet implementation class EditUser
 */
@WebServlet("/EditUser")
public class EditUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditUser() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userId = request.getParameter("user");
		if (userId == null) {
			getServletContext().setAttribute("error", "User doesn't exist");
			response.sendRedirect("AllUsers");
		} else {
			HttpSession session = request.getSession();
			HashMap<Long, Utilisateur> users = (HashMap<Long, Utilisateur>) session.getAttribute("users");

			long id = Long.parseLong((String) request.getParameter("user"));
			Utilisateur user = users.get(id);
			session.setAttribute("user", user);

			RequestDispatcher dispatch = request.getRequestDispatcher("WEB-INF/views/UserEdit.jsp");
			dispatch.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Utilisateur user = (Utilisateur) request.getSession().getAttribute("loggedUser");
		
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String ageString = request.getParameter("age");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String postalCodeString = request.getParameter("postalCode");
		String city = request.getParameter("city");

		if (firstname != "") {
			user.setFirstname(firstname);
		}
		if (lastname != "") {
			user.setLastname(lastname);
		}
		if (ageString != "") {
			int age = Integer.parseInt(ageString);
			user.setAge(age);
		}
		if (email != "") {
			user.setEmail(email);
		}
		if (address != "") {
			user.setAddress(address);
		}
		if (postalCodeString != "") {
			int postalCode = Integer.parseInt(postalCodeString);
			user.setPostCode(postalCode);
		}
		if (city != "") {
			user.setCity(city);
		}

		if (address != "" || city != "") {
			user.setCoord(ConvertAdressCoord.getCoordFromAdress(address + " " + city));
		}

		UserDAO.editUser(user);
		HttpSession session = request.getSession();
		session.setAttribute("loggedUser", user);
		RequestDispatcher dispatch = request.getRequestDispatcher("/WEB-INF/views/UserAccount.jsp");
		dispatch.forward(request, response);
	}

}

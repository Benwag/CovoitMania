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

import com.cfranc.UserManger.model.ListeUtilisateur;
import com.cfranc.UserManger.model.Utilisateur;

import dao.UserDAO;

@WebServlet("/EditPassword")
public class EditPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditPassword() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		HashMap<Long, Utilisateur> users = (HashMap<Long, Utilisateur>) session.getAttribute("users");
		long id = Long.parseLong((String) request.getParameter("user"));
		Utilisateur user = users.get(id);
		session.setAttribute("user", user);

		RequestDispatcher dispatch = request.getRequestDispatcher("WEB-INF/views/PasswordEdit.jsp");
		dispatch.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		ListeUtilisateur users = (ListeUtilisateur) session.getAttribute("users");
		Utilisateur user = (Utilisateur) request.getSession().getAttribute("user");

		String previousPassword = request.getParameter("previousPassword").trim();
		String newPassword = request.getParameter("newPassword");
		long userId = user.getId();
		user = users.get(userId);

		boolean isPasswordGood = previousPassword.equals(user.getPassword());

		if (isPasswordGood) {

			user = UserDAO.editPassword(userId, previousPassword, newPassword);
			response.sendRedirect("DetailUser?user=" + user.getId());
			
		}
		else {

			response.sendRedirect("UserAccount?loggedUser=" + user.getId());
		}

	}

}

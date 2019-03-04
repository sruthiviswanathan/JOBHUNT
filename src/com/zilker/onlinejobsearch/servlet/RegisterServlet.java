package com.zilker.onlinejobsearch.servlet;

import java.io.IOException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zilker.onlinejobsearch.beans.Company;
import com.zilker.onlinejobsearch.beans.Technology;
import com.zilker.onlinejobsearch.beans.User;
import com.zilker.onlinejobsearch.beans.UserTechnologyMapping;
import com.zilker.onlinejobsearch.delegate.CompanyDelegate;
import com.zilker.onlinejobsearch.delegate.UserDelegate;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {

			request.setAttribute("userRegistrationError", "error");

			Technology technology = new Technology();
			ArrayList<Technology> tech = new ArrayList<Technology>();
			UserDelegate userDelegate = new UserDelegate();
			tech = userDelegate.displayTechnologies(technology);
			request.setAttribute("technologies", tech);

			Company company = new Company();
			ArrayList<Company> displayCompanies = new ArrayList<Company>();
			CompanyDelegate companyDelegate = new CompanyDelegate();
			displayCompanies = companyDelegate.displayCompanies(company);
			request.setAttribute("companies", displayCompanies);

			RequestDispatcher rd = request.getRequestDispatcher("Pages/jsp/signup.jsp");
			rd.forward(request, response);

		} catch (Exception e) {

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			HttpSession session = request.getSession();
			String[] technology;
			String skills="";
			String userName = "";
			int userId = 0, flag = 0, technologyId = 0;
			UserDelegate userDelegate = new UserDelegate();
			Technology techh = new Technology();
			UserTechnologyMapping usertechnology = new UserTechnologyMapping();
			User user = new User();
			String name = request.getParameter("userName");
			String password = request.getParameter("psw");
			String confirmPassword = request.getParameter("cpsw");
			String email = request.getParameter("email");
			String companyName = request.getParameter("companyName");
			String designation = request.getParameter("designation");
	
			user.setUserName(name);
			user.setEmail(email);
			user.setPassword(password);
			user.setCompany(companyName);
			user.setDesignation(designation);

			if (userDelegate.register(user)) {

				userId = userDelegate.fetchUserId(user);
				user.setUserId(userId);
				userDelegate.insertIntoUser(user);

			}
				skills = request.getParameter("skillset");
				if (skills != "") {
					technology = skills.split("@");
					if (technology != null) {

						for (int i = 0; i < technology.length; i++) {
							

							usertechnology.setUserId(user.getUserId());
							techh.setTechnology(technology[i]);
							technologyId = userDelegate.fetchTechnologyId(techh);
							if (technologyId == 0) {
								techh.setTechnology(technology[i]);
								technologyId = userDelegate.addNewTechnology(techh, user);
								usertechnology.setTechnologyId(technologyId);
								flag = userDelegate.addTechnologyDetails(usertechnology);
							} else {
								usertechnology.setTechnologyId(technologyId);
								flag = userDelegate.addTechnologyDetails(usertechnology);
							}
						}

					}	
				}

				session.setAttribute("email", email);
				request.setAttribute("registerSuccess", "yes");

				userName = userDelegate.fetchUserNameById(userId);
				session.setAttribute("userName", userName);
				RequestDispatcher rd = request.getRequestDispatcher("Pages/jsp/findjob.jsp");
				rd.forward(request, response);

			//}

		}

		catch (SQLIntegrityConstraintViolationException e) {

			request.setAttribute("userRegistrationError", "error");
			response.sendRedirect("RegisterServlet");

		}

		catch (Exception e) {
			request.setAttribute("exception", e);
			RequestDispatcher rd = request.getRequestDispatcher("Pages/jsp/error.jsp");
			rd.forward(request, response);
		}
	}

}

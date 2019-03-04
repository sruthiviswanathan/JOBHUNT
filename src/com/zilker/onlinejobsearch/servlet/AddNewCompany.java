package com.zilker.onlinejobsearch.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zilker.onlinejobsearch.beans.Company;
import com.zilker.onlinejobsearch.beans.Technology;
import com.zilker.onlinejobsearch.delegate.CompanyDelegate;
import com.zilker.onlinejobsearch.delegate.UserDelegate;


/**
 * Servlet implementation class AddNewCompany
 */
@WebServlet("/AddNewCompany")
public class AddNewCompany extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddNewCompany() {
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
		
			
			Technology technology = new Technology();
			ArrayList<Technology> tech = new ArrayList<Technology>();
			UserDelegate userDelegate = new UserDelegate();
			tech = userDelegate.displayTechnologies(technology);
			request.setAttribute("technologies",tech);
			
			Company company = new Company();
			ArrayList<Company> displayCompanies = new ArrayList<Company>();
			CompanyDelegate companyDelegate = new CompanyDelegate();
			displayCompanies = companyDelegate.displayCompanies(company);
			request.setAttribute("companies", displayCompanies);
			
			RequestDispatcher rd = request.getRequestDispatcher("Pages/jsp/signup.jsp");
			rd.forward(request, response);
			
			}catch(Exception e) {
				
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
			Company company = new Company();
			CompanyDelegate companyDelegate = new CompanyDelegate();
			String companyName = request.getParameter("companyName");
			String websiteUrl = request.getParameter("websiteUrl");
			String companyLogo = request.getParameter("companyLogo");
			company.setCompanyName(companyName);
			company.setCompanyWebsiteUrl(websiteUrl);
			company.setCompanyLogo(companyLogo);
			if (companyDelegate.addNewCompany(company)) {
				response.sendRedirect("AddNewCompany");
			} else {
				response.sendRedirect("Pages/jsp/error.jsp");
			}

		} catch (Exception e) {
			response.sendRedirect("Pages/jsp/error.jsp");
		}
	}

}

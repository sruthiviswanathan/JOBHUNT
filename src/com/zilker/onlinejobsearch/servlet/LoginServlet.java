package com.zilker.onlinejobsearch.servlet;

import java.io.IOException;
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
import com.zilker.onlinejobsearch.delegate.CompanyDelegate;
import com.zilker.onlinejobsearch.delegate.UserDelegate;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
			
			RequestDispatcher rd = request.getRequestDispatcher("Pages/jsp/login.jsp");
			rd.forward(request, response);
			
			}catch(Exception e) {
				
			}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			
			HttpSession session=request.getSession(); 
			//response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
			int role=0,userId=0;
			String userName="";
			UserDelegate userDelegate = new UserDelegate();
			User user = new User();
			String password = request.getParameter("psw");
			String email = request.getParameter("email");
			user.setEmail(email);
			user.setPassword(password);
			role = userDelegate.login(user);
			session.setAttribute("email",email); 
			
			
			  userId = userDelegate.fetchUserId(user);
			  userName = userDelegate.fetchUserNameById(userId);  
			  session.setAttribute("userName",userName);
			 
			
			if (role == 0) {
				
				request.setAttribute("loginError","error");
				RequestDispatcher rd = request.getRequestDispatcher("Pages/jsp/login.jsp");
				rd.forward(request, response);
				
			} else if (role == 1) {
					
				RequestDispatcher rd = request.getRequestDispatcher("Pages/jsp/findjob.jsp");
				rd.forward(request, response);
				
			} else if (role == 2) {
				
				RequestDispatcher rd = request.getRequestDispatcher("AdminStatisticsServlet");
				rd.forward(request, response);
			} 
		
			}catch(Exception e) {
				request.setAttribute("exception",e);
				RequestDispatcher rd = request.getRequestDispatcher("Pages/jsp/error.jsp");
				rd.forward(request, response);
			}
	}

}

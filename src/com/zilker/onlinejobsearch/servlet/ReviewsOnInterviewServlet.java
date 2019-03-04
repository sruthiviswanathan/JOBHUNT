package com.zilker.onlinejobsearch.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zilker.onlinejobsearch.beans.Company;
import com.zilker.onlinejobsearch.beans.User;
import com.zilker.onlinejobsearch.delegate.CompanyDelegate;
import com.zilker.onlinejobsearch.delegate.UserDelegate;

/**
 * Servlet implementation class ReviewsOnInterviewServlet
 */
@WebServlet("/ReviewsOnInterviewServlet")
public class ReviewsOnInterviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewsOnInterviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession();
		if(session.getAttribute("email")==null){
			response.sendRedirect("index.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			int companyId=0;
				HttpSession session = request.getSession();
				String email = (String) session.getAttribute("email");
				User user= new User();
				user.setEmail(email);
			ArrayList<Company> interviewProcess = new ArrayList<Company>();	
			ArrayList<Company> companyDetails = new ArrayList<Company>();
			UserDelegate userDelegate = new UserDelegate();
			Company company = new Company();
			CompanyDelegate companyDelegate = new CompanyDelegate();
			String companyName = request.getParameter("company");
			
			company.setCompanyName(companyName);
			companyId = companyDelegate.fetchCompanyId(company);
			company.setCompanyId(companyId);
		
			companyDetails = companyDelegate.retrieveVacancyByCompany(company);
				
			for (Company j : companyDetails) {
				request.setAttribute("displayCompany", companyDetails);
			}
			
			interviewProcess = userDelegate.retrieveInterviewProcess(company);
			if (interviewProcess.isEmpty()) {
				request.setAttribute("noReviews", "yes");
			}
			for (Company j : interviewProcess) {
				request.setAttribute("displayInterviewProcess",interviewProcess);
			}
			getServletConfig().getServletContext().getRequestDispatcher("/Pages/jsp/interviewprocess.jsp").forward(request,response);
			}catch(Exception e) {
				request.setAttribute("exception",e);
				RequestDispatcher rd = request.getRequestDispatcher("Pages/jsp/error.jsp");
				rd.forward(request, response);
			}
	}

}

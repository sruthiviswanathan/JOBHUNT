package com.zilker.onlinejobsearch.servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zilker.onlinejobsearch.beans.Company;
import com.zilker.onlinejobsearch.beans.JobMapping;
import com.zilker.onlinejobsearch.beans.User;
import com.zilker.onlinejobsearch.delegate.CompanyDelegate;
import com.zilker.onlinejobsearch.delegate.JobDelegate;
import com.zilker.onlinejobsearch.delegate.UserDelegate;

/**
 * Servlet implementation class RateServlet
 */
@WebServlet("/RateServlet")
public class RateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RateServlet() {
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
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
			HttpSession session = request.getSession();
			String email = (String) session.getAttribute("email");
			User user= new User();
			user.setEmail(email);
			if(session.getAttribute("email")==null){
				response.sendRedirect("index.jsp");
			}
			String companyName = request.getParameter("companyname");
			
			request.setAttribute("companyname", companyName);
			RequestDispatcher rd = request.getRequestDispatcher("Pages/jsp/reviewandrating.jsp");
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
			int companyId=0,userId=0,jobId=0;
			HttpSession session = request.getSession();
			String email = (String) session.getAttribute("email");
			User user = new User();
			user.setEmail(email);
			Company company = new Company();
			JobMapping jobmapping = new JobMapping();
			UserDelegate userDelegate = new UserDelegate();
			JobDelegate jobDelegate = new JobDelegate();
			CompanyDelegate companyDelegate = new CompanyDelegate();
			String companyName = request.getParameter("company");
			String rating = request.getParameter("rating");
			String review = request.getParameter("review");
			company.setCompanyName(companyName);
			companyId = companyDelegate.fetchCompanyId(company);
			userId = userDelegate.fetchUserId(user);
			user.setUserId(userId);
			company.setCompanyId(companyId);
			company.setReview(review);
			company.setRating(Float.parseFloat(rating));
			
			if(userDelegate.reviewAndRateCompany(user, company)) {
				response.sendRedirect("Pages/jsp/findcompany.jsp");
			}else {
				response.sendRedirect("Pages/jsp/error.jsp");
			}
			String jobRole=request.getParameter("job");
			String interviewProcess= request.getParameter("interview");
			jobmapping.setJobRole(jobRole);
			jobId = jobDelegate.fetchJobId(jobmapping);
			jobmapping.setJobId(jobId);
			company.setInterviewProcess(interviewProcess);
			if(jobRole!="" && interviewProcess!="") {
				if(userDelegate.interviewProcess(user, company, jobmapping)) {
					
				}else {
					response.sendRedirect("Pages/jsp/error.jsp");
				}
			}
			
			
		} catch (Exception e) {
			request.setAttribute("exception",e);
			RequestDispatcher rd = request.getRequestDispatcher("Pages/jsp/error.jsp");
			rd.forward(request, response);
		}
	}

}

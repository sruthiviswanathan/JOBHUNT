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
import com.zilker.onlinejobsearch.beans.JobMapping;
import com.zilker.onlinejobsearch.beans.User;
import com.zilker.onlinejobsearch.delegate.CompanyDelegate;
import com.zilker.onlinejobsearch.delegate.JobDelegate;
import com.zilker.onlinejobsearch.delegate.UserDelegate;

/**
 * Servlet implementation class PostJobServlet
 */
@WebServlet("/PostJobServlet")
public class PostJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostJobServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			HttpSession session=request.getSession(); 
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
			if(session.getAttribute("email")==null){
				response.sendRedirect("index.jsp");
			}
			
			JobMapping jobMapping = new JobMapping();
			ArrayList<JobMapping> job = new ArrayList<JobMapping>();
			JobDelegate jobDelegate = new JobDelegate();
			job = jobDelegate.displayJobs(jobMapping);
			request.setAttribute("jobs", job); 
			RequestDispatcher rd = request.getRequestDispatcher("Pages/jsp/postjob.jsp");
			rd.forward(request, response);
			}catch(Exception e) {
				
			}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		try{
			HttpSession session = request.getSession();
			String email = (String) session.getAttribute("email");
			User user= new User();
			user.setEmail(email);
			if(session.getAttribute("email")==null){
				response.sendRedirect("index.jsp");
			}
			Company company = new Company();
			UserDelegate userDelegate = new UserDelegate();
			CompanyDelegate companyDelegate = new CompanyDelegate();
			JobMapping jobMapping = new JobMapping();
			JobDelegate jobDelegate = new JobDelegate();
			int userId=0,companyId=0,jobId=0;
			userId = userDelegate.fetchUserId(user);
			user.setUserId(userId);
			companyId = userDelegate.fetchCompanyIdByAdmin(user);
			String jobDesignation = request.getParameter("job");
			String location = request.getParameter("location");
			String salary = request.getParameter("salary");
			String count = request.getParameter("count");
			String description=request.getParameter("description");
			
			jobId = Integer.parseInt(jobDesignation);
			company.setCompanyId(companyId);
			company.setJobId(jobId);
			company.setLocation(location);
			company.setJobDescription(description);
			company.setSalary(Float.parseFloat(salary));
			company.setVacancyCount(Integer.parseInt(count));
			ArrayList<JobMapping> job = new ArrayList<JobMapping>();	
			job = jobDelegate.displayJobs(jobMapping);
			request.setAttribute("jobs", job); 
			if(companyDelegate.publishVacancy(company, user)) {
				request.setAttribute("jobPosted","yes");
				companyDelegate.compareVacancyWithRequest(company);
				RequestDispatcher rd = request.getRequestDispatcher("Pages/jsp/postjob.jsp");
				rd.forward(request, response);
			}else {
				response.sendRedirect("Pages/jsp/error.jsp");
			}
			
			
		}
		 catch (SQLIntegrityConstraintViolationException e) {
			 
			  request.setAttribute("jobPosted","no");
			  RequestDispatcher rd = request.getRequestDispatcher("Pages/jsp/postjob.jsp");
			  rd.forward(request, response);
			  
			  }
		
		
		catch(Exception e) {
			request.setAttribute("exception",e);
			RequestDispatcher rd = request.getRequestDispatcher("Pages/jsp/error.jsp");
			rd.forward(request, response);
		}
	}

}

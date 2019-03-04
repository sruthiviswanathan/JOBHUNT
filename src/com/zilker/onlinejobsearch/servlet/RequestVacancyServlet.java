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

import com.zilker.onlinejobsearch.beans.JobMapping;
import com.zilker.onlinejobsearch.beans.JobRequest;
import com.zilker.onlinejobsearch.beans.User;
import com.zilker.onlinejobsearch.delegate.JobDelegate;
import com.zilker.onlinejobsearch.delegate.UserDelegate;

/**
 * Servlet implementation class RequestVacancyServlet
 */
@WebServlet("/RequestVacancyServlet")
public class RequestVacancyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequestVacancyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			
			HttpSession session = request.getSession();
			String email = (String) session.getAttribute("email");
			User user= new User();
			user.setEmail(email);
			if(session.getAttribute("email")==null){
				response.sendRedirect("index.jsp");
			}
			
			JobMapping jobMapping = new JobMapping();
			ArrayList<JobMapping> job = new ArrayList<JobMapping>();
			JobDelegate jobDelegate = new JobDelegate();
			job = jobDelegate.displayJobs(jobMapping);
			request.setAttribute("jobs", job); 
			
			RequestDispatcher rd = request.getRequestDispatcher("Pages/jsp/requestvacancy.jsp");
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
			int jobId=0,userId=0;
			HttpSession session = request.getSession();
			String email = (String) session.getAttribute("email");
			User user= new User();
			UserDelegate userDelegate = new UserDelegate();
			JobRequest jobrequest = new JobRequest();
			
			user.setEmail(email);
			String jobDesignation = request.getParameter("job");
			String location = request.getParameter("location");
			String salary = request.getParameter("salary");
			jobrequest.setEmail(user.getEmail());
			
			jobId = Integer.parseInt(jobDesignation);
			jobrequest.setJobId(jobId);
			jobrequest.setLocation(location);
			jobrequest.setSalary(Float.parseFloat(salary));
			userId = userDelegate.fetchUserId(user);
			user.setUserId(userId);
			JobMapping jobMapping = new JobMapping();
			ArrayList<JobMapping> job = new ArrayList<JobMapping>();
			JobDelegate jobDelegate = new JobDelegate();
			job = jobDelegate.displayJobs(jobMapping);
			request.setAttribute("jobs", job); 
			if(userDelegate.requestNewVacancy(jobrequest, user)) {
				request.setAttribute("saved","yes");
				
				RequestDispatcher rd = request.getRequestDispatcher("Pages/jsp/requestvacancy.jsp");
				rd.forward(request, response);
			}else {
				response.sendRedirect("Pages/jsp/error.jsp");
			}
		}catch(Exception e) {
			request.setAttribute("exception",e);
			RequestDispatcher rd = request.getRequestDispatcher("Pages/jsp/error.jsp");
			rd.forward(request, response);
		}
	}

}

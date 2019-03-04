package com.zilker.onlinejobsearch.servlet;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

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
 * Servlet implementation class UpdateVacancyServlet
 */
@WebServlet("/UpdateVacancyServlet")
public class UpdateVacancyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateVacancyServlet() {
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
			
		int oldJobId=0,newJobId=0,userId=0,companyId=0;
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		User user= new User();
		user.setEmail(email);
		Company company = new Company();
		UserDelegate userDelegate = new UserDelegate();
		JobMapping jobMapping = new JobMapping();
		JobDelegate jobDelegate = new JobDelegate();
		CompanyDelegate companyDelegate = new CompanyDelegate();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();
		user.setCurrentTime(dtf.format(now));
		String action = request.getParameter("action");
		String jobDesignation = request.getParameter("jobdesignation");
		
		jobMapping.setJobRole(jobDesignation);
		oldJobId = jobDelegate.fetchJobId(jobMapping);
		userId = userDelegate.fetchUserId(user);
		user.setUserId(userId);
		companyId = userDelegate.fetchCompanyIdByAdmin(user);
		company.setCompanyId(companyId);
		if ("UPDATE".equals(action)) {
		
			company.setOldJobId(oldJobId);
			String newJobDesignation = request.getParameter("job");
		
			newJobId = Integer.parseInt(newJobDesignation);
			company.setJobId(newJobId);
			if(companyDelegate.updateVacancyJobId(company, user)) {
				request.setAttribute("status","updated");
				
			}
			
			String location = request.getParameter("location");
			company.setLocation(location);
			if(companyDelegate.updateVacancyLocation(company, user)) {
				request.setAttribute("status","updated");
			}
			
			String jobDescription = request.getParameter("description");
			company.setJobDescription(jobDescription);
			if(companyDelegate.updateVacancyDescription(company, user)) {
				request.setAttribute("status","updated");
			}
			
			String salary = request.getParameter("salary");
			company.setSalary(Float.parseFloat(salary));
			if(companyDelegate.updateVacancySalary(company, user)) {
				request.setAttribute("status","updated");
				
			}
			
			String count = request.getParameter("count");
			int vacancyCount = Integer.parseInt(count);
			company.setVacancyCount(vacancyCount);
			if (vacancyCount == 0) {
				company.setVacancyStatus("expired");
			} else {
				company.setVacancyStatus("available");
			}
			if(companyDelegate.updateVacancyCount(company, user)) {
				request.setAttribute("status","updated");
			}
		
		} else if ("DELETE".equals(action)) {
		   
			company.setJobId(oldJobId);
			if(companyDelegate.removeVacancy(company, user)) {
				request.setAttribute("status","deleted");
			}
			
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("ViewPublishedJobsServlet");
		rd.forward(request, response);
		}catch(Exception e) {
			request.setAttribute("exception",e);
			RequestDispatcher rd = request.getRequestDispatcher("Pages/jsp/error.jsp");
			rd.forward(request, response);
		}
	}

}

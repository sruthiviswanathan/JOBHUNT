package com.zilker.onlinejobsearch.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLIntegrityConstraintViolationException;

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
 * Servlet implementation class UpdateContactedUsersServlet
 */
@WebServlet("/UpdateContactedUsersServlet")
public class UpdateContactedUsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateContactedUsersServlet() {
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
		PrintWriter out = response.getWriter();
		try {
			response.setContentType("text/html;charset=UTF-8");
		
			int companyId=0,jobId=0,userId=0;
			Company company = new Company();
			JobMapping jobMapping = new JobMapping();
	
			UserDelegate userDelegate = new UserDelegate();
			JobDelegate jobDelegate = new JobDelegate();
			HttpSession session = request.getSession();
			String email = (String) session.getAttribute("email");
			User user= new User();
			user.setEmail(email);
			userId = userDelegate.fetchUserId(user);
			user.setUserId(userId);
			
			String location = request.getParameter("location");
			String emailId = request.getParameter("emailId");
			String jobDesignation = request.getParameter("job");
			
			companyId = userDelegate.fetchCompanyIdByAdmin(user);
			jobMapping.setJobRole(jobDesignation);
			jobId = jobDelegate.fetchJobId(jobMapping);
			company.setEmail(emailId);
			company.setCompanyId(companyId);
			company.setJobId(jobId);
			company.setLocation(location);
			
			if(userDelegate.markContacted(company,user)) {
				
				
				response.setContentType("application/json");
				out.print("success");
				out.flush();
			
			}else {
				
			}
		}
		
		
		
		
		catch(Exception e) {
			
		}
	}

}

package com.zilker.onlinejobsearch.servlet;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zilker.onlinejobsearch.beans.JobMapping;
import com.zilker.onlinejobsearch.beans.User;
import com.zilker.onlinejobsearch.delegate.JobDelegate;
import com.zilker.onlinejobsearch.delegate.UserDelegate;

/**
 * Servlet implementation class AddNewJobDesignationServlet
 */
@WebServlet("/AddNewJobDesignationServlet")
public class AddNewJobDesignationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddNewJobDesignationServlet() {
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
			HttpSession session = request.getSession();
			String email = (String) session.getAttribute("email");
			UserDelegate userDelegate = new UserDelegate();
			User user= new User();
			user.setEmail(email);
			int userId=0;
			userId = userDelegate.fetchUserId(user);
			user.setUserId(userId);
			String jobRole = request.getParameter("newjob");;
			JobDelegate jobDelegate = new JobDelegate();
			JobMapping jobmapping = new JobMapping();
			jobmapping.setJobRole(jobRole);
			if(jobDelegate.addNewJob(jobmapping, user)) {
				response.sendRedirect("PostJobServlet");
			}else {
				response.sendRedirect("Pages/jsp/error.jsp");
			}
			
		} catch (SQLException e) {
			
		}
	}

}

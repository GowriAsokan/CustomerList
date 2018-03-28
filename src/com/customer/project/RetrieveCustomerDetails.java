package com.customer.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.customer.project.PMF;
import com.google.gson.Gson;



public class RetrieveCustomerDetails extends HttpServlet {
	 protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		 
	     HttpSession session = req.getSession();
	    String custEmail = session.getAttribute("sessionEmail").toString();
	    System.out.println("Email :" + custEmail);
		PersistenceManager pm = PMF.get().getPersistenceManager();
		
		PrintWriter out = resp.getWriter();
		String output = "";
		
		Query q = pm.newQuery(StoreCustomerDetailsPojo.class);
		q.setFilter("CustomerEmail =='" + custEmail + "'");
		
		List<StoreCustomerDetailsPojo> result = (List<StoreCustomerDetailsPojo>) q.execute();
		
		System.out.println("no of list :" + result.size());
		
		Gson gson = new Gson();
		output = gson.toJson(result);

		
		out.write(output);
		// resp.getWriter().println("Hello, world1" + output);
 }

}

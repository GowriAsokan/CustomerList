package com.customer.project;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.ServletException;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.*;

import com.google.appengine.labs.repackaged.org.json.JSONObject;





@SuppressWarnings("serial")
public class StoreCustomerDetails extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws  IOException,ServletException{
	          
		resp.setContentType("text/plain");
		PrintWriter out = resp.getWriter();
		
		String custdetails = req.getParameter("data");
		System.out.println(custdetails);
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		HttpSession session = req.getSession();
		String customerEmail = session.getAttribute("sessionEmail").toString();
		
		System.out.println("inside  customer == " + customerEmail);
		
	try {
			JSONObject obj = new JSONObject(custdetails);
			String firstname = obj.get("firstname").toString();
			String lastname = obj.get("lastname").toString();
			String emailaddress = obj.get("emailaddress").toString();
			String phoneno = obj.get("phoneno").toString(); 
			String todolist = obj.get("todolist").toString();
			String id = obj.get("id").toString();
			
			
			Query q = pm.newQuery(StoreCustomerDetailsPojo.class);
			q.setFilter("customerKey =='" + id + "'");
			List<StoreCustomerDetailsPojo> result = (List<StoreCustomerDetailsPojo>) q.execute();

			if (!(result.isEmpty())) {
				StoreCustomerDetailsPojo details = pm.getObjectById(StoreCustomerDetailsPojo.class, result.get(0).getKey());
				//details = result.get(0);
				details.setCustomerEmail(customerEmail);
				details.setFirstname(firstname);
				details.setLastname(lastname);
				details.setEmailaddress(emailaddress);
				details.setPhoneno(phoneno);
				details.setList(todolist);
				details.setCustomerKey(id);
				out.print("success");
				pm.makePersistent(details);
			} else {
				
				StoreCustomerDetailsPojo details = new StoreCustomerDetailsPojo();
				
				details.setCustomerEmail(customerEmail);
				details.setFirstname(firstname);
				details.setLastname(lastname);
				details.setEmailaddress(emailaddress);
				details.setPhoneno(phoneno);
				details.setList(todolist);
				details.setCustomerKey(id);
				out.print("success");
				pm.makePersistent(details);
			}

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			pm.close();

		}
	
		
	}
}

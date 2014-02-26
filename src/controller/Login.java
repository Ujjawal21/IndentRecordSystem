package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.DBcon;
import beans.Store;
import businessLogic.PersonLogic;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PersonLogic person = new PersonLogic(request.getParameter("uid").toString(),request.getParameter("pass").toString());
		
		if(person.checkLoginCredentials()== "logged in"){
			
			if(request.getParameter("uid").toString().equals("store")){
				Store s = new Store();
				
				request.setAttribute("indentnumber", s.getNextIndentNumber());
				getServletContext().getRequestDispatcher("/Store.jsp").forward(request, response);
			}
			else if(request.getParameter("uid").toString().equals("admin")){
				
				response.sendRedirect("Director.html");
				
			}
			else if(request.getParameter("uid").toString().equals("office")){
				
				response.sendRedirect("Store.jsp");
				
			}
			
		}
		else{
			response.sendRedirect("Login.jsp");
		}
	}

}

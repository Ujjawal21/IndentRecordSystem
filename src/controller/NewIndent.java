package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.DBcon;

public class NewIndent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NewIndent() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			DBcon d = new DBcon();
			int row=0,rowcount=Integer.parseInt(request.getParameter("rows"));					//no of rows to be fetched here 
			Connection con = d.openConnection();
			PreparedStatement pstmt;
			String qry="insert into fctry_indent values(?,?,?,?,?)";
			PrintWriter out = response.getWriter();
			System.out.print(request.getParameter("indentnumber"));
			try {
				pstmt = d.getPreparedStatement(con, qry);
				
				pstmt.setInt(1,Integer.parseInt(request.getParameter("indentno").toString()));				//set indent number here
				pstmt.setDate(2, null);
				
				pstmt.setDate(3, null);															    	//set approval date
				
				pstmt.setString(4,request.getParameter("from"));		                      								  //factory name
				
				pstmt.setString (5, "PENDING");			          								      //indent status
				
				row=pstmt.executeUpdate();
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			qry="insert into indent_item values(?,?,?,?,?,?,?,?,?,?,?)";
			for(int i=1;i<=rowcount;i++){
				try {
					
					/*DateFormat df = DateFormat.getDateInstance(DateFormat.SHORT);
					Date date = (Date) df.parse(request.getParameter("required"+i).toString());
					*/
					pstmt = d.getPreparedStatement(con, qry);
					pstmt.setInt(1, Integer.parseInt(request.getParameter("indentno").toString()));
					pstmt.setString(2, request.getParameter("description"+i) );
					pstmt.setDate(3, getRequiredDate(request,i));
					pstmt.setString(4, request.getParameter("place"+i));		//change required in page
					pstmt.setInt(5, Integer.parseInt(request.getParameter("purchaseqty"+i)));
					pstmt.setInt(6, Integer.parseInt(request.getParameter("stockqty"+i)));
					pstmt.setInt(7, Integer.parseInt(request.getParameter("requiredqty"+i)));
					pstmt.setInt(8, Integer.parseInt(request.getParameter("unit"+i)));
					pstmt.setString(9, request.getParameter("remark"+i));
					pstmt.setString(10, "PENDING");
					pstmt.setString(11, request.getParameter("department"+i));
					row=pstmt.executeUpdate();
					System.out.println("indent_item"+row);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			
		response.sendRedirect("Store.jsp");	
			
	}
	
public java.sql.Date getRequiredDate(HttpServletRequest req,int i){
	
	String reqDate = req.getParameter("required"+i).toString();
	java.util.Date date = null;
	System.out.println(reqDate);
	
	// PARSING DATE TO STORE INTO THE DATA BASE (USE MM INSTEAD OF mm; mm COUNTS AS MINUT)
	
	try {
		date = (java.util.Date) new SimpleDateFormat("yyyy-MM-dd").parse(reqDate);
	} catch (ParseException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} 
	java.sql.Date sqlDate = new java.sql.Date(date.getTime()); 
	return sqlDate;
 }

}

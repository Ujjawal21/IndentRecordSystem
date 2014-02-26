package businessLogic;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import beans.DBcon;

public class PersonLogic {

	String uname,pass,result;
	Connection con;
	ResultSet rs;
	DBcon db;
	
	
	
	public PersonLogic(String uname,String pass){
		
		this.uname = uname;
		this.pass = pass;
		
	}

	public String toString(){
		return this.uname +" "+this.pass;
	}
//method to check login credentials
	public String checkLoginCredentials(){
		
		db = new DBcon();
		con = db.openConnection();
		
		try {
			rs = db.getDatabaseResult(con, "select * from user where name='"+ uname +"'");
			if(rs.next()){
				if(rs.equals(null)){
					
					result = "User name is wrong!";
					
				}
				
				else if (rs.getString("password").equals(pass)){
					
					result = "logged in";				
					
				}
				
				else result = "Password is wrong!";	
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return result;
	}
	
	
}

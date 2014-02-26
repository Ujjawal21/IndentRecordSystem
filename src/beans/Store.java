package beans;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Store {
	
	public int getNextIndentNumber(){
	int indntno = 0;
	DBcon d = new DBcon();
	String qry="SELECT INDENT_NO FROM  `fctry_indent`";
		try {
			ResultSet rs=d.getDatabaseResult(d.openConnection(), qry);
			while(rs.next()){
			indntno=rs.getInt(1)+1;}
		} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return indntno;
	}
}

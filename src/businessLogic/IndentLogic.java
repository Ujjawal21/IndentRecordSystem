package businessLogic;

import java.sql.ResultSet;
import java.sql.SQLException;

import beans.DBcon;

public class IndentLogic {

public String getPendingIndent(){
	String s="<table>";
	DBcon d = new DBcon();
	
	ResultSet rs= null, itemRs= null;
	try {
		rs = d.getDatabaseResult(d.openConnection(), "SELECT * FROM `fctry_indent` WHERE Indent_status='PENDING'");
	s+="";
	try {
		
		while (rs.next()){
			s+="<TR><TD>"+rs.getInt(1)+"</TD><TD>"+rs.getTimestamp(2)+"</TD><TD>"+rs.getString(4)+"</TD></TR>";
			itemRs = d.getDatabaseResult(d.openConnection(), "SELECT * FROM `indent_item` WHERE INDENT_NO='"+rs.getInt(1)+"'");
			while(itemRs.next()){
				
				s+="<TR><TD></TD><TD>"+itemRs.getString(2)+"</TD><TD>"+itemRs.getDate(3)+"</TD><TD>"+itemRs.getInt(7)+"</TD><TD>"+itemRs.getInt(6)+"</TD><TD>"+itemRs.getInt(5)+"</TD><TD>"+itemRs.getInt(8)+"</TD><TD>"+itemRs.getString(11)+"</TD><TD>"+itemRs.getString(4)+"</TD><TD>"+itemRs.getString(9)+"</TD></TR>";
				
			}
		}
		s+="</table>";
	} catch (SQLException e) {
		System.out.println(" "+e);
	}
	} catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	
	return s;
}

}

package beans;
import java.sql.*;

public class DBcon {
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	static final String DB_URL = "jdbc:mysql://localhost:3306/polybond";
	static final String USER = "root";
	static final String PASS = "";

    Connection con;
    PreparedStatement pstmt;
    ResultSet rs;
    public Connection openConnection(){
        try{
        	
        	Class.forName(JDBC_DRIVER);

            //STEP 3: Open a connection
            System.out.println("Connecting to database...");
            con = DriverManager.getConnection(DB_URL,USER,PASS);
            System.out.print("connection succesfull");
        }catch(SQLException s){
        System.out.println("SQL error"+s);
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
        	 System.out.println("Class not Found");
			e.printStackTrace();
		}
        
        return con;
    }
    
    public void closeConnection(){
        try{
        	System.out.print("closed");
            con.close();
        }catch(SQLException e){
        System.out.println("SQL error"+e);
        
        }
    }
    
    public ResultSet getDatabaseResult(Connection con,String qry)throws SQLException{
        this.con=con;
    	pstmt=con.prepareStatement(qry);
    	rs=pstmt.executeQuery();
        return rs;
    }
    
    public PreparedStatement getPreparedStatement(Connection con,String qry) throws SQLException{
    	this.con=con;
    	pstmt=con.prepareStatement(qry);
        return pstmt;
    }
        
    
}
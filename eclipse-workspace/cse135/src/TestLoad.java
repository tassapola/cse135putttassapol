import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import model.Applicant;
import model.Constants;


public class TestLoad {

	public TestLoad() throws Exception {
		Class.forName("org.postgresql.Driver");
		Connection con=DriverManager.getConnection("jdbc:postgresql://localhost/cse135?user=postgres&password=password");
		con.setAutoCommit(false);
		Statement stmt = con.createStatement();
		ResultSet app = stmt.executeQuery("select a.* from applicant a, users u where a.user_id = u.id and u.user_name = 'tor'");
		if (app.next()) {
			stmt.close();
			Applicant a = new Applicant();
			a.load(con, "tor");		
			System.out.println(a);
		}
		else {
			stmt.close();
		}
	}
	/**
	 * @param args
	 * @throws Exception 
	 */
	public static void main(String[] args) throws Exception {
		new TestLoad();
		
	}

}

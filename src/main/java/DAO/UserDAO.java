package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import BO.AddressBO;
import BO.RoleBO;
import Domain.Role;
import Domain.User;
import Utility.DBConnection;
public class UserDAO {
	public User validateLogin(String username,String password) throws ClassNotFoundException, SQLException{
        User user =null;
        Connection connection = DBConnection.getConnection();
        System.out.println(connection);
        PreparedStatement preparedStatement = connection.prepareStatement("select * from users where username = '"+username+"' and password = '"+password+"';");
        ResultSet rs = preparedStatement.executeQuery();
        RoleBO roleBO = new RoleBO();
        AddressBO addressBO = new AddressBO();
        if(rs.next()) {
            Role role = roleBO.findRoleById(rs.getInt("role_id"));
            user = new User(rs.getInt("id"), rs.getString("first_name"), rs.getString("last_name"),rs.getDate("dob"),rs.getInt("age"),rs.getString("contact_no"), rs.getString("email"),rs.getString("username"),rs.getString("password"), role);
            user.setAddressList(addressBO.findByUserId(user.getId()));
        }
        connection.close();
        return user;
    }
	
	public User findById(Integer id) throws ClassNotFoundException, SQLException {
		Connection con = DBConnection.getConnection();

         //fill your code here	
		// my code open ------------------------------------------
		 PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE id = ?");
		    ps.setInt(1, id);
		    ResultSet rs = ps.executeQuery();
		
		    RoleBO roleBO = new RoleBO();
		    AddressBO addressBO = new AddressBO();
		    
		    User user = null;
		    if (rs.next()) {
		        Role role = roleBO.findRoleById(rs.getInt("role_id"));
		        user = new User(
		            rs.getInt("id"),
		            rs.getString("first_name"),
		            rs.getString("last_name"),
		            rs.getDate("dob"),
		            rs.getInt("age"),
		            rs.getString("contact_no"),
		            rs.getString("email"),
		            rs.getString("username"),
		            rs.getString("password"),
		            role
		        ); user.setAddressList(addressBO.findByUserId(user.getId()));
		    }
		    
		    rs.close();
		    ps.close();
		    con.close();
		    
		    return user;
		    //my code closed ---------------------------------------------------------------
	}
	public boolean findUserByUsername(String username) throws ClassNotFoundException, SQLException {
		Connection con = DBConnection.getConnection();
		PreparedStatement ps = con.prepareStatement("select count(*) from users where username=?");
		
         //fill your code here
		//my code open--------------------------------------------------------
		 ps.setString(1, username);
		    ResultSet rs = ps.executeQuery();
		    
		    rs.next();
		    int count = rs.getInt(1);
		    
		    rs.close();
		    ps.close();
		    con.close();
		    
		    return count > 0;		
	   //mycode closed ----------------------------------------------------------
	}
	public Integer createUser(User user) throws SQLException, ClassNotFoundException {
		Connection con = DBConnection.getConnection();
		
        //fill your code here
//mycode open -------------------------------------------------------------------------
		 PreparedStatement ps = con.prepareStatement(
			        "INSERT INTO users (first_name, last_name, dob, age, contact_no, email, username, password, role_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)",
			        Statement.RETURN_GENERATED_KEYS
			    );
			    // Setting values to the prepared statement
			    ps.setString(1, user.getFirstName());
			    ps.setString(2, user.getLastName());
			    ps.setDate(3, new java.sql.Date(user.getDob().getTime()));
			    ps.setInt(4, user.getAge());
			    ps.setString(5, user.getContactNo());
			    ps.setString(6, user.getEmail());
			    ps.setString(7, user.getUsername());
			    ps.setString(8, user.getPassword());
			    ps.setInt(9, user.getRole().getId());
			    
			    ps.executeUpdate();
			    
			    // Retrieve the generated key (user ID)
			    ResultSet rs = ps.getGeneratedKeys();
			    Integer userId = null;
			    if (rs.next()) {
			        userId = rs.getInt(1);
			    }
			    
			    rs.close();
			    ps.close();
			    con.close();
			    
			    return userId;
	//mycode closed		---------------------------------------------------------------------------    
	}
	public void updateContactDetail(User user) throws SQLException, ClassNotFoundException{
		Connection con = DBConnection.getConnection();
		Statement stmt = con.createStatement();


          //fill your code here
		// mycode open------------------------------------------------------------------------
		 PreparedStatement ps = con.prepareStatement("UPDATE users SET contact_no = ?, email = ? WHERE id = ?");
		    
		    ps.setString(1, user.getContactNo());
		    ps.setString(2, user.getEmail());
		    ps.setInt(3, user.getId());
		    
		    ps.executeUpdate();
		    
		    ps.close();
		    con.close();
		con.close();
		//mycode closed-------------------------------------------------------------------------------
	}
//code is this function by own -----------------------------------------------------------
	public void updateProfile(User user) throws SQLException, ClassNotFoundException{
		 // Prepare an SQL statement to update the user's profile
		Connection con = DBConnection.getConnection();
		Statement stmt = con.createStatement();

	    PreparedStatement ps = con.prepareStatement(
	        "UPDATE users SET first_name = ?, last_name = ?, dob = ?, age = ?, contact_no = ?, email = ? WHERE id = ?"
	    );
	    
	    // Set the parameters in the prepared statement with the values from the user object
	    ps.setString(1, user.getFirstName());
	    ps.setString(2, user.getLastName());
	    ps.setDate(3, new java.sql.Date(user.getDob().getTime())); // Convert the java.util.Date to java.sql.Date
	    ps.setInt(4, user.getAge());
	    ps.setString(5, user.getContactNo());
	    ps.setString(6, user.getEmail());
	    ps.setInt(7, user.getId());
	    
	    // Execute the update query
	    ps.executeUpdate();
	    
	    // Close the resources
	    ps.close();
	    con.close();
	}
}

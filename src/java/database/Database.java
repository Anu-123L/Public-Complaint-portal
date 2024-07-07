/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
*/
package database;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
public class Database
{
    Connection con;
    PreparedStatement pst;
    ResultSet rs;
    public Database() throws SQLException
    {
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/arvi22_public","root","agb");
            System.out.println("connetion success.....");
            
        }
        catch (ClassNotFoundException e)
        {
            System.out.println("exception : "+e);
        }
    }
    public int checkAdminLogin(String uname,String pwd)
    {
        try {
            pst=con.prepareStatement("select * from admin where username=? and password=?");
            pst.setString(1, uname); //this replaces the 1st  "?" in the query for username
            pst.setString(2, pwd);    //this replaces the 2st  "?" in the query for password
            //executes the prepared statement
            rs=pst.executeQuery();
            if(rs.next()){
                return rs.getInt("id");
            }else{
                return 0;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return 0;
        }
    }
    
    public int checkUserLogin(String uname,String pwd)
    {
        try {
            pst=con.prepareStatement("select * from customers where username=? and password=? and status=1");
            pst.setString(1, uname); //this replaces the 1st  "?" in the query for username
            pst.setString(2, pwd);    //this replaces the 2st  "?" in the query for password
            //executes the prepared statement
            rs=pst.executeQuery();
            if(rs.next()){
                return rs.getInt("id");
            }else{
                return 0;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return 0;
        }
    }
    
    //ip:username,password
    //return boolean
    public int checkDeptLogin(String uname,String pwd)
    {
        try {
            pst=con.prepareStatement("select * from departments where username=? and password=?");
            pst.setString(1, uname); //this replaces the 1st  "?" in the query for username
            pst.setString(2, pwd);    //this replaces the 2st  "?" in the query for password
            //executes the prepared statement
            rs=pst.executeQuery();
            if(rs.next()){
                return rs.getInt("id");
            }else{
                return 0;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return 0;
        }
    }
    
    public ResultSet getDepartments()
    {
        try {
            pst=con.prepareStatement("select * from departments order by id desc");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getCustomers()
    {
        try {
            pst=con.prepareStatement("select * from customers order by id desc");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    public ResultSet getCustomerById(int cid)
    {
        try {
            pst=con.prepareStatement("select * from customers where id="+cid);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
 
    
    public ResultSet getComplaintById(int id)
    {
        try {
            pst=con.prepareStatement("select * from complaints where id="+id);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getComplaintsByDeptid(int id)
    {
        try {
            pst=con.prepareStatement("select * from complaints where department_id="+id);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getComplaintsByUserid(int id)
    {
        try {
            pst=con.prepareStatement("select * from complaints where customer_id="+id);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
        
    public ResultSet getComplaints()
    {
        try {
            pst=con.prepareStatement("select * from complaints order by id desc");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getNews()
    {
        try {
            pst=con.prepareStatement("select * from news order by id desc");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getNewsById(int did)
    {
        try {
            pst=con.prepareStatement("select * from news where id="+did);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getDepartmentById(int did)
    {
        try {
            pst=con.prepareStatement("select * from departments where id="+did);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
     
      public ResultSet selectAll(String query)
    {
        try {
            pst=con.prepareStatement(query);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    
    public boolean delete(String tab,int id){
        try {
            pst=con.prepareStatement("delete from "+tab+" where id="+id);
            //executes the prepared statement
            int n=pst.executeUpdate();
            System.out.println(n);
            if(n==1)
            {
                return true;
            }else{
                return false;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
        
    }
    
    public static String getRandomNumberString() {
        // It will generate 6 digit random Number.
        // from 0 to 999999
        Random rnd = new Random();
        int number = rnd.nextInt(999999);

        // this will convert any number sequence into 6 character.
        return String.format("%06d", number);
    }
     
     public int update_delete(String sql){
        try {
            pst=con.prepareStatement(sql);
            //executes the prepared statement
            int n=pst.executeUpdate();
            if(n==1)
            {
                return 1;
            }else{
                return 0;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return 2;
        }
    }
     
    
    public boolean updateStatus(int id,int status,String tab){
        try {
            pst=con.prepareStatement("update "+tab+" set status="+status+" where id="+id);
            //executes the prepared statement
            int n=pst.executeUpdate();
            if(n==1)
            {
                return true;
            }else{
                return false;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
    }
}


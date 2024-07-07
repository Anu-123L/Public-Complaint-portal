
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.Database"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.InputStream"%>
<%
    Database db=new Database();
//    sendSMS sms=new sendSMS();
    String action=request.getParameter("action");
    System.out.println(action);
    switch(action){
        case "deptlogin":
            try{
            String username=request.getParameter("uname");
            String password=request.getParameter("pass");       
                int stch=db.checkDeptLogin(username, password);
                if(stch>0){
                   session.setAttribute("deptlogin",stch);
                    response.sendRedirect("../department-home.jsp"); 
                }else{
                    response.sendRedirect("../department-login.jsp?status=0");
                }
            }
            catch(Exception e){
                response.sendRedirect("../department-login.jsp?status=0");
            }
            break;
        case "adminlogin":
            String username1=request.getParameter("uname");
            String password1=request.getParameter("pass");            
            int resuser1=db.checkAdminLogin(username1, password1);
            if(resuser1>0){
                session.setAttribute("adminlogin","admin");
                response.sendRedirect("../admin-home.jsp");
            }else{
                
                response.sendRedirect("../admin-login.jsp?status=0");
            }
            break;
        case "login":
            String lusername1=request.getParameter("uname");
            String lpassword1=request.getParameter("pass");            
            int lresuser1=db.checkUserLogin(lusername1, lpassword1);
            if(lresuser1>0){
                System.out.println(lresuser1);
                session.setAttribute("userlogin",lresuser1);
                response.sendRedirect("../index.jsp");
            }else{
                
                response.sendRedirect("../login.jsp?status=0");
            }
            break;
        case "addDepartment":
            String name=request.getParameter("name");
            String address=request.getParameter("address"); 
            String mobile=request.getParameter("mobile"); 
            String head=request.getParameter("head");
            String usernamed=request.getParameter("username");
            String passwordd=request.getParameter("password");
            int resuserpro=db.update_delete("insert into departments (name,address,mobile,head,username,password) VALUES ('"+name+"','"+address+"','"+mobile+"','"+head+"','"+usernamed+"','"+passwordd+"')");
            if(resuserpro>0){
                response.sendRedirect("../admin-departments.jsp?status=1");
            }else{
                response.sendRedirect("../admin-department-add.jsp?status=0");
            }
            break;
        case "editDepartment":
            String dname=request.getParameter("name");
            String daddress=request.getParameter("address"); 
            String dmobile=request.getParameter("mobile"); 
            String dhead=request.getParameter("head"); 
            String edid=request.getParameter("id");
            int eresuserpro=db.update_delete("update departments set name='"+dname+"',address='"+daddress+"',mobile='"+dmobile+"',head='"+dhead+"' where id="+edid);
            if(eresuserpro>0){
                response.sendRedirect("../admin-departments.jsp?status=2");
            }else{
                response.sendRedirect("../admin-department-edit.jsp?id="+edid+"&status=0");
            }
            break;
        case "addNews":
            String title=request.getParameter("title");
            String description=request.getParameter("description");
            int news=db.update_delete("insert into news (title,description) VALUES ('"+title+"','"+description+"')");
            if(news>0){
                response.sendRedirect("../admin-news.jsp?status=1");
            }else{
                response.sendRedirect("../admin-news-add.jsp?status=0");
            }
            break;
        case "editNews":
            String etitle=request.getParameter("title");
            String edescription=request.getParameter("description");
            String newsid=request.getParameter("id");
            int editnews=db.update_delete("update news set title='"+etitle+"',description='"+edescription+"' where id="+newsid);
            if(editnews>0){
                response.sendRedirect("../admin-news.jsp?status=2");
            }else{
                response.sendRedirect("../admin-news-edit.jsp?id="+newsid+"&status=0");
            }
            break;
        case "delete":
            String table=request.getParameter("table");
            String did=request.getParameter("id");
            boolean dreds=db.delete(table,Integer.parseInt(did));
            if(dreds){
                if(table.equals("departments")){
                    response.sendRedirect("../admin-departments.jsp?status=10");
                }else if(table.equals("customers")){
                    response.sendRedirect("../admin-customers.jsp?status=20");
                }else if(table.equals("news")){
                    response.sendRedirect("../admin-news.jsp?status=10");
                }else if(table.equals("complaints")){
                    response.sendRedirect("../complaints.jsp?status=10");
                }else if(table.equals("expenses")){
                    response.sendRedirect("../manager-expenses.jsp?status=50");
                }
                
            }else{
                response.sendRedirect("../admin-notifications.jsp?status=0");
            }
            break;
          case "deleteother":
            String table1=request.getParameter("table");
            String did1=request.getParameter("id");
            boolean dreds1=db.delete(table1,Integer.parseInt(did1));
            if(dreds1){
                if(table1.equals("complaints")){
                    response.sendRedirect("../department-home.jsp?status=30");
                }else if(table1.equals("customers")){
                    response.sendRedirect("../admin-customers.jsp?status=20");
                }
                
            }else{
                response.sendRedirect("../department-home.jsp?status=0");
            }
            break;
          case "addCustomer":
            String cname=request.getParameter("name");
            String email=request.getParameter("email");
            String state=request.getParameter("state");
            String caddress=request.getParameter("address");
            String district=request.getParameter("district");
            String city=request.getParameter("city");
            String cmobile=request.getParameter("mobile");
            String dob=request.getParameter("dob");
            String pincode=request.getParameter("pincode");
            String postoffice=request.getParameter("postoffice");
            String username=request.getParameter("username");
            String gender=request.getParameter("gender");
            String password=request.getParameter("password");
            String cconfpassword=request.getParameter("confpassword");
            
            int fres=db.update_delete("insert into customers (name,address,mobile,dob,gender,state,district,city,pincode,post_office,username,password,status) "
                    + "VALUES ('"+cname+"','"+caddress+"',"+cmobile+",'"+dob+"','"+gender+"','"+state+"','"+district+"','"+city+"','"+pincode+"','"+postoffice+"','"+username+"','"+password+"',0)");
            if(fres>0){
                response.sendRedirect("../register.jsp?status=1");
            }else{
                response.sendRedirect("../register.jsp?status=0");
            }
            break;
        case "updateCustomer":
            int sid=(Integer)session.getAttribute("userlogin");
            String sfname=request.getParameter("name");
            String sfaddress=request.getParameter("address");
            String ustate=request.getParameter("state");
            String udistrict=request.getParameter("district");
            String ucity=request.getParameter("city");
            String upincode=request.getParameter("pincode");
            String upostoffice=request.getParameter("postoffice");
            String udob=request.getParameter("dob");
            String umobile=request.getParameter("mobile");
            String sfgender=request.getParameter("gender");
            int semin=db.update_delete("update customers set name='"+sfname+"',state='"+ustate+"',district='"+udistrict+"',city='"+ucity+"',pincode='"+upincode+"',post_office='"+upostoffice+"',dob='"+udob+"',address='"+sfaddress+"',mobile='"+umobile+"',gender='"+sfgender+"' where id="+sid);
            if(semin>0){
                response.sendRedirect("../profile.jsp?status=1");
            }else{
                response.sendRedirect("../profile.jsp?status=0");
            }
            break;
        case "changepass":
            String currpass=request.getParameter("currpass"); 
            String npwd=request.getParameter("newpass");
            String confpass=request.getParameter("confpass");
            if(confpass.equals(npwd)){
                int userpro=db.update_delete("update admin set password='"+npwd+"' where password='"+currpass+"'");
                if(userpro==1){
                    response.sendRedirect("../admin-password.jsp?status=11");
                }else{
                    response.sendRedirect("../admin-password.jsp?status=22");
                }
            }else{
                response.sendRedirect("../admin-password.jsp?status=33");
            }
            break;
          case "changestatus":
            String chstatus=request.getParameter("status"); 
            String mid=request.getParameter("id");
               
                int userpro1=db.update_delete("update complaints set status="+chstatus+" where id="+Integer.parseInt(mid));
                if(userpro1==1){
                    response.sendRedirect("../dept-complaint-details.jsp?id="+mid+"&status=33");
                }else{
                    response.sendRedirect("../dept-complaint-details.jsp?id="+mid+"&status=0");
                }
            break;
          case "changedeptpass":
            String fcurrpass=request.getParameter("currpass"); 
            String fnpwd=request.getParameter("newpass");
            String fconfpass=request.getParameter("confpass");
            int fuselogid=(Integer)session.getAttribute("deptlogin");
                if(fconfpass.equals(fnpwd)){
                int userpro=db.update_delete("update departments set password='"+fnpwd+"' where password='"+fcurrpass+"' and id="+fuselogid);
                if(userpro==1){
                    response.sendRedirect("../dept-password.jsp?status=11");
                }else{
                    response.sendRedirect("../dept-password.jsp?status=22");
                }
            }else{
                response.sendRedirect("../dept-password.jsp?status=33");
            }
            break;
       case "editDept":
            String udname=request.getParameter("name");
            String udaddress=request.getParameter("address"); 
            String udmobile=request.getParameter("mobile"); 
            String udhead=request.getParameter("head"); 
            int logid=(Integer)session.getAttribute("deptlogin");
            int updept=db.update_delete("update departments set name='"+udname+"',address='"+udaddress+"',mobile='"+udmobile+"',head='"+udhead+"' where id="+logid);
            if(updept>0){
                response.sendRedirect("../dept-profile.jsp?status=1");
            }else{
                response.sendRedirect("../dept-profile.jsp?status=0");
            }
            break;
        case "updatecomplaint":
            String department_id=request.getParameter("department_id");
            String reason=request.getParameter("reason");
            String info=request.getParameter("info");
            String against=request.getParameter("against");
            String epdid=request.getParameter("id");
            int ferespatipro=db.update_delete("update complaints set department_id='"+department_id+"',reason='"+reason+"',"
                    + "info='"+info+"',against='"+against+"' where id="+epdid);
            if(ferespatipro>0){
                response.sendRedirect("../complaint-edit.jsp?id="+epdid+"&status=2");
            }else{
                response.sendRedirect("../complaint-edit.jsp?id="+epdid+"&status=0");
            }
            break;
       
    }
    %>

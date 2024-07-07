<%@page import="database.Database"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <meta http-equiv="X-UA-Compatible" content="IE=edge">

  <title>Public Complaint Management System</title>

  <link rel="stylesheet" href="website/assets/css/bootstrap.css">
  
  <link rel="stylesheet" href="website/assets/css/maicons.css">

  <link rel="stylesheet" href="website/assets/vendor/animate/animate.css">

  <link rel="stylesheet" href="website/assets/vendor/owl-carousel/css/owl.carousel.css">

  <link rel="stylesheet" href="website/assets/vendor/fancybox/css/jquery.fancybox.css">

  <link rel="stylesheet" href="website/assets/css/theme.css">

</head>
<body>
<%@ include file="includes/header.jsp" %>
  <main>
    <div class="page-section">
      <div class="container">
        <div class="text-center"><br><br><br><br>
          <h2 class="title-section mb-3">My Complaints</h2>
          
        </div>
        <div class="row mt-5">
            
          <div class="col-lg-8">
              <h2 class="title-section mb-3">Complaints</h2>
              <center>
                  <%
  try{
                  String status=" ";
              status=request.getParameter("status");
                                  if(status.equals("10"))
                                  {
                                      out.println("<div class='label label-success' style='font-size: 15px;'>Complaint deleted successful!</div>");
                                  }
           }
  catch(Exception e){}
  
                Database db=new Database();
                                        int id=(Integer)session.getAttribute("userlogin");
                                        ResultSet rs=db.getComplaintsByUserid(id);
                                        
                  %>
              </center>
              <div class="card-blog">
                      <div class="body">
                          <table class="table align-items-center mb-0">
                  <thead>
                    <tr>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Sr.No.</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Department</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Against</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Status</th>
                      <th class="text-secondary opacity-7">Action</th>
                    </tr>
                  </thead>
                  <tbody>
                          <% 
                              try{
                                       int j=1;
                              while(rs.next()){ %>
                           <tr>
                      <td>
                        <div class="d-flex px-2 py-1">
                          
                          <div class="d-flex flex-column justify-content-center">
                            <h6 class="mb-0 text-sm"><%=j%></h6>
                          </div>
                        </div>
                      </td>
                     
                      <td class="align-middle text-center">
                          <% ResultSet dept= db.getDepartmentById(rs.getInt("department_id")); %>
                          <h6 class="mb-0 text-sm"><% if(dept.next()){ out.println(dept.getString("name")); }%></h6>
                      </td>
                      <td class="align-middle text-center">
                          <h6 class="mb-0 text-sm"><%=rs.getString("against")%></h6>
                      </td>
                      <td class="align-middle text-center">
                          <h6 class="mb-0 text-sm"><%
                              if(rs.getInt("status")==0){
                                  %>
                                  <label style="color:red">Pending</label>
                                  <%
                              }else if(rs.getInt("status")==1){
                                %>
                                  <label style="color:orange">Processing</label>
                                  <%
                                }else if(rs.getInt("status")==2){
                                %>
                                  <label style="color:green">Close</label>
                                  <%
                                }
                              %></h6>
                      </td>
                      
                   
                      <td class="align-middle">
                          <% if(rs.getInt("status")==0){ %>
                        <form class="row login_form" action="includes/WebService.jsp" onsubmit="return confirm('Are you sure?');" method="post" >
                            <input type="hidden" name="action" value="delete"/>
                            <input type="hidden" name="id" value="<%=rs.getInt("id")%>"/>
                            <input type="hidden" name="table" value="complaints"/>
                            <a href="complaint-edit.jsp?id=<%=rs.getString("id")%>" style="width:auto" class="btn btn-info btn-sm" data-toggle="tooltip" data-original-title="Edit user">
                                Edit
                              </a> 
                            <button type="submit" class="btn btn-danger btn-sm" style="width:auto" >Delete</button>
                        </form>
                                <% } %>
                      </td>
                    </tr>
                         <%
                                         j++;
                                        }
                                     }catch(Exception e){

                                     }
                    %>
                  </tbody>
                          </table>
                      </div>
              </div>
          </div>
              
              <div class="col-lg-4">
              <h2 class="title-section mb-3 text-center">Add Complaint</h2>
              <center>
                  <%
  try{
                  String status=" ";
              status=request.getParameter("status");
                                  if(status.equals("11"))
                                  {
                                      out.println("<div class='label label-success' style='font-size: 15px;'>Complaint added successfully!</div>");
                                  }
           }
  catch(Exception e){}
                  %>
              </center>
              <div class="card-blog">
                      <div class="body">
                          <% if(request.getParameter("reason")==null){ %>
                          <form class="" action="" method="get" >
                           <div class="row">
                             <div class="col-sm-12 py-2">
                               <label for="name" class="fg-grey">Department</label>
                               <select required class="form-control" name="department_id">
                                   <% ResultSet res=db.getDepartments();
                                   while(res.next()){
                                   %>
                                   <option value="<%=res.getInt("id")%>"><%=res.getString("name")%></option>
                                   <% } %>
                               </select>
                             </div>
                               <div class="col-sm-12 py-2">
                               <label for="name" class="fg-grey">Reason</label>
                               <textarea class="form-control" name="reason" required placeholder="Wrire your reason"></textarea>
                             </div>

                             <div class="col-sm-12 py-2">
                               <label for="email" class="fg-grey">Against</label>
                               <input type="text" class="form-control" name="against" required placeholder="Against">
                             </div>
                             <div class="col-sm-12 py-2">
                               <label for="name" class="fg-grey">Info</label>
                               <textarea class="form-control" name="info" required placeholder="Wrire info"></textarea>
                             </div>
                         
                             <div class="col-12 mt-3">
                               <button type="submit" class="btn btn-primary px-5">Select File</button>
                             </div>
                           </div>
                         </form>
                                   <% } if(request.getParameter("reason")!=null){ %>
                               <form class="" action="includes/uploadComplaintFile.jsp?id=<%=session.getAttribute("userlogin")%>&deptid=<%=request.getParameter("department_id")%>&reason=<%=request.getParameter("reason")%>&against=<%=request.getParameter("against")%>&info=<%=request.getParameter("info")%>" method="post" enctype="multipart/form-data" >
                                    <input type="hidden" name="action" value="addcomplaint"/>
                                    <div class="col-sm-12 py-2">
                                        <label for="name" class="fg-grey">Document</label>
                                        <input type="file" class="form-control" name="file" required >
                                      </div>
                                    <div class="col-12 mt-3">
                               <button type="submit" class="btn btn-primary px-5">Submit</button>
                             </div>
                               </form>
                               <% } %>
                      </div>
              </div>
          </div>
        </div>
      </div> <!-- .container -->
    </div> <!-- .page-section -->
  </main>
<%@ include file="includes/footer.jsp" %>
  
<script src="website/assets/js/jquery-3.5.1.min.js"></script>

<script src="website/assets/js/bootstrap.bundle.min.js"></script>

<script src="website/assets/vendor/owl-carousel/js/owl.carousel.min.js"></script>

<script src="website/assets/vendor/wow/wow.min.js"></script>

<script src="website/assets/vendor/fancybox/js/jquery.fancybox.min.js"></script>

<script src="website/assets/vendor/isotope/isotope.pkgd.min.js"></script>

<script src="website/assets/js/google-maps.js"></script>

<script src="website/assets/js/theme.js"></script>

</body>
</html>
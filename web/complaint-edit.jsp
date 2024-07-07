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
              <%  Database db=new Database(); %>
              <% 
                                       int id=Integer.parseInt(request.getParameter("id"));
                                       ResultSet rs=db.getComplaintById(id);
                                   while(rs.next()){
                                   %>
              <div class="col-lg-6">
              <h2 class="title-section mb-3 text-center">Edit Complaint</h2>
              <center>
                  <%
  try{
                  String status=" ";
              status=request.getParameter("status");
                                  if(status.equals("2"))
                                  {
                                      out.println("<div class='label label-success' style='font-size: 15px;'>Complaint updated successfully!</div>");
                                  }
           }
  catch(Exception e){}
 
                  %>
              </center>
              <div class="card-blog">
                      <div class="body">
                          
                          <form class="" action="includes/WebService.jsp" method="post" >
                              <input type="hidden" value="updatecomplaint" name="action"/>
                              <input type="hidden" value="<%=id%>" name="id"/>
                           <div class="row">
                             <div class="col-sm-12 py-2">
                               <label for="name" class="fg-grey">Department</label>
                               <select required class="form-control" name="department_id">
                                   <% ResultSet res=db.getDepartments();
                                   while(res.next()){
                                   %>
                                   <option value="<%=res.getInt("id")%>" <% if(res.getInt("id")==rs.getInt("department_id")){ out.println("selected"); } %>><%=res.getString("name")%></option>
                                   <% } %>
                               </select>
                             </div>
                               <div class="col-sm-12 py-2">
                               <label for="name" class="fg-grey">Reason</label>
                               <textarea class="form-control" name="reason" required placeholder="Wrire your reason"><%=rs.getString("reason")%></textarea>
                             </div>

                             <div class="col-sm-12 py-2">
                               <label for="email" class="fg-grey">Against</label>
                               <input type="text" class="form-control" name="against" value="<%=rs.getString("against")%>" required placeholder="Against">
                             </div>
                             <div class="col-sm-12 py-2">
                               <label for="name" class="fg-grey">Info</label>
                               <textarea class="form-control" name="info" required placeholder="Wrire info"><%=rs.getString("info")%></textarea>
                             </div>
                         
                             <div class="col-12 mt-3">
                               <button type="submit" class="btn btn-primary px-5">Update</button>
                             </div>
                           </div>
                         </form>
                                   
                              
                      </div>
              </div>
          </div>
            <div class="col-lg-6">
              <h2 class="title-section mb-3 text-center">Edit Document</h2>
              <center>
                  <%
  try{
                  String status=" ";
              status=request.getParameter("status");
                                  if(status.equals("22"))
                                  {
                                      out.println("<div class='label label-success' style='font-size: 15px;'>Document updated successfully!</div>");
                                  }
           }
  catch(Exception e){}
 
                  %>
              </center>
              <div class="card-blog">
                      <div class="body">
                          <% if(rs.getString("document")!=null){ %>
                          <center><a href="uploads/complaints/<%=rs.getString("document")%>" style="width:200px" target="_blank">View Document</a></center><br>
                                            <% } %>
                           <form class="" action="includes/uploadComplaintFileupdate.jsp?id=<%=id%>" method="post" enctype="multipart/form-data" >
                                    <div class="col-sm-12 py-2">
                                        <label for="name" class="fg-grey">Document</label>
                                        <input type="file" class="form-control" name="file" required >
                                      </div>
                                    <div class="col-12 mt-3">
                               <button type="submit" class="btn btn-primary px-5">Update</button>
                             </div>
                               </form>
                               
                      </div>
              </div>
            </div>
                     <% } %> 
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
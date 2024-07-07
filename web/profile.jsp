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
          <h2 class="title-section mb-3">My Profile</h2>
          
        </div>
        <div class="row mt-5">
            
          <div class="col-lg-6">
              <h2 class="title-section mb-3 text-center">Update Profile</h2>
              <center>
                  <%
  try{
                  String status=" ";
              status=request.getParameter("status");
                                  if(status.equals("1"))
                                  {
                                      out.println("<div class='label label-success' style='font-size: 15px;'>Customer profile updated successful!</div>");
                                  }
           }
  catch(Exception e){}
  
                Database db=new Database();
                                        int id=(Integer)session.getAttribute("userlogin");
                                        ResultSet rs=db.getCustomerById(id);
                                        rs.next();
                  %>
              </center>
              <div class="card-blog">
                      <div class="body">
            <form class="" action="includes/WebService.jsp" method="post" >
                       <input type="hidden" name="action" value="updateCustomer"/>
              <div class="row">
                <div class="col-sm-6 py-2">
                  <label for="name" class="fg-grey">Username</label>
                  <input type="text" class="form-control" readonly value="<%=rs.getString("username")%>" placeholder="Enter username..">
                </div>
                  <div class="col-sm-6 py-2">
                  <label for="name" class="fg-grey">Name</label>
                  <input type="text" class="form-control" name="name" value="<%=rs.getString("name")%>" required placeholder="Enter name..">
                </div>
                
                <div class="col-sm-6 py-2">
                  <label for="email" class="fg-grey">State</label>
                  <input type="text" class="form-control" name="state" value="<%=rs.getString("state")%>" required placeholder="State">
                </div>
                <div class="col-sm-6 py-2">
                  <label for="email" class="fg-grey">Address</label>
                  <input type="text" class="form-control" name="address" value="<%=rs.getString("address")%>" required placeholder="Address">
                </div>
                <div class="col-sm-6 py-2">
                  <label for="email" class="fg-grey">District</label>
                  <input type="text" class="form-control" name="district" value="<%=rs.getString("district")%>" required placeholder="District">
                </div>
                <div class="col-sm-6 py-2">
                  <label for="email" class="fg-grey">Mobile No.</label>
                  <input type="text" class="form-control" name="mobile" value="<%=rs.getString("mobile")%>" required placeholder="Mobile no.">
                </div>
                <div class="col-sm-6 py-2">
                  <label for="email" class="fg-grey">City</label>
                  <input type="text" class="form-control" name="city" value="<%=rs.getString("city")%>" required placeholder="City">
                </div>
                <div class="col-sm-6 py-2">
                  <label for="email" class="fg-grey">Date of birth</label>
                  <input type="date" class="form-control" name="dob" value="<%=rs.getString("dob")%>" required placeholder="Date of birth">
                </div>
                <div class="col-sm-6 py-2">
                  <label for="email" class="fg-grey">Pincode</label>
                  <input type="text" class="form-control" name="pincode" value="<%=rs.getString("pincode")%>" required placeholder="Pincode">
                </div>
                <div class="col-sm-6 py-2">
                  <label for="email" class="fg-grey">Post office</label>
                  <input type="text" class="form-control" name="postoffice" value="<%=rs.getString("post_office")%>" required placeholder="Post office">
                </div>
                  <div class="col-sm-6 py-2">
                  <label for="email" class="fg-grey">Gender</label><br>
                  <label><input type="radio" class="" name="gender" <% if(rs.getString("gender").equals("Male")){ out.println("checked"); } %> value="Male"> Male</label>
                  <label><input type="radio" class="" name="gender" <% if(rs.getString("gender").equals("Female")){ out.println("checked"); } %> value="Female"> Female</label>
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
              <h2 class="title-section mb-3 text-center">Upload ID Proof</h2>
              <center>
                  <%
  try{
                  String status=" ";
              status=request.getParameter("status");
                                  if(status.equals("11"))
                                  {
                                      out.println("<div class='label label-success' style='font-size: 15px;'>Id proof updated successfully!</div>");
                                  }
           }
  catch(Exception e){}
                  %>
              </center>
              <div class="card-blog">
                      <div class="body">
                          <% if(rs.getString("id_proof")!=null){ %>
                                            <center><img src="uploads/<%=rs.getString("id_proof")%>" style="width:200px"></center><br>
                                            <% } %>
                          <form enctype="multipart/form-data" action="includes/uploadFile.jsp?id=<%=session.getAttribute("userlogin")%>" method="post" >
                            <div class="row">
                              <div class="col-sm-6 py-2">
                                <label for="name" class="fg-grey">ID Proof</label>
                                <input type="file" class="form-control" name="file" required >
                              </div>
                              <div class="col-12 mt-3">
                                <button type="submit" class="btn btn-primary px-5">Submit</button>
                              </div>
                            </div>
                          </form>
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
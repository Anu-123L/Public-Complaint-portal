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
          <h2 class="title-section mb-3">New Registration</h2>
          
        </div>
        <div class="row justify-content-center mt-5">
            
          <div class="col-lg-8">
              <center>
                  <%
  try{
                  String status=" ";
              status=request.getParameter("status");
                                  if(status.equals("1"))
                                  {
                                      out.println("<div class='label label-success' style='font-size: 15px;'>Customer registration successful!</div><br><br>");
                                  }
           }
  catch(Exception e){}
                  %>
              </center>
              <div class="card-blog">
                      <div class="body">
            <form class="" action="includes/WebService.jsp" method="post" >
                       <input type="hidden" name="action" value="addCustomer"/>
              <div class="row">
                <div class="col-sm-6 py-2">
                  <label for="name" class="fg-grey">Username</label>
                  <input type="text" class="form-control" name="username" required placeholder="Enter username..">
                </div>
                  <div class="col-sm-6 py-2">
                  <label for="name" class="fg-grey">Name</label>
                  <input type="text" class="form-control" name="name" required placeholder="Enter name..">
                </div>
                
                <div class="col-sm-6 py-2">
                  <label for="email" class="fg-grey">State</label>
                  <input type="text" class="form-control" name="state" required placeholder="State">
                </div>
                <div class="col-sm-6 py-2">
                  <label for="email" class="fg-grey">Address</label>
                  <input type="text" class="form-control" name="address" required placeholder="Address">
                </div>
                <div class="col-sm-6 py-2">
                  <label for="email" class="fg-grey">District</label>
                  <input type="text" class="form-control" name="district" required placeholder="District">
                </div>
                <div class="col-sm-6 py-2">
                  <label for="email" class="fg-grey">Mobile No.</label>
                  <input type="text" class="form-control" name="mobile" required placeholder="Mobile no.">
                </div>
                <div class="col-sm-6 py-2">
                  <label for="email" class="fg-grey">City</label>
                  <input type="text" class="form-control" name="city" required placeholder="City">
                </div>
                <div class="col-sm-6 py-2">
                  <label for="email" class="fg-grey">Date of birth</label>
                  <input type="date" class="form-control" name="dob" required placeholder="Date of birth">
                </div>
                <div class="col-sm-6 py-2">
                  <label for="email" class="fg-grey">Pincode</label>
                  <input type="text" class="form-control" name="pincode" required placeholder="Pincode">
                </div>
                <div class="col-sm-6 py-2">
                  <label for="email" class="fg-grey">Post office</label>
                  <input type="text" class="form-control" name="postoffice" required placeholder="Post office">
                </div>
                
                <div class="col-sm-6 py-2">
                  <label for="email" class="fg-grey">Password</label>
                  <input type="password" class="form-control" name="password" required placeholder="Password">
                </div>
                <div class="col-sm-6 py-2">
                  <label for="email" class="fg-grey">Confirm password</label>
                  <input type="password" class="form-control" name="confpassword" required placeholder="Confirm password">
                </div>
                  <div class="col-sm-6 py-2">
                  <label for="email" class="fg-grey">Gender</label><br>
                  <label><input type="radio" class="" name="gender" value="Male"> Male</label>
                  <label><input type="radio" class="" name="gender" value="Female"> Female</label>
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
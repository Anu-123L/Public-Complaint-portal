<%@page import="java.sql.ResultSet"%>
<%@page import="database.Database"%>
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
        
        <div class="row mt-5">
            <div class="col-lg-7">
                <div class="text-center">
                    <h2 class="title-section mb-3">News</h2>
                  </div>
                <%
                                  
                                   Database db=new Database();
                                 
                                   try{
                                       int j=1;
                                       ResultSet rs=db.getNews();
                                       while(rs.next()){
                      %>  
                <div class="card-blog">
                      <div class="body">
                        <div class="post-title"><a href="#"><%=rs.getString("title")%></a></div>
                        <div class="post-excerpt"><%=rs.getString("description")%></div>
                      </div>
                    </div>
                <%
                                         j++;
                                        }
                                     }catch(Exception e){

                                     }
                    %>
            </div>
            <div class="col-lg-5">
                <div class="text-center">
                    <h2 class="title-section mb-3">Departments</h2>
                  </div>
                <%
                                                                   
                                   try{
                                       int j=1;
                                       ResultSet res=db.getDepartments();
                                       while(res.next()){
                      %>  
                    <div class="card-blog">
                      <div class="body">
                        <div class="post-title"><a href="#"><%=res.getString("name")%></a></div>
                        <div class="post-excerpt">Location : <%=res.getString("address")%></div>
                        <div class="post-excerpt">Head : <%=res.getString("head")%></div>
                      </div>
                    </div>
                    <%
                                         j++;
                                        }
                                     }catch(Exception e){

                                     }
                    %>
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
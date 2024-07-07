<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.Database"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="assets/img/favicon.png">
  <title>
    Public Complaint Management System
  </title>
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
  <!-- Nucleo Icons -->
  <link href="assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <link href="assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link id="pagestyle" href="assets/css/soft-ui-dashboard.css?v=1.0.3" rel="stylesheet" />
</head>

<body class="g-sidenav-show  bg-gray-100">
  <%@ include file="includes/dept-header.jsp" %>
  <main class="main-content position-relative max-height-vh-100 h-100 mt-1 border-radius-lg ">
    <!-- Navbar -->
    <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur" navbar-scroll="true">
      <div class="container-fluid py-1 px-3">
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="javascript:;">Dashboard</a></li>
            <li class="breadcrumb-item text-sm text-dark active" aria-current="page">Complaints</li>
          </ol>
          <h6 class="font-weight-bolder mb-0">Complaints</h6>
        </nav>
        <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
          <div class="ms-md-auto pe-md-3 d-flex align-items-center">
            <div class="input-group">
                
            </div>
          </div>
            <ul class="navbar-nav  justify-content-end">
                <li class="nav-item d-flex align-items-center">
                 
                </li>
            </ul>
        </div>
      </div>
    </nav>
    <!-- End Navbar -->
    <div class="container-fluid py-4">
      <div class="row">
        <div class="col-12">
          <div class="card mb-4">
            <div class="card-header pb-0">
              <!--<h6>Authors table</h6>-->
              <center>
                  <%
  try{
                  String status=" ";
              status=request.getParameter("status");
                                  if(status.equals("30"))
                                  {
                                      out.println("<div class='label label-success' style='font-size: 15px;'>Complaint deleted successfully!</div><br><br>");
                                  }
                                  if(status.equals("2"))
                                  {
                                      out.println("<div class='label label-success' style='font-size: 15px;'>Complaint updated successfully!</div><br><br>");
                                  }
           }
  catch(Exception e){}
                  %>
              </center>
            </div>
            <div class="card-body px-0 pt-0 pb-2">
              <div class="table-responsive p-0">
                <table class="table align-items-center mb-0">
                  <thead>
                    <tr>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Sr.No.</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Customer Name</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Reason</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Against</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Info</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Status</th>
                      <th class="text-secondary opacity-7">Action</th>
                    </tr>
                  </thead>
                  <tbody>
                      <%
                                  
                                   Database db=new Database();
                                 
                                   try{
                                       int j=1;
                                       int id=(Integer)session.getAttribute("deptlogin");
                                       ResultSet rs=db.getComplaintsByDeptid(id);
                                       while(rs.next()){
                                           int deptid=rs.getInt("department_id");
                                           int cid=rs.getInt("customer_id");
                                           
//String newstart_dt=rs.getString("date")+" "+rs.getString("time");
//                        DateFormat newformatter = new SimpleDateFormat("yyyy-MM-DD HH:mm:ss"); 
//                        Date newctdate = (Date)newformatter.parse(newstart_dt);
//                        SimpleDateFormat newnewFormat = new SimpleDateFormat("DD/MM/yyyy hh:mm aa");
//                        String newfinalString = newnewFormat.format(newctdate);
                                          
                      %>  
                    <tr>
                      <td>
                        <div class="d-flex px-2 py-1">
                          
                          <div class="d-flex flex-column justify-content-center">
                            <h6 class="mb-0 text-sm"><%=j%></h6>
                          </div>
                        </div>
                      </td>
                      <td class="align-middle text-center">
                          <% ResultSet pat= db.getCustomerById(cid); %>
                          <h6 class="mb-0 text-sm"><% if(pat.next()){ out.println(pat.getString("name")); }%></h6>
                      </td>
                      <td class="align-middle text-center">
                          <h6 class="mb-0 text-sm"><%=rs.getString("reason")%></h6>
                      </td>
                      <td class="align-middle text-center">
                          <h6 class="mb-0 text-sm"><%=rs.getString("against")%></h6>
                      </td>
                      <td class="align-middle text-center">
                          <h6 class="mb-0 text-sm"><%=rs.getString("info")%></h6>
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
                         
                        <form class="row login_form" action="includes/WebService.jsp" onsubmit="return confirm('Are you sure?');" method="post" >
                            <input type="hidden" name="action" value="deleteother"/>
                            <input type="hidden" name="id" value="<%=rs.getInt("id")%>"/>
                            <input type="hidden" name="table" value="complaints"/>
                            <a href="dept-complaint-details.jsp?id=<%=rs.getString("id")%>" style="width:auto" class="btn btn-info btn-sm" data-toggle="tooltip" data-original-title="Edit user">
                                Details
                              </a> 
                                <% if(rs.getInt("status")!=2){ %>
                            <button type="submit" class="btn btn-danger btn-sm" style="width:auto" >Delete</button>
                            <% } %>
                        </form>
                                
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
        </div>
      </div>
      <%@ include file="includes/other-footer.jsp" %>
    </div>
  </main>
  
  <!--   Core JS Files   -->
  <script src="assets/js/core/popper.min.js"></script>
  <script src="assets/js/core/bootstrap.min.js"></script>
  <script src="assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="assets/js/plugins/smooth-scrollbar.min.js"></script>
  <script>
    var win = navigator.platform.indexOf('Win') > -1;
    if (win && document.querySelector('#sidenav-scrollbar')) {
      var options = {
        damping: '0.5'
      }
      Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
    }
  </script>
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="assets/js/soft-ui-dashboard.min.js?v=1.0.3"></script>
</body>

</html>
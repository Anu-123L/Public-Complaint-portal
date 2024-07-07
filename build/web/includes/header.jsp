<header>
   

    <nav class="navbar navbar-expand-lg navbar-light">
      <div class="container">
        <a href="index.html" class="navbar-brand">Public Complaint Management System</a>

        <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarContent" aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="navbar-collapse collapse" id="navbarContent">
          <ul class="navbar-nav ml-auto pt-3 pt-lg-0">
            <li class="nav-item">
              <a href="index.jsp" class="nav-link">Home</a>
            </li>
            <% if(session.getAttribute("userlogin")==null){ %>
            <li class="nav-item">
              <a href="login.jsp" class="nav-link">Login/Register</a>
            </li>
            <li class="nav-item">
              <a href="department-login.jsp" class="nav-link">Department Login</a>
            </li>
            <% } %>
            <li class="nav-item">
              <a href="about.jsp" class="nav-link">About</a>
            </li>
            <li class="nav-item">
              <a href="help.jsp" class="nav-link">Help</a>
            </li>
            <% if(session.getAttribute("userlogin")==null){ %>
            <li class="nav-item">
              <a href="admin-login.jsp" class="nav-link">Admin Login</a>
            </li>
            <% } %>
            <% if(session.getAttribute("userlogin")!=null){ %>
            <li class="nav-item">
              <a href="profile.jsp" class="nav-link">My Profile</a>
            </li>
            <li class="nav-item">
              <a href="complaints.jsp" class="nav-link">My Complaints</a>
            </li>
            <li class="nav-item">
              <a href="logout.jsp" class="nav-link">Logout</a>
            </li>
            <% } %>
          </ul>
        </div>
      </div> <!-- .container -->
    </nav> <!-- .navbar -->
  </header>
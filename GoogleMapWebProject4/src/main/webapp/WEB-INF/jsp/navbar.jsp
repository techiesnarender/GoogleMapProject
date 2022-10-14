<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
   <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1"> 
<meta http-equiv="X-UA-Compatible content="IE=edge">
<meta http-equiv="Pragma"content="no-cache">
<title>MishaInfotech | Navbar</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel='stylesheet'	href='https://formden.com/static/cdn/bootstrap-iso.css' />
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="/home">Misha Infotech</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
	      <li class="nav-item">
	        <a class="nav-link" href="/register">Sitter Registration</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="/search">Search</a>
	      </li>      
	      <li class="nav-item">	      	
	      <sec:authorize access="isAuthenticated()">
	        <a class="nav-link" href="/admin/sitterlist">Sitter Records</a>	  
	        </sec:authorize>      
	      </li>	      
	      <li class="nav-item">
	      <sec:authorize access="isAuthenticated()">
	        <a class="nav-link" href="/profile">Profile</a>
	        </sec:authorize>
	      </li>
	      <li class="nav-item">
	      <sec:authorize access="!isAuthenticated()">
	        <a class="nav-link" href="/login">Login</a>
	       </sec:authorize>
	      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
    	<sec:authorize access="isAuthenticated()">
      <a class="btn btn-outline-success my-2 my-sm-0" type="submit" href="/logout">Logout</a>
      </sec:authorize>
    </form>
  </div>
</nav>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

</body>
</html>
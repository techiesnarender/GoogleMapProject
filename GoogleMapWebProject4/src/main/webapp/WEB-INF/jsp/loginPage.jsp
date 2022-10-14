<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible content="IE=edge">
<meta http-equiv="Pragma"content="no-cache">
<meta http-equiv="Cache-Control"content="no-cache">
<meta http-equiv="Expires"content="sat,01 Dec 2001 00:00:00 GMT">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>MishaInfotech | Login</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel='stylesheet'	href='https://formden.com/static/cdn/bootstrap-iso.css' />
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">
<style>  
body {  
  background: #343a40 !important;  
  font-family: 'Muli', sans-serif;  
}  
h1 {  
  color: #fff;  
  padding-bottom: 2rem;  
  font-weight: bold;  
}  
a {  
  color: #333;  
}  
a:hover {  
  color: #E8D426;  
  text-decoration: none;  
}  
.form-control:focus {  
    color: #000;  
    background-color: #fff;  
    border: 2px solid #E8D426;  
    outline: 0;  
    box-shadow: none;  
}  
.btn {  
  background: #28a745;  
  border: #E8D426;  
}  
.btn:hover {  
  background: #28a745;  
  border: #E8D426;  
}  
</style>  
</head>
<body>
<div class="pt-5">  
  <h1 class="text-center"> Login Form </h1>  
	<div class="container">  
		<div class="row">  
			<div class="col-md-5 mx-auto">  
				<div class="card card-body">  
					<form id="submitForm" action="#" method="post" data-parsley-validate="" data-parsley-errors-messages-disabled="true" novalidate="" _lpchecked="1">  
					<input type="hidden" name="_csrf" value="7635eb83-1f95-4b32-8788-abec2724a9a4">  
						<div class="form-group required">  
							<label for="email"> Enter your Email </label>  
								<input type="text" class="form-control text-lowercase" id="email" required="required" name="email">  
						</div>                      
						<div class="form-group required">  
							<label class="d-flex flex-row align-items-center" for="password"> Enter your Password   
								<a class="ml-auto border-link small-xl" href="#"> Forget Password? </a> </label>  
									<input type="password" class="form-control" required="required" id="password" name="password">  
						</div>  
						<div class="form-group mt-4 mb-4">  
							<div class="custom-control custom-checkbox">  
								<input type="checkbox" class="custom-control-input" id="remember-me" name="remember-me" data-parsley-multiple="remember-me">  
									<label class="custom-control-label" for="remember-me"> Remember me? </label>  
							</div>  
						</div>  
						<div class="form-group pt-1">  
							<button class="btn btn-primary btn-block" type="submit"> Log In </button>  
						</div>  
					</form>  
				<p class="small-xl pt-3 text-center">  
				<span class="text-muted"> Not a member? </span>  
				<a href="#"> Sign up </a>  
				</p>  
				</div>  
			</div>  
		</div>  
	</div>  
</div>  
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</body>
</html>
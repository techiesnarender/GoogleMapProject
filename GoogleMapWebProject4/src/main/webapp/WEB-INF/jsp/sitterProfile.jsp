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
<title>MishaInfotech | Profile</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel='stylesheet'	href='https://formden.com/static/cdn/bootstrap-iso.css' />
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">
</head>
<body>
<%@include file="navbar.jsp" %>
<h2 class="text-center">Sitter Profile</h2>
<div class="container">
	 <div class="row">
  		<div class="col-sm-10"><h2>${user.contactname}</h2></div>
  		
  		<div class="col-sm-10"><h2>Assigned Roles: <sec:authentication property="principal.authorities"/> </h2></div>
    	<div class="col-sm-2"><a href="/logout" class="pull-right"><img title="profile image" class="rounded-circle img-responsive" src="http://www.gravatar.com/avatar/28fd20ccec6865e2d5f0e1f4446eb7bf?s=100"></a></div>
    </div>
    <div class="row">
    	<div class="col-sm-3"><!--left col-->
              
	      <div class="text-center">
	        <img src="images/${user.logo}" class="avatar rounded-circle img-thumbnail" alt="avatar">
	        <h6>Upload a different photo...</h6>
	        <input type="file" class="text-center center-block file-upload">
	      </div></hr><br>
        
        </div><!--/col-3-->
        
        	<div class="col-sm-9">
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item">
                	<a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Home</a>
                </li>
                <li class="nav-item">
                	<a class="nav-link" id="changepassword-tab" data-toggle="tab" href="#changepassword" role="tab" aria-controls="changepassword" aria-selected="false">Change Password</a>
                </li>
              </ul>

              
          <div class="tab-content">
            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                <hr>
                  <form class="form" action="/profileupdate" method="post" id="registrationForm" enctype="multipart/form-data">
                      <div class="form-group">     
                          <div class="col-xs-6">
                              <label for="contact_name"><h4>Contact name</h4></label>
                              <input type="text" class="form-control" name="contactname" id="contact_name" placeholder="contact name" title="enter your contact name if any." value="${user.contactname}">
                          </div>
                      </div>
                      <div class="form-group">                        
                          <div class="col-xs-6">
                            <label for="email"><h4>Email</h4></label>
                              <input type="text" class="form-control" name="email" id="email" placeholder="Ex. John@gmail.com" title="enter your email if any." value="${user.username }">
                          </div>
                      </div>
          
                      <div class="form-group">                        
                          <div class="col-xs-6">
                              <label for="company_name"><h4>Company name</h4></label>
                              <input type="text" class="form-control" name="companyname" id="company_name" placeholder="company name" title="enter your company name if any." value="${user.companyname}">
                          </div>
                      </div>
                      <div class="form-group">                      
                          <div class="col-xs-6">
                              <label for="open_time"><h4>Open time</h4></label>
                              <input type="text" class="form-control" name="opentime" id="open_time" placeholder="open time" title="enter your opening timing." value="${user.opentime}">
                          </div>
                      </div>
                      <div class="form-group">                         
                          <div class="col-xs-6">
                              <label for="close_time"><h4>Close time</h4></label>
                              <input type="text" class="form-control" id="close_time" placeholder="close time" title="enter your close timing." value="${user.closetime}">
                          </div>
                      </div>
                      <div class="form-group">                         
                          <div class="col-xs-6">
                              <label for="charges"><h4>Charges</h4></label>
                              <input type="text" class="form-control" name="chargerperhour" id="charges" placeholder="charges per hours" title="enter your charges." value="${user.chargesperhour}">
                          </div>
                      </div>
                      <div class="form-group">
                           <div class="col-xs-12">
                                <br>
                              	<button class="btn btn-lg btn-success" type="submit"><i class="glyphicon glyphicon-ok-sign"></i> Update Profile</button>
                               	<a href="/home" class="btn btn-lg" type="button"><i class="glyphicon glyphicon-repeat"></i>Cancel</a>
                            </div>
                      </div>
              	</form>              
              <hr>
              
             </div><!--/tab-pane-->
             <div class="tab-pane fade" id="changepassword" role="tabpanel" aria-labelledby="changepassword-tab">
               <hr>
                  <form class="form" action="##" method="post" id="registrationForm">
                      
                      <div class="form-group">
                          <div class="col-xs-6">
                             <label for="old_password"><h4>Old password</h4></label>
                              <input type="text" class="form-control" name="oldpassword" id="old_password" placeholder="enter your old password" title="enter your old password.">
                          </div>
                      </div>
                      <div class="form-group">
                          <div class="col-xs-6">
                              <label for="new_password"><h4>New password</h4></label>
                              <input type="text" class="form-control" name="newpassword" id="new_password" placeholder="enter your new password" title="enter your new password.">
                          </div>
                      </div>
                      <div class="form-group">            
                          <div class="col-xs-6">
                              <label for="confirm_password"><h4>Confirm password</h4></label>
                              <input type="text" class="form-control" id="confirm_password" placeholder="enter your confirm password" title="enter your confirm password.">
                          </div>
                      </div>
                      <div class="form-group">
                           <div class="col-xs-12">
                                <br>
                              	<button class="btn btn-lg btn-success" type="submit"><i class="glyphicon glyphicon-ok-sign"></i> Update Password</button>
                               	<a href="/home" class="btn btn-lg" type="button"><i class="glyphicon glyphicon-repeat"></i>Cancel</a>
                            </div>
                      </div>
              	</form>
               <hr>
             </div><!--/tab-pane-->	
               
              </div><!--/tab-pane-->
          </div><!--/tab-content-->
        
    </div>
</div>

<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

<script type="text/javascript">
$(document).ready(function() {
    
    var readURL = function(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('.avatar').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
    $(".file-upload").on('change', function(){
        readURL(this);
    });
});
</script>
</body>
</html>
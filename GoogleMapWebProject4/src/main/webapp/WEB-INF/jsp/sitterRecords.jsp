<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible content="IE=edge">
<meta http-equiv="Pragma"content="no-cache">
<meta http-equiv="Cache-Control"content="no-cache">
<meta http-equiv="Expires"content="sat,01 Dec 2001 00:00:00 GMT">
<title>MishaInfotech | Sitters</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel='stylesheet'	href='https://formden.com/static/cdn/bootstrap-iso.css' />
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">
</head>
<body>
<%@include file="navbar.jsp" %>

   
<div class="container-fluid">
		<h4 class="text-center">Sitter Records</h4>	
			<table class="table" id="myTable">
				 <thead class="thead-dark">
				 	<tr>
				 		<th>S No.</th>
				 		<th>Company Logo</th>
				 		<th>Name</th>
				 		<th>Email</th>
				 		<th>Address</th>
				 		<th>Open Time</th>
				 		<th>Charges</th>
				 	</tr>
				 </thead>
				 <tbody>
				 	 <% int sno = 1;%>
				 	 <c:forEach var="sitter" items="${sitters}">
				 	<tr>
				 		<td	><%= sno %><% sno++; %></td>
				 		<td><img src="/images/${sitter.logo}" style="height:100px; width:100px"></td>
				 		<td>${sitter.contactname}</td>
				 		<td>${sitter.email}</td>
				 		<td style="word-wrap: break-word;min-width: 160px;max-width: 160px;">${sitter.address}</td>
				 		<td>${sitter.opentime}</td>
				 		<td>${sitter.chargesperhour}</td>
				 	</tr>
				 	</c:forEach>
				 </tbody>
			</table>
		</div>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

<script type="text/javascript">
$(document).ready(function () {
    $('#myTable').DataTable();
});
</script>
</body>
</html>
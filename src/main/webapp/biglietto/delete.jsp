<%@page import="it.prova.gestionebigliettiweb.model.Biglietto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html  class="h-100" >
	<head>
		<jsp:include page="../header.jsp" />
		<meta charset="ISO-8859-1">
		<title>Delete Biglietto</title>
	</head>
	<body class="d-flex flex-column h-100">
		<jsp:include page="../navbar.jsp"></jsp:include>
		
		
		<table>
			<thead>
				<tr>
					<th>Provenienza</th>
					<th>Destinazione</th>
					<th>Prezzo</th>
					<th>Data</th>
				</tr>
			</thead>
			
			<% Biglietto result = (Biglietto)request.getAttribute("bigliettoDeleteAttribute");%>
			
			<tr>
				<td><%=result.getProvenienza() %></td>
				<td><%=result.getDestinazione() %></td>
				<td><%=result.getPrezzo() %></td>
				<td><%=result.getData() %></td>	
			</tr>
		</table>
		
		<div class="row justify-content-start">
		   	<div class="col-sm-1">
		   		<a href="ExecuteListBigliettoServlet" class='btn btn-outline-secondary' style='width:80px'>
		            <i class='fa fa-chevron-left'></i> Back
		       	</a>
			</div>
		
			<div class="col-sm-1" >
				<form method="post" action="ExecuteDeleteBigliettoServlet">
					<input type="submit" value="conferma" class="btn btn-outline-danger">
					<input type="hidden" name="idBiglietto" value="<%=result.getId() %>">
				</form>
			</div>
		</div>
		
		<jsp:include page="../footer.jsp" />	
	</body>
</html>
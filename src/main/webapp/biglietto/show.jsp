<%@page import="it.prova.gestionebigliettiweb.model.Biglietto"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<!DOCTYPE html>
<html class="h-100">
	<head>
		<jsp:include page="../header.jsp" />
		<meta charset="ISO-8859-1">
		<title>Dettaglio Biglietto</title>
	</head>
	<body class="d-flex flex-column h-100">
		<jsp:include page="../navbar.jsp"></jsp:include>
		<main class="flex-shrink-0">
			<div class="container">
				<div class='card'>
					<div class='card-header bg-dark'>
						<h5 class="text-light">Lista dei dettagli</h5> 
					</div>
					<div class='card-body'>
						<div class="table-responsive">
							<table class="table table-bordered table-hover">
								<thead class="table-secondary">
									<tr>
										<th>Provenienza</th>
										<th>Destinazione</th>
										<th>Prezzo</th>
										<th>Data</th>
									</tr>
								</thead>
								
							
								<tbody>
									<tr>
										<td>${BigliettoDaCaricareAttribute.provenienza}</td>
										<td>${BigliettoDaCaricareAttribute.destinazione}</td>
										<td>${BigliettoDaCaricareAttribute.prezzo}</td>
										<td><fmt:formatDate value="${BigliettoDaCaricareAttribute.data}" /></td>	
									</tr>
								</tbody>
							</table>
						</div>
					</div>
						<div class='card-footer'>
					        <a href="ExecuteListBigliettoServlet" class='btn btn-outline-secondary' style='width:80px'>
					            <i class='fa fa-chevron-left'></i> Back
					        </a>
					    </div>
				</div>
			</div>
		</main>
		
		<jsp:include page="../footer.jsp" />
	</body>
</html>
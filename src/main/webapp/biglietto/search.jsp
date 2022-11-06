<%@page import="java.text.SimpleDateFormat"%>
<%@page import="it.prova.gestionebigliettiweb.model.Biglietto"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html class="h-100">
	<head>
		<jsp:include page="../header.jsp" />
		<meta charset="ISO-8859-1">
		<title>Search Biglietto</title>
	</head>
	<body class="d-flex flex-column h-100">
		<jsp:include page="../navbar.jsp"></jsp:include>
		<main class="flex-shrink-0">
			<div class="container">
				<div class='card'>
					<div class='card-header bg-dark'>
				    	 <h4 class="text-light">Cerca un elemento</h4> 
					</div>
		   	 	<div class='card-body'>
					<form action="ExecuteSearchBigliettoServlet" class="row g-3" novalidate="novalidate">		
						<% Biglietto biglietto = (Biglietto)request.getAttribute("nuovoBigliettoAttribute"); %>
							<div class="col-md-6">
								<label for="provenienza" class="form-label">Provenienza </label>
								<input type="text" name="provenienza" id="provenienza" class="form-control" placeholder="Inserire la provenienza" >
							</div>	
							<div class="col-md-6">
								<label for="destinazione" class="form-label">Destinazione</label>
								<input type="text" name="destinazione" id="destinazione" class="form-control" placeholder="Inserire la destinazione"> 
							</div>
							<div class="col-md-6">
								<label for="prezzo" class="form-label">Prezzo </label>
								<input type="number" class="form-control" name="prezzo" id="prezzo" placeholder="Inserire prezzo">
							</div>		
							<div class="col-md-3">
								<label for="data" class="form-label">Data di Arrivo</label>
								<input class="form-control"  name="data" id="data" type="date" placeholder="dd/MM/yy" title="formato : gg/mm/aaaa" >
							</div>		
							<div class="col-12">
								<button type="submit" name="submit" value="submit" id="submit" class="btn btn-dark">Conferma</button>
					        	<a href="home.jsp" class='btn btn-outline-secondary' style='width:80px'>
					        		<i class='fa fa-chevron-left'></i>Back</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</main>
		
		<jsp:include page="../footer.jsp" />
	</body>
</html>
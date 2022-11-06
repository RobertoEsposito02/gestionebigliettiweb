<%@page import="it.prova.gestionebigliettiweb.model.Biglietto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html class="h-100" >
	<head>
		<jsp:include page="../header.jsp" />
		<meta charset="ISO-8859-1">
		<title>Results</title>
	</head>
	<body class="d-flex flex-column h-100">
		<jsp:include page="../navbar.jsp"></jsp:include>
	
	<main class="flex-shrink-0">
		<div class="container">
			<div class="alert alert-success alert-dismissible fade show  ${successMessage==null?'d-none':'' }" role="alert">
				${successMessage}
				<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" ></button>
			</div>
			<div class="alert alert-danger alert-dismissible fade show d-none" role="alert">
				Esempio di operazione fallita!
				<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" ></button>
			</div>
			<div class="alert alert-info alert-dismissible fade show d-none" role="alert">
				Aggiungere d-none nelle class per non far apparire
				<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" ></button>
			</div>
		
			<div class='card'>
				<div class='card-header bg-dark'>
					<h5 class="text-light">Lista dei risultati</h5> 
				</div>
				<div class='card-body'>
			
					<div class="table-responsive">
						<table class="table table-bordered table-hover">
							<thead class="table-secondary">
								<tr >
									<th scope="col">Provenienza</th>
									<th scope="col">Destinazione</th>
									<th scope="col">azione</th>
								</tr>
							</thead>
							
							<% List<Biglietto> result = (List<Biglietto>)request.getAttribute("listAllAttribute"); 
							   for(Biglietto biglietto : result){
							%>
							<tbody>
							<tr>
								<td scope="row"><%=biglietto.getProvenienza() %></td>
								<td><%=biglietto.getDestinazione() %></td>
								<td>
								 	<a class="btn btn-outline-info btn-sm" href="ExecuteVisualizzaBigliettoServlet?idBiglietto=<%=biglietto.getId()  %>" >Dettaglio</a>
									<a class="btn btn-outline-secondary btn-sm" href="PrepareUpdateBigliettoServlet?idBiglietto=<%=biglietto.getId()  %>" >Aggiorna</a>
									<a class="btn btn-outline-danger btn-sm" href="PrepareDeleteBigliettoServlet?idBiglietto=<%=biglietto.getId()  %>" >Elimina</a>
								</td>
							</tr>
							</tbody>
							<%} %>
						</table>
					</div>
					</div>
					<div class='card-footer'>
					        <a href="home.jsp" class='btn btn-outline-secondary' style='width:80px'>
					            <i class='fa fa-chevron-left'></i> Back
					        </a>
					    </div>
				</div>
			</div>
		</main>
		
		<jsp:include page="../footer.jsp" />
	</body>
</html>
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
	<body>
		<jsp:include page="../navbar.jsp"></jsp:include>
	
		<table>
			<thead>
				<tr>
					<th>Provenienza</th>
					<th>Destinazione</th>
					<th>azione</th>
				</tr>
			</thead>
			
			<% List<Biglietto> result = (List<Biglietto>)request.getAttribute("listAllAttribute"); 
			   for(Biglietto biglietto : result){
			%>
			
			<tr>
				<td><%=biglietto.getProvenienza() %></td>
				<td><%=biglietto.getDestinazione() %></td>
				<td>
				 	<a class="btn btn-outline-secondary btn-sm" href="ExecuteVisualizzaBigliettoServlet?idBiglietto=<%=biglietto.getId()  %>" >Dettaglio</a>
					<a class="btn btn-outline-secondary btn-sm" href="PrepareUpdateBigliettoServlet?idBiglietto=<%=biglietto.getId()  %>" >Aggiorna</a>
					<a class="btn btn-outline-danger btn-sm" href="PrepareDeleteBigliettoServlet?idBiglietto=<%=biglietto.getId()  %>" >Elimina</a>
				</td>
			</tr>
			<%} %>
		</table>
		
		<jsp:include page="../footer.jsp" />
	</body>
</html>
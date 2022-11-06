<%@page import="it.prova.gestionebigliettiweb.model.Biglietto"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="../header.jsp" />
		<meta charset="ISO-8859-1">
		<title>Dettaglio Biglietto</title>
	</head>
	<body>
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
			
			<% Biglietto result = (Biglietto)request.getAttribute("BigliettoDaCaricareAttribute");%>
			
			<tr>
				<td><%=result.getProvenienza() %></td>
				<td><%=result.getDestinazione() %></td>
				<td><%=result.getPrezzo() %></td>
				<td><%=result.getData() %></td>	
			</tr>
		</table>
		
		<jsp:include page="../footer.jsp" />
	</body>
</html>
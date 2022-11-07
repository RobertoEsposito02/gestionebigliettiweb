<%@page import="it.prova.gestionebigliettiweb.model.Biglietto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html class="h-100" >
	<head>
		<jsp:include page="../header.jsp" />
		<meta charset="ISO-8859-1">
		<title>Results</title>
	</head>
	<body class="d-flex flex-column h-100">
		<jsp:include page="../navbar.jsp"></jsp:include>
	
	<main class="flex-shrink-0" style="margin-bottom: 50px;">
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
							
							<c:forEach items="${listAllAttribute}" var="item">
							
							<tbody>
							<tr>
								<td scope="row">${item.provenienza}</td>
								<td>${item.destinazione}</td>
								<td>
								 	<a class="btn btn-outline-info btn-sm" href="${pageContext.request.contextPath }/ExecuteVisualizzaBigliettoServlet?idBiglietto=${item.id}">Dettaglio</a>
									<c:forEach items="${userInfo.ruoli}" var="user">
			    					<c:if test= "${user.codice == 'ADMIN_ROLE'}" >
									<a class="btn btn-outline-secondary btn-sm" href="${pageContext.request.contextPath }/admin/PrepareUpdateBigliettoServlet?idBiglietto=${item.id}" >Aggiorna</a>
									<a class="btn btn-outline-danger btn-sm" href="${pageContext.request.contextPath }/admin/PrepareDeleteBigliettoServlet?idBiglietto=${item.id}" >Elimina</a>
									</c:if>
			    					</c:forEach> 
								</td>
							</tr>
							</tbody>
							
							</c:forEach>
						</table>
					</div>
					</div>
					<div class='card-footer'>
					        <a href="${pageContext.request.contextPath }/home.jsp" class='btn btn-outline-secondary' style='width:80px'>
					            <i class='fa fa-chevron-left'></i> Back
					        </a>
					<c:forEach items="${userInfo.ruoli}" var="item">
			    	<c:if test= "${item.codice == 'ADMIN_ROLE'}" >
					        <a href="${pageContext.request.contextPath }/admin/PrepareInsertBigliettoServlet" class='btn btn-outline-dark' style='width:100px'>
					            <i class='fa fa-chevron-left'></i> Add new
					        </a>
					</c:if>
			    	</c:forEach>   
					 
					</div>
				</div>
			</div>
		</main>
		
		<jsp:include page="../footer.jsp" />
	</body>
</html>
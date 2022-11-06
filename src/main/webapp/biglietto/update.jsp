<%@page import="java.text.SimpleDateFormat"%>
<%@page import="it.prova.gestionebigliettiweb.model.Biglietto"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html class="h-100">
	<head>
		<jsp:include page="../header.jsp" />
		<meta charset="ISO-8859-1">
		<title>Update Biglietto</title>
	</head>
	<body class="d-flex flex-column h-100">
		<jsp:include page="../navbar.jsp"></jsp:include>
		
		
		<main class="flex-shrink-0">
		<div class="container">
			  
			  		<div class="alert alert-danger alert-dismissible fade show ${errorMessage==null?'d-none':'' }" role="alert">
					  ${errorMessage}
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
			<div class='card-header'>
			     <h5>Inserisci nuovo elemento</h5> 
			</div>
		    <div class='card-body'>
		
			<form method="post" action="ExecuteUpdateBigliettoServlet" class="row g-3" novalidate="novalidate">
							
				<% Biglietto biglietto = (Biglietto)request.getAttribute("bigliettoUpdateAttribute"); %>
							
					<div class="col-md-6">
						<label for="provenienza" class="form-label">Provenienza</label>
						<input type="text" name="provenienza" id="provenienza" class="form-control" placeholder="Inserire la provenienza"  
										value="<%=biglietto.getProvenienza()!=null?biglietto.getProvenienza():"" %>" required>
					</div>
								
					<div class="col-md-6">
						<label for="destinazione" class="form-label">Destinazione</label>
						<input type="text" name="destinazione" id="destinazione" class="form-control" placeholder="Inserire la destinazione"  
										value="<%=biglietto.getDestinazione()!=null?biglietto.getDestinazione():"" %>" required>
					</div>
					
					<div class="col-md-6">
						<label for="prezzo" class="form-label">Prezzo</label>
						<input type="number" class="form-control" name="prezzo" id="prezzo" placeholder="Inserire prezzo" 
						value="<%=biglietto.getPrezzo()!=null?biglietto.getPrezzo():"" %>" required>
					</div>
								
					<div class="col-md-3">
						<label for="data" class="form-label">Data di Arrivo</label>
						<input class="form-control"  name="data" id="data" type="date" placeholder="dd/MM/yy" title="formato : gg/mm/aaaa" 
						value="<%=biglietto.getData()!=null? new SimpleDateFormat("yyyy-MM-dd").format(biglietto.getData()):""  %>" required/>
					</div>
								
								
					<div class="col-12">
						<button type="submit" name="submit" value="submit" id="submit" class="btn btn-dark">Conferma</button>
						<input type="hidden" name="idBiglietto" value="<%= biglietto.getId() %>"> 
					</div>
		
			</form>
			</div>
			</div>
		</div>
		</main>
		
		
		<jsp:include page="../footer.jsp" />
	</body>
</html>
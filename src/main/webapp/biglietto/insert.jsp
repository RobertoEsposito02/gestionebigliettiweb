<%@page import="java.text.SimpleDateFormat"%>
<%@page import="it.prova.gestionebigliettiweb.model.Biglietto"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html  class="h-100" >
	<head>
		<jsp:include page="../header.jsp" />
		<meta charset="ISO-8859-1">
		<title>Insert Biglietto</title>
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
			<div class='card-header bg-dark'>
			     <h4 class="text-light">Inserisci nuovo elemento</h4> 
			</div>
		    <div class='card-body'>
				<h6 class="card-title">I campi con <span class="text-danger">*</span> sono obbligatori</h6>
					<form method="post" action="ExecuteInsertBigliettoServlet" class="row g-3" novalidate="novalidate">		
						<% Biglietto biglietto = (Biglietto)request.getAttribute("nuovoBigliettoAttribute"); %>
							<div class="col-md-6">
								<label for="provenienza" class="form-label">Provenienza <span class="text-danger">*</span></label>
								<input type="text" name="provenienza" id="provenienza" class="form-control" placeholder="Inserire la provenienza"  
												value="<%=biglietto.getProvenienza()!=null?biglietto.getProvenienza():"" %>" required>
							</div>	
							<div class="col-md-6">
								<label for="destinazione" class="form-label">Destinazione <span class="text-danger">*</span></label>
								<input type="text" name="destinazione" id="destinazione" class="form-control" placeholder="Inserire la destinazione"  
												value="<%=biglietto.getDestinazione()!=null?biglietto.getDestinazione():"" %>" required>
							</div>
							<div class="col-md-6">
								<label for="prezzo" class="form-label">Prezzo <span class="text-danger">*</span></label>
								<input type="number" class="form-control" name="prezzo" id="prezzo" placeholder="Inserire prezzo" 
								value="<%=biglietto.getPrezzo()!=null?biglietto.getPrezzo():"" %>" required>
							</div>		
							<div class="col-md-3">
								<label for="data" class="form-label">Data di Arrivo<span class="text-danger">*</span></label>
								<input class="form-control"  name="data" id="data" type="date" placeholder="dd/MM/yy" title="formato : gg/mm/aaaa" 
								value="<%=biglietto.getData()!=null? new SimpleDateFormat("yyyy-MM-dd").format(biglietto.getData()):""  %>" required/>
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
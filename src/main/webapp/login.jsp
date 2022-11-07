<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html class="h-100">
	<head>
		<jsp:include page="./header.jsp" />
		<meta charset="ISO-8859-1">
		<title>Login</title>
	</head>
	<body class="d-flex flex-column h-100 bg-light">
	<main class="flex-shrink-0">
		<div class="container">
		<div class='card'>
			<div class='card-header bg-dark'>
			     <h4 class="text-light">Login</h4> 
			</div>
		    <div class='card-body'>
				<h6 class="card-title">I campi con <span class="text-danger">*</span> sono obbligatori</h6>
					<form method="post" action="LoginServlet" class="row g-3" novalidate="novalidate">		
						
							<div class="col-md-6">
								<label for="username" class="form-label">Username <span class="text-danger">*</span></label>
								<input type="text" name="username" id="username" class="form-control" placeholder="Inserire username"  
												value="${loginUtente.username}" required>
							</div>	
							
							
							<div class="col-md-6">
								<label for="password" class="form-label">Password <span class="text-danger">*</span></label>
								<input type="password" name="password" id="password" class="form-control" placeholder="Inserire la password"  
												value="${loginUtente.password}" required>
							</div>	
							
							<div class="col-12">
								<button type="submit" name="submit" value="submit" id="submit" class="btn btn-dark">Conferma</button>
							</div>
						</form>
					</div>
				</div>
				</div>
				</main>
	</body>
</html>
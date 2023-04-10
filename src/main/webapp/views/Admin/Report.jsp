<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="/PS24728_NguyenVanBao_ASM/css/nav.css">
<link>
<link rel="stylesheet" type="text/css"
	href="/PS24728_NguyenVanBao_ASM/css/menu.css">
<link rel="stylesheet" type="text/css"
	href="/PS24728_NguyenVanBao_ASM/css/report.css">
<link>
</head>
<body>
	<c:url var="url" value="/Report"/>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-0 col-md-2">
				<jsp:include page="menu.jsp"></jsp:include>
			</div>
			<div class="bg col-sm-12 col-md-10">
				<jsp:include page="nav.jsp"></jsp:include>
				<section class="my-4">
					<div class="container col-11">
						<div class="row">
							<div class="col-7 card">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>Video title</th>
											<th>Favorite count</th>
											<th>Latest date</th>
											<th>Oldest date</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="item" items="${reports}">
											<tr>
												<td>${item.group}</td>
												<td>${item.likes}</td>
												<td>${item.newest}</td>
												<td>${item.oldest}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div class="d-flex justify-content-center">
		                    	<%
								int current1Page = (Integer) request.getAttribute("current1Page");
								int noOf1Pages = (Integer) request.getAttribute("noOf1Pages");
								%>
								<div>
									<ul class="pagination">
								    <% if(current1Page > 1) { %>
								        <li class="page-item"><a class="page-link" href="${url}?page1=<%= current1Page - 1 %>">Previous</a></li>
								    <% } %>
								
								    <% for(int i=1; i<=noOf1Pages; i++) { %>
								        <% if(i == current1Page) { %>
								            <li class="page-item"><b class="page-link"><%=i %></b></li>
								        <% } else { %>
								       		<li class="page-item"><a class="page-link" href="${url}?page1=<%= i %>"><%= i %></a></li>
								        <% } %>
								    <% } %>
								
								    <% if(current1Page < noOf1Pages) { %>
								       <li class="page-item"> <a class="page-link" href="${url}?page1=<%= current1Page + 1 %>">Next</a></li>
								    <% } %>
								     </ul>
								</div>
		                  	</div>
							</div>
							<div class="col-5 card">
								<img class="w-100"
									src="https://csshint.com/wp-content/uploads/2020/09/Animated-chart.jpg"
									alt="">
							</div>
					</div>
					</div>
				</section>
				<section>
					<div class="container card col-11">
					<div class="d-flex align-items-center justify-content-center">
						<p>Video title</p>
						<select class="my-3 form-select w-75" name="idVideo" style="margin-left: 2rem;" onChange="changeAction()" id="select_box" >
							<c:forEach var="item" items="${titles}">
								<option value="${item.id}" ${item.id == selectedValue ? 'selected' : ''}>${item.title}</option>
 							</c:forEach>
						</select>
					</div>
					<script type="text/javascript">
							var x = document.getElementById("select_box");
							var params = new URLSearchParams(window.location.search);
							var selectedValue = params.get('idVideo');
							if (selectedValue) {
								var option = x.querySelector('option[value="' + selectedValue + '"]');
								if (option) {
									option.selected = true;
								}
							}
							x.addEventListener("change", function(){
							var selectedValue = x.value;
							var encodedValue = encodeURIComponent(selectedValue);
							window.location = "${url}?idVideo="+encodedValue;
								});
						</script>
						<ul class="nav nav-tabs">
							<li class="nav-item"><a class="nav-link active"
								data-bs-toggle="tab" href="#FavoriteUs">Favorite user</a></li>
							<li class="nav-item"><a class="nav-link"
								data-bs-toggle="tab" href="#Shared">Shared friends</a></li>
						</ul>

						<!-- Tab panes -->
						<div class="tab-content">
							<div class="tab-pane container active" id="FavoriteUs">
								<form action="${url}" method="post">
										 			
								</form>
								<table class="table table-hover">
									<thead>
										<tr>
											<th>Username</th>
											<th>Fullname</th>
											<th>Email</th>
											<th>Favorite date</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="favoriteUser" items="${favoriteUser}">
											<tr>
												<td>${favoriteUser[0]}</td>
												<td>${favoriteUser[1]}</td>
												<td>${favoriteUser[2]}</td>
												<td>${favoriteUser[3]}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div class="d-flex justify-content-center">
		                    	<%
								int current2Page = (Integer) request.getAttribute("current2Page");
								int noOf2Pages = (Integer) request.getAttribute("noOf2Pages");
								%>
								<div>
									<ul class="pagination">
								    <% if(current2Page > 1) { %>
								        <li class="page-item"><a class="page-link" href="${url}?page2=<%= current2Page - 1 %>">Previous</a></li>
								    <% } %>
								
								    <% for(int i=1; i<=noOf2Pages; i++) { %>
								        <% if(i == current2Page) { %>
								            <li class="page-item"><b class="page-link"><%=i %></b></li>
								        <% } else { %>
								       		<li class="page-item"><a class="page-link" href="${url}?page2=<%= i %>"><%= i %></a></li>
								        <% } %>
								    <% } %>
								
								    <% if(current2Page < noOf2Pages) { %>
								       <li class="page-item"> <a class="page-link" href="${url}?page2=<%= current2Page + 1 %>">Next</a></li>
								    <% } %>
								     </ul>
								</div>
							</div>
		                  </div>
							</div>
							<div class="tab-pane container fade" id="Shared">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>Sender name</th>
											<th>Sender email</th>
											<th>Receiver email</th>
											<th>Send date</th>
										</tr>
									</thead>
									<tbody>
								 	<c:forEach var="sends" items="${listSend}">
										<tr>
											<td>${sends[0]}</td>
											<td>${sends[1] }</td>
											<td>${sends[2]}</td>
											<td>${sends[3]}</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
								<div class="d-flex justify-content-center">
		                    	<%
								int current3Page = (Integer) request.getAttribute("current3Page");
								int noOf3Pages = (Integer) request.getAttribute("noOf3Pages");
								%>
								<div>
									<ul class="pagination">
								    <% if(current3Page > 1) { %>
								        <li class="page-item"><a class="page-link" href="${url}?page3=<%= current3Page - 1 %>">Previous</a></li>
								    <% } %>
								
								    <% for(int i=1; i<=noOf3Pages; i++) { %>
								        <% if(i == current3Page) { %>
								            <li class="page-item"><b class="page-link"><%=i %></b></li>
								        <% } else { %>
								       		<li class="page-item"><a class="page-link" href="${url}?page3=<%= i %>"><%= i %></a></li>
								        <% } %>
								    <% } %>
								
								    <% if(current3Page < noOf3Pages) { %>
								       <li class="page-item"> <a class="page-link" href="${url}?page3=<%= current3Page + 1 %>">Next</a></li>
								    <% } %>
								     </ul>
								</div> 
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
		</div>
</body>
</html>
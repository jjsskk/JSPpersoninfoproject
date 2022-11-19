<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.dao.PersonDAO, com.example.bean.PersonVO,java.util.*"%>
<%@ page import="com.example.dao.PersonDAO" %>
<%@ page import="com.example.bean.PersonVO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
	PersonDAO personDAO = new PersonDAO();
	List<PersonVO> list = personDAO.getPersonList();
	request.setAttribute("list",list);
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="./my_index.css"/>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
		  integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
			crossorigin="anonymous"></script>
	<title>Title</title>
	<style>


	</style>
	<script>

		function clickme(id) {
			if (confirm('정말로 삭제하시겠습니까?')) {
				window.location.href = 'deletepost.jsp?id=' + id;
			} else
				return;
		}

		function mouseOver(title) {
			title.style.color = "blue";
		}

		function mouseOut(title) {
			title.style.color = "black";
		}
	</script>
</head>
<body>
<header class="p-3 bg-dark text-white">
	<div class="container">
		<div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
			<a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
				<img src="./img/logo.svg" alt="logo" class="bi me-2" width="40" height="32" role="img"
					 aria-label="Bootstrap">
				<use xlink:href="#bootstrap"></use>
			</a>

			<ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
				<li><a href="#" class="nav-link px-2 text-secondary">Home</a></li>
				<li><a href="#" class="nav-link px-2 text-white">NoStyle</a></li>
				<li><a href="#" class="nav-link px-2 text-white">Example</a></li>
				<li><a href="#" class="nav-link px-2 text-white">About</a></li>

			</ul>

			<form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
				<select name="major" class="form-control form-control-dark">
					<optgroup label="자연계열">
						<option value="전산전자공학부">전산전자공학부</option>
						<option value="생명과학부">생명과학부</option>
						<option value="기계제어공학부<">기계제어공학부</option>
					</optgroup>
					<optgroup label="인문계열">
						<option value="상담사회심리학부">상담사회심리학부</option>
						<option value="경영경제학부">경영경제학부</option>
						<option value="법학부">법학부</option>
					</optgroup>
				</select>
			</form>
			<form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
				<input type="search" class="form-control form-control-dark" placeholder="Search..." aria-label="Search">
			</form>

			<div class="text-end">

				<button type="button" class="btn btn-warning" onclick='window.location.href="addpostform.jsp"'>add</button>
			</div>
		</div>
	</div>
</header>
<br>
<div class="wrapper">
	<div id="side" class="flex-shrink-0 p-3 bg-white">
		<a href="/" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
			<img src="./img/logo.svg" alt="logo" class="bi pe-none me-2" width="30" height="24">
			<use xlink:href="#bootstrap"></use>
			<span class="fs-5 fw-semibold">Side</span>
		</a>
		<ul class="nav nav-pills flex-column mb-auto">
			<li class="nav-item">
				<a href="#" class="nav-link link-dark">
					<i class="bi bi-house-fill"></i>
					Home
				</a>
			</li>
			<li>
				<a href="#" class="nav-link link-dark">
					<i class="bi bi-speedometer"> </i>
					Dashboard
				</a>
			</li>
			<li>
				<a href="#" class="nav-link link-dark">
					<i class="bi bi-border-all"></i>
					Class
				</a>
			</li>

			<li>
				<a href="#" class="nav-link active" aria-current="page">
					<i class="bi bi-person-plus"></i>
					Personal Info
				</a>
			</li>
		</ul>
	</div>
	<div id="main" class="table-responsive">
		<h2>Student Personal Information</h2><br>
		<table class="table table-striped table-sm">
			<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">ID</th>
				<th scope="col">Name</th>
				<th scope="col">Phone</th>
				<th scope="col">major</th>
				<th scope="col">menu</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${list}" var="u" varStatus="status">
			<tr>
				<td>${fn:length(list)-status.index}</td>
				<td>${u.getId()}</td>
				<td style="cursor: pointer" onclick='window.location.href="editform.jsp?id=${u.getSeq()}"' onmouseover="mouseOver(this)"
					onmouseout="mouseOut(this)">${u.getName()}
				</td>
				<td>${u.getPhone_num()}</td>
				<td>${u.getMajor()}</td>
				<td>
					<svg style="cursor: pointer" onclick='window.location.href="editform.jsp?id=${u.getSeq()}"'
						 xmlns="http://www.w3.org/2000/svg" width="19" height="19" fill="currentColor"
						 class="bi bi-pencil-square" viewBox="0 0 16 16">
						<path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
						<path fill-rule="evenodd"
							  d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
					</svg>
					<svg style="cursor: pointer" onclick='clickme("${u.getSeq()}")' xmlns="http://www.w3.org/2000/svg" width="19"
						 height="19" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
						<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
						<path fill-rule="evenodd"
							  d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
					</svg>
				</td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<br>


	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<li class="page-item disabled">
				<a class="page-link">Previous</a>
			</li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item">
				<a class="page-link" href="#">Next</a>
			</li>
		</ul>
	</nav>
	<br>


</div>

<div class="container">
	<footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
		<div class="col-md-4 d-flex align-items-center">
			<a href="/" class="mb-3 me-2 mb-md-0 text-muted text-decoration-none lh-1">
				<img src="./img/logo.svg" alt="logo" class="bi" width="30" height="24">
				<use xlink:href="#bootstrap"></use>
				</img>
			</a>
			<span class="text-muted">© 2022 Company, Inc</span>
		</div>

		<ul class="nav col-md-4 justify-content-end list-unstyled d-flex">
			<li class="ms-3"><a class="text-muted" href="#">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-twitter"
					 viewBox="0 0 16 16">
					<path d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334 0-.14 0-.282-.006-.422A6.685 6.685 0 0 0 16 3.542a6.658 6.658 0 0 1-1.889.518 3.301 3.301 0 0 0 1.447-1.817 6.533 6.533 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.325 9.325 0 0 1-6.767-3.429 3.289 3.289 0 0 0 1.018 4.382A3.323 3.323 0 0 1 .64 6.575v.045a3.288 3.288 0 0 0 2.632 3.218 3.203 3.203 0 0 1-.865.115 3.23 3.23 0 0 1-.614-.057 3.283 3.283 0 0 0 3.067 2.277A6.588 6.588 0 0 1 .78 13.58a6.32 6.32 0 0 1-.78-.045A9.344 9.344 0 0 0 5.026 15z"/>
				</svg>
			</a></li>
			<li class="ms-3"><a class="text-muted" href="#">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
					 class="bi bi-instagram" viewBox="0 0 16 16">
					<path d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z"/>
				</svg>
			</a></li>
			<li class="ms-3"><a class="text-muted" href="#">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
					 class="bi bi-facebook" viewBox="0 0 16 16">
					<path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z"/>
				</svg>
			</a></li>


		</ul>
	</footer>
</div>


</body>
</html>
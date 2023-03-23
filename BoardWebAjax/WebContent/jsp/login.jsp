<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous" />




<title>회원 가입</title>
</head>

<body>
	<div class="container">
		<div class="mb-3 d-flex justify-content-center">
			<h1>삐따기 세상</h1>
		</div>
		<div class="mb-3">
			<h1>register</h1>
		</div>

		<form novalidate>
			<div class="mb-3">
				<label for="userName" class="form-label">UserName :</label> <input
					type="text" class="form-control" id="userName" name="userName"
					placeholder="Enter user name">
				<div class="valid-feedback">Valid</div>
				<div class="invalid-feedback">Invalid</div>
			</div>

			<div class="mb-3">
				<label for="userPassword2" class="form-label">Password: </label> <input
					type="password" class="form-control" id="userPassword"
					name="userPassword2" placeholder="confirm Password">
				<div class="valid-feedback">Valid</div>
				<div class="invalid-feedback">Invalid</div>
			</div>

		</form>
		<div class="d-flex justify-content-center">
			<button id="btnLogin" type="button" class="btn btn-primary">로그인</button>
		</div>
	</div>

	<script>
	window.onload = function() {
		document.querySelector("#btnLogin").onclick = function() {
			login();
		}
	}
	
	async function login(){
		let userName = document.querySelector("#userName").value;
		let userPassword = document.querySelector("#userPassword").value;
		
		
		//Post /user/register
		let urlParams = new URLSearchParams({
			userName : userName,
			userPassword : userPassword,
			
		});
		
		let fetchOptions = {
			method: "POST",
			body: urlParams
		}
		
		let response =await fetch("<%=contextPath%>/user/login",fetchOptions );
		let data = await response.json(); //json -> javascript object
		// data.result"success" 또는 "fail" 로 back-end 에서 받는다.
		if(data.result == "success") alert("success");
		else alert("fail");
	}
	</script>

</body>
</html>
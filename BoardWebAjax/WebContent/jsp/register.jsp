
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
				<label for="userName" class="form-label">User
					Name :</label> <input type="text" class="form-control" id="userName"
					name="userName" placeholder="Enter user name">
				<div class="valid-feedback">Valid</div>
				<div class="invalid-feedback">Invalid</div>
			</div>
			<div class="mb-3">
				<label for="userPassword" class="form-label">Password: </label> <input
					type="password" class="form-control" id="userPassword"
					name="userPassword" placeholder="Enter user password">
				<div class="valid-feedback">Valid</div>
				<div class="invalid-feedback">Invalid</div>
			</div>
			<div class="mb-3">
				<label for="userPassword2" class="form-label">Password: </label> <input
					type="password" class="form-control" id="userPassword2"
					name="userPassword2" placeholder="confirm Password">
				<div class="valid-feedback">Valid</div>
				<div class="invalid-feedback">Invalid</div>
			</div>
			<div class="mb-3">
				<label for="userEmail" class="form-label">User Email: </label> <input
					type="text" class="form-control" id="userEmail" name="userEmail"
					placeholder="Enter email">
				<div class="valid-feedback">Valid</div>
				<div class="invalid-feedback">Invalid</div>
			</div>
		</form>
		<div class="d-flex justify-content-center">
			<button id="btnRegister" type="button" class="btn btn-primary">가입</button>
		</div>
	</div>

	<script>
		//입력값에 대한 validation
		//Back-End 에 입력값 전송 (ajax - fetch)
		window.onload = function() {
			document.querySelector("#userName").focus();

			document.querySelector("#userName").onblur = function() {
				if(validateUserName(this.value)){
					this.classList.remove("is-invalid");
					this.classList.add("is-valid");
				}else {
					this.classList.remove("is-valid");
					this.classList.add("is-invalid");
				}
					
			}
			document.querySelector("#userPassword").onblur = function() {
				if(validatePassword(this.value)){
					this.classList.remove("is-invalid");
					this.classList.add("is-valid");
				}else {
					this.classList.remove("is-valid");
					this.classList.add("is-invalid");
				}
			}
			document.querySelector("#userPassword2").onblur = function() {
				if(validatePassword2(this.value)){
					this.classList.remove("is-invalid");
					this.classList.add("is-valid");
				}else {
					this.classList.remove("is-valid");
					this.classList.add("is-invalid");
				}
			}
			document.querySelector("#userEmail").onblur = function() {
				if(validateEmail(this.value)){
					this.classList.remove("is-invalid");
					this.classList.add("is-valid");
				}else {
					this.classList.remove("is-valid");
					this.classList.add("is-invalid");
				}
			}
			
			//register
			document.querySelector("#btnRegister").onclick = function() {
				if(document.querySelectorAll("form .is-invalid").length > 0){
					alert("입력이 올바르지 않습니다.")
				}else{
					register();
				}
			}

		}
		
		function validateUserName(userName){
			if(userName.length >= 4) return true;
			return false;
		}
		
		function validatePassword(userPassword){
			var patternEngAtListOne = new RegExp(/[a-zA-Z]+/);// + for at least one
			var patternSpeAtListOne = new RegExp(/[~!@#$%^&*()_+|<>?:{}]+/);// + for at least one
			var patternNumAtListOne = new RegExp(/[0-9]+/);// + for at least one
			
			if(patternEngAtListOne.test(userPassword)
					&& patternSpeAtListOne.test(userPassword) &&
					patternNumAtListOne.test(userPassword) ) return true;
			return false;
		}
		
		function validatePassword2(userPassword2){
			
			if(userPassword2 == document.querySelector("#userPassword").value) return true;
			return false;
		}
		
		function validateEmail(userEmail){
				
			let regexp = new RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);
			if(regexp.test(userEmail)) return true;
			return false;
		}
		
		async function register(){
			let userName = document.querySelector("#userName").value;
			let userPassword = document.querySelector("#userPassword").value;
			let userEmail = document.querySelector("#userEmail").value;
			
			//Post /user/register
			let urlParams = new URLSearchParams({
				userName : userName,
				userPassword : userPassword,
				userEmail: userEmail,
			});
			
			let fetchOptions = {
				method: "POST",
				body: urlParams
			}
			
			let response =await fetch("<%=contextPath%>/user/register",fetchOptions );
			let data = await response.json(); //json -> javascript object
			// data.result"success" 또는 "fail" 로 back-end 에서 받는다.
			if(data.result == "success") alert("success");
			else alert("fail");
		}
		
		
	</script>

</body>
</html>





















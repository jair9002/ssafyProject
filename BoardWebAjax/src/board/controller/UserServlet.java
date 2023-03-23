package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import board.dto.UserDto;
import board.service.UserService;
import board.service.UserServiceImpl;


@WebServlet("/user/*")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    UserService userService = UserServiceImpl.getInstance();

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(request,response);
	}

	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html); charset=utf-8");
		
		String contextPath = request.getContextPath();
		String path = request.getRequestURI().substring(contextPath.length());
		
		switch(path) {
		case "/user/register" : register(request,response);{
			System.out.println("login일때 호출됨");
			break;
		}
		case "/user/login" : login(request,response); break;
		}
		
	}

	protected void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userName = request.getParameter("userName");
		String userPassword = request.getParameter("userPassword");
		String userEmail = request.getParameter("userEmail");
		
		System.out.println("userName : "+userName);
		System.out.println("userPassowrd : "+userPassword);
		System.out.println("userEmail : "+userEmail);
		
		UserDto userDto = new UserDto();
		userDto.setUserName(userName);
		userDto.setUserPassword(userPassword);
		userDto.setUserEmail(userEmail);
		//service - dao
		int ret = userService.userRegister(userDto);
		
		//result
		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();

		if( ret == 1) {
			jsonObject.addProperty("result", "success");
		}else {
			jsonObject.addProperty("result", "fail");
		}
		String jsonStr = gson.toJson(jsonObject);
		response.getWriter().write(jsonStr);
		
	}

	protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("userName");
		String userPassword = request.getParameter("userPassword");
		
		int ret = userService.userLogin(userName,userPassword);
		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();

		if( ret == 1) {
			jsonObject.addProperty("result", "success");
		}else {
			jsonObject.addProperty("result", "fail");
			
		}
		String jsonStr = gson.toJson(jsonObject);
		response.getWriter().write(jsonStr);
	}
	
	
}

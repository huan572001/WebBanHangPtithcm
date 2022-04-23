package ptithcm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


import ptithcm.controller.loginController;

public class LoggerInterceptorAD extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("taikbao"+loginController.account.getUsername());
		if(loginController.account.getUsername()==null)
	{
		 response.sendRedirect(request.getContextPath() + "/login.htm");
		 
	}
	return true;
	}
}

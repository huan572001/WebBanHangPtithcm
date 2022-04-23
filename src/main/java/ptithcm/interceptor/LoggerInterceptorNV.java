package ptithcm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


import ptithcm.controller.loginController;

public class LoggerInterceptorNV extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if(loginController.account.getUsername()==null)
	{
		 response.sendRedirect(request.getContextPath() + "/login.htm");
		 
	}
	return true;
	}

}

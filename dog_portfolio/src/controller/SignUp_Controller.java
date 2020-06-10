package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import action.SignUp_Action;

/**
 * Servlet implementation class SignUp_Controller
 */
@WebServlet("/main/signup")
public class SignUp_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("UTF-8");

		try {
			forward = SignUp_Action.signAction(request, response);

			if (forward != null) {
				if (forward.isRedirect()) {
					response.sendRedirect(forward.getPath());
				} else {
					request.setAttribute("suc", "signup");
					RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
					dispatcher.forward(request, response);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}

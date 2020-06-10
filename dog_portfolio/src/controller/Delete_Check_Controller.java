package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import action.Check_Action;

@WebServlet("/main/delete_check")
public class Delete_Check_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");

		try {
			forward = Check_Action.deleteAction(request, response);
			
			if(forward != null) {
				if(forward.isRedirect()) {
					response.sendRedirect(forward.getPath());
				} else {
					request.setAttribute("suc", "delete");
					RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
					dispatcher.forward(request, response);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

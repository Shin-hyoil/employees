package com.hyol.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hyol.model.TitlesDao;
import com.hyol.vo.Titles;


@WebServlet("/selectPosition")
public class SelectPositionServlet extends HttpServlet {
       private TitlesDao titlesDao;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("-----selectPositionServlet-----");
		// 세션검사
		HttpSession session = request.getSession();
		if(session.getAttribute("seno") == null) {
			response.sendRedirect(request.getContextPath()+"/login");
			return;
		}
		
		titlesDao = new TitlesDao();
		List<Titles> list = titlesDao.gettitlesCountList();
		System.out.println(list.toString());
		
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/view/positionView.jsp").forward(request, response);
	}

}
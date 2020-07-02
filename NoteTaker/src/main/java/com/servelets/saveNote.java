package com.servelets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class saveNote
 */
public class saveNote extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public saveNote() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			Note note= new Note(title, content, new Date());
			Session s=FactoryProvider.getFactory().openSession();
			Transaction t=s.beginTransaction();
			s.save(note);
			t.commit();
			s.close();  // because not thread safe
			response.sendRedirect("allNotes.jsp");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}

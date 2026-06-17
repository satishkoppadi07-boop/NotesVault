package com.servlet;


import java.io.IOException;
import java.io.File;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.postDAO;
import com.Db.DBconnect;
import com.User.UserDetails;
import com.User.post;

@MultipartConfig
@WebServlet("/AddNoteServlet")
public class AddNoteServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	System.out.println("servlet called");

        HttpSession session = request.getSession();
        UserDetails user = (UserDetails) session.getAttribute("userD");
        
        System.out.println(user);
        
        if(user == null)
        {
        	response.sendRedirect("login.jsp");
        	return;
        }
        Part pdfPart = request.getPart("pdfFile");
        String fileName = pdfPart.getSubmittedFileName();

        String uploadPath = getServletContext().getRealPath("") + "pdfs";

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        pdfPart.write(uploadPath + File.separator + fileName);

        String college = request.getParameter("college");
        String branch = request.getParameter("branch");
        String semester = request.getParameter("semester");
        String content = request.getParameter("content");
        String category = request.getParameter("category");
        
        post p = new post();
        p.setCategory(category);
        p.setTitle(category);
        p.setCollege(college);
        p.setBranch(branch);
        p.setSemester(semester);
        p.setContent(content);
        p.setPdfFile(fileName);
        p.setUser(user);

        postDAO dao = new postDAO(DBconnect.getConn());
        boolean f = dao.Addnotes(p);

        if (f) {
            System.out.println("Data inserted Successfully!");
            response.sendRedirect("Home.jsp");
        } else {
            System.out.println("Data not inserted");
            response.sendRedirect("addNote.jsp");
        }
    }
}

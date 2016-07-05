package com.crunchify.jsp.servlet;
 
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.PrintWriter;
 
/**
 * @author Crunchify.com
 */
 
public class HelloCrunchify extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // reading the user input
        String latitude1 = request.getParameter("latitude1");
        String longitude1 = request.getParameter("longitude1");
        
        String latitude2 = request.getParameter("latitude2");
        String longitude2 = request.getParameter("longitude2");
        
        PrintWriter out = response.getWriter();        
        out.println ("latitude1: " + latitude1);
        out.println ("longitude1: " + longitude1);
        
        out.println ("latitude2: " + latitude2);
        out.println ("longitude2: " + longitude2);
        
        request.setAttribute("latitude1", latitude1);
        request.setAttribute("longitude1", longitude1);
        
        request.setAttribute("latitude2", latitude2);
        request.setAttribute("longitude2", longitude2);
        
        
        
        RequestDispatcher reqdisp= request.getRequestDispatcher("result.jsp");
        reqdisp.forward(request, response);
        
    }
}
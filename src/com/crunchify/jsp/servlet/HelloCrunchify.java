package com.crunchify.jsp.servlet;
 
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;

 
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
        
        Enumeration cordinateCounts = request.getAttributeNames();        
        ArrayList<String> latitudeList = new ArrayList<String>();
        ArrayList<String> longitudeList = new ArrayList<String>();   
        
       
        
        while(cordinateCounts.hasMoreElements())
        {
        	Object value = cordinateCounts.nextElement();
        	if(value.toString().contains("latitude"))
        	{
        		String valueLat =  request.getAttribute(value.toString()).toString();
        		latitudeList.add(valueLat);
        	} else {
        		String valueLng =  request.getAttribute(value.toString()).toString();
        		longitudeList.add(valueLng);
        	}   	
        	
        }
        
       
        
        String[] latitudeArr = new String[latitudeList.size()];
        String[] longitudeArr = new String[longitudeList.size()];
        
        latitudeArr = latitudeList.toArray(latitudeArr);
        longitudeArr = longitudeList.toArray(longitudeArr);
       
        System.out.println("latitudeArr is : " + latitudeArr.length);
        System.out.println("longitudeArr is : " + longitudeArr.length);       
        
        request.setAttribute("latitudeArr", latitudeArr);
        request.setAttribute("longitudeArr", longitudeArr);
        
        request.setAttribute("latitudeList", latitudeList);
        request.setAttribute("longitudeList", longitudeList);
        
        latitudeList = null;
        longitudeList = null;
        RequestDispatcher reqdisp= request.getRequestDispatcher("result.jsp");
        reqdisp.forward(request, response);
        
    }
}
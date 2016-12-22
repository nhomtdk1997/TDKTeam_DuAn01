/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javaweb.service;

import java.io.IOException;
import java.util.Date;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author DuongNguyen
 */
public class LogFilter implements Filter {
    
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("LogFilter init!");
        // Get init parameter 
        String testParam = filterConfig.getInitParameter("test-param");

        //Print the init parameter 
        System.out.println("Test Param: " + testParam);
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        // Get the IP address of client machine.   
        
        HttpServletRequest req = (HttpServletRequest) request;
     
        String remoteAddress = request.getRemoteAddr();
        String forwardedFor = req.getHeader("X-Forwarded-For");
        String realIP = req.getHeader("X-Real-IP"); // This is the header which should be used to check the IP address range.
        
        if( realIP == null )
            realIP = forwardedFor;
        if( realIP == null )
            realIP = remoteAddress;
        
//        String ipAddress, ipAddress2, ipAddress3;
//
//        InetAddress gip = InetAddress.getLocalHost();
//        ipAddress = gip.getHostAddress();
//        ipAddress2 = gip.getHostName();
       
        // Log the IP address and current timestamp.
        System.out.println("IP1Address " + realIP + ", Time "
                + new Date().toString());
        System.out.println("IP2Name " + realIP + ", Time "
                + new Date().toString());
        
        String servletPath = req.getServletPath();

        System.out.println("#INFO " + new Date()
                + " - ServletPath :" + servletPath + ", URL =" + req.getRequestURL());

        // Pass request back down the filter chain
        chain.doFilter(request, response);
    }


    @Override
    public void destroy() {
        /* Called before the Filter instance is removed 
      from service by the web container*/
    }
    
}

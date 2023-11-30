package filter;


import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


public class AuthentificationFilter implements Filter {


    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        //Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        if (httpServletRequest.getServletPath().equals("/usercheck")
                || httpServletRequest.getServletPath().equals("/register")
                || httpServletRequest.getServletPath().equals("/login")
                || httpServletRequest.getServletPath().equals("/homePage")
                || httpServletRequest.getServletPath().startsWith("/resources")
        ) {
            System.out.println("user_check");
            chain.doFilter(request, response);
        } else {

            System.out.println("not usercheck");

            HttpSession session = ((HttpServletRequest) request).getSession(false);

            if (session != null
                    && session.getAttribute("userlogin") != null) {

                //Передаем управление следующему фильтру
                chain.doFilter(request, response);
            } else {
                request.getRequestDispatcher("login.ftl").forward(request,response);

            }
        }
    }

    @Override
    public void destroy() {
       // Filter.super.destroy();
    }
}
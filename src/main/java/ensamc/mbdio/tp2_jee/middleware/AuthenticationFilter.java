package ensamc.mbdio.tp2_jee.middleware;

import jakarta.servlet.*;
import jakarta.servlet.http.*;

import java.io.IOException;

public class AuthenticationFilter implements Filter {

    @Override
    public void init(FilterConfig config) throws ServletException {
        // Initialization code if needed
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        // Check if user is logged in
        HttpSession session = httpRequest.getSession(false);
        boolean loggedIn = session != null && session.getAttribute("currentUser") != null;

        // If logged in, continue with the request
        if (loggedIn) {
            chain.doFilter(request, response);
        } else {
            // If not logged in, redirect to login page
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/login.jsp");
        }
    }

    @Override
    public void destroy() {
        // Cleanup code if needed
    }
}
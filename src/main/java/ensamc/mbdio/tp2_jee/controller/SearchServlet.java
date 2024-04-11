package ensamc.mbdio.tp2_jee.controller;

import ensamc.mbdio.tp2_jee.dao.UserDAO;
import ensamc.mbdio.tp2_jee.dto.UserDTO;
import ensamc.mbdio.tp2_jee.model.User;
import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.sql.DataSource;
import java.io.IOException;
import java.util.List;

@WebServlet("/SearchServlet")

public class SearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Resource(name = "jdbc/ENSAMC-SocialNetwork")
    private DataSource dataSource;

    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            userDAO = new UserDAO(dataSource);
        } catch (Exception exc) {
            throw new ServletException(exc);
        }
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // read the "command" parameter
            String op = req.getParameter("operation");
            // route to the appropriate method
            switch (op) {
                case "SEARCH":
                    search(req, resp);
                    break;
            }

        } catch (Exception exc) {
            throw new ServletException(exc);
        }
    }

    private void search(HttpServletRequest req, HttpServletResponse resp) {
        try {
            // Process search request
            String searchTerm = req.getParameter("searchTerm");

            User user = (User) req.getSession().getAttribute("currentUser");
            // Perform search operation
            List<UserDTO> searchResults = userDAO.searchUsersWithFriendships(user, searchTerm);


            // Forward search results to JSP
            req.getSession().setAttribute("searchResults", searchResults);

            resp.sendRedirect(req.getContextPath() + "/home/search-people.jsp");
        } catch (Exception exc) {
            exc.printStackTrace();
        }
    }
}
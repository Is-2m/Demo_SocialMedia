package ensamc.mbdio.tp2_jee.controller;

import ensamc.mbdio.tp2_jee.dao.UserDAO;
import ensamc.mbdio.tp2_jee.dto.UserDTO;
import ensamc.mbdio.tp2_jee.model.User;
import ensamc.mbdio.tp2_jee.service.FriendshipService;
import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.sql.DataSource;
import java.io.IOException;
import java.util.List;

@WebServlet("/FriendshipServlet")

public class FriendshipServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Resource(name = "jdbc/ENSAMC-SocialNetwork")
    private DataSource dataSource;
    private FriendshipService friendshipService;
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        super.init();

        try {
            friendshipService = new FriendshipService(dataSource);
            userDAO = new UserDAO(dataSource);
        } catch (Exception exc) {
            throw new ServletException(exc);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String op = req.getParameter("operation");
            // route to the appropriate method
            switch (op) {

                case "CANCEL":

                case "UNFRIEND":
                    removeFriendship(req, resp);
                    break;
                case "SEND_REQUEST":
                    sendRequest(req, resp);
                    break;
                case "ACCEPT":
                    acceptRequest(req, resp);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void acceptRequest(HttpServletRequest req, HttpServletResponse resp) {
        User sender = (User) req.getSession().getAttribute("currentUser");
        int receiverId = Integer.parseInt(req.getParameter("user_id"));
        User receiver = userDAO.getUser(receiverId);
        friendshipService.acceptRequest(sender, receiver);
        resp.setContentType("text/javascript");

        String referrer = req.getHeader("referer");
        System.out.println("the servlet was being called from here: " + referrer);


    }

    private void sendRequest(HttpServletRequest req, HttpServletResponse resp) {
        User sender = (User) req.getSession().getAttribute("currentUser");
        int receiverId = Integer.parseInt(req.getParameter("user_id"));
        User receiver = userDAO.getUser(receiverId);
        System.out.println("FriendshipServlet.sendRequest");
        System.out.println("sender = " + sender);
        System.out.println("receiver = " + receiver);
        friendshipService.sendRequest(sender, receiver);
    }

    private void removeFriendship(HttpServletRequest req, HttpServletResponse resp) {
        User user = (User) req.getSession().getAttribute("currentUser");
        int receiverId = Integer.parseInt(req.getParameter("user_id"));
        User receiver = userDAO.getUser(receiverId);
        friendshipService.removeFriendship(user, receiver);
    }

}

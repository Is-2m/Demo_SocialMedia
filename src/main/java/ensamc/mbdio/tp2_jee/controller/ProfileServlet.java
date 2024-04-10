package ensamc.mbdio.tp2_jee.controller;

import ensamc.mbdio.tp2_jee.dao.UserDAO;
import ensamc.mbdio.tp2_jee.model.User;
import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.sql.DataSource;
import java.io.IOException;

@WebServlet("/ProfileServlet")

public class ProfileServlet extends HttpServlet {


    @Resource(name = "jdbc/ENSAMC-SocialNetwork")
    private DataSource dataSource;

    private UserDAO userDbUtil;

    @Override
    public void init() throws ServletException {
        super.init();

        try {
            userDbUtil = new UserDAO(dataSource);
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

                case "PROFILE":
                    updateProfile(req, resp);
                    break;

                case "PASSWORD":
                    updatePassword(req, resp);
                    break;

                case "THEME":
                    updateTheme(req, resp);
                    break;
            }

        } catch (Exception exc) {
            throw new ServletException(exc);
        }
    }

    public void updateProfile(HttpServletRequest req, HttpServletResponse resp) {
        try {
            User currentUser = (User) req.getSession().getAttribute("currentUser");
            String firstName = req.getParameter("firstName");
            String lastName = req.getParameter("lastName");
            String phone = req.getParameter("phone");
            String birthDate = req.getParameter("birthDate");

            currentUser.setFirstName(firstName);
            currentUser.setLastName(lastName);
            currentUser.setPhone(phone);
            currentUser.setBirthDate(birthDate);

            req.getSession().setAttribute("currentUser", currentUser);
            userDbUtil.updateUser(currentUser);

            resp.sendRedirect("edit_profile.jsp");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public void updatePassword(HttpServletRequest req, HttpServletResponse resp) {
        try {
            User currentUser = (User) req.getSession().getAttribute("currentUser");
            String password = req.getParameter("oldPassword");
            String newPassword = req.getParameter("newPassword");
            if (password == null || password.isEmpty()) {
                resp.sendRedirect("edit_password.jsp");
                return;
            }
            if (!currentUser.getPassword().equals(password)) {
                resp.sendRedirect("edit_password.jsp");
                return;
            }

            currentUser.setPassword(newPassword);

            req.getSession().setAttribute("currentUser", currentUser);

            userDbUtil.updatePassword(currentUser);

            resp.sendRedirect("edit_profile.jsp");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public void updateTheme(HttpServletRequest req, HttpServletResponse resp) {
        try {
            String theme = req.getParameter("theme");

            //save the theme in cookies
            if (theme != null) {
                Cookie theCookie = new Cookie("myApp.currentTheme", theme);
                theCookie.setMaxAge(3600 * 24 * 365);
                resp.addCookie(theCookie);
            }

            resp.sendRedirect("edit_profile.jsp");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}

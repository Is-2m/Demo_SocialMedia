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

    private static final long serialVersionUID = 1L;

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

                case "ABOUT_ME":
                    updateAboutMe(req, resp);
                    break;
            }

        } catch (Exception exc) {
            throw new ServletException(exc);
        }
    }

    private void updateAboutMe(HttpServletRequest req, HttpServletResponse resp) {
        try {
            User currentUser = (User) req.getSession().getAttribute("currentUser");
            String aboutMe = req.getParameter("aboutMe");
            String otherName = req.getParameter("otherName");
            String favoriteQuote = req.getParameter("favoriteQuote");

            currentUser.setAboutMe(aboutMe);
            currentUser.setOtherName(otherName);
            currentUser.setFavoriteQuote(favoriteQuote);

            if (userDbUtil.updateAboutMe(currentUser)) {
                req.getSession().setAttribute("currentUser", currentUser);
            }
            resp.sendRedirect(req.getContextPath() + "/home/edit-profile.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateProfile(HttpServletRequest req, HttpServletResponse resp) {
        try {
            User currentUser = (User) req.getSession().getAttribute("currentUser");
            String firstName = req.getParameter("firstName");
            String lastName = req.getParameter("lastName");
            String phone = req.getParameter("phone");
            String birthDate = req.getParameter("birthDate");
            String gender = req.getParameter("gender");
            String address = req.getParameter("address");

            currentUser.setFirstName(firstName.isEmpty() ? currentUser.getFirstName() : firstName);
            currentUser.setLastName(lastName.isEmpty() ? currentUser.getLastName() : lastName);
            currentUser.setPhone(phone.isEmpty() ? currentUser.getPhone() : phone);
            currentUser.setBirthDate(birthDate.isEmpty() ? currentUser.getBirthDate() : birthDate);
            currentUser.setGender(gender.isEmpty() ? currentUser.getGender() : gender);
            currentUser.setAddress(address);

            if (userDbUtil.updateUser(currentUser)) {
                req.getSession().setAttribute("currentUser", currentUser);
            }
            resp.sendRedirect(req.getContextPath() + "/home/edit-profile.jsp");
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
                resp.sendRedirect(req.getContextPath() + "/home/edit-profile.jsp");
                return;
            }
            if (!currentUser.getPassword().equals(password)) {
                resp.sendRedirect(req.getContextPath() + "/home/edit-profile.jsp");
                return;
            }

            currentUser.setPassword(newPassword);

            if (userDbUtil.updatePassword(currentUser)) {
                req.getSession().setAttribute("currentUser", currentUser);
            }

            resp.sendRedirect(req.getContextPath() + "/home/edit-profile.jsp");

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

}

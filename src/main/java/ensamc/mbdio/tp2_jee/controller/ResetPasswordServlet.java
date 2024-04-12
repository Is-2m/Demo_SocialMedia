package ensamc.mbdio.tp2_jee.controller;

import ensamc.mbdio.tp2_jee.model.User;
import ensamc.mbdio.tp2_jee.service.PasswordResetService;
import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.sql.DataSource;
import java.io.IOException;

@WebServlet("/reset_password")
public class ResetPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Resource(name = "jdbc/ENSAMC-SocialNetwork")
    DataSource dataSource;
    PasswordResetService passwordResetService;

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            passwordResetService = new PasswordResetService(dataSource);
        } catch (Exception exc) {
            throw new ServletException(exc);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String operation = req.getParameter("op");
        if (operation.equals("RST_PWD")) {
            resetPassword(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String operation = req.getParameter("operation");
        switch (operation) {
            case "SEND_TOKEN":
                sendToken(req, resp);
                break;
            case "CHANGE_PWD":
                changePassword(req, resp);
                break;
            default:
                break;
        }
    }

    private void changePassword(HttpServletRequest req, HttpServletResponse resp) {
        passwordResetService.changePassword(req.getParameter("token"), req.getParameter("newPassword"));
        try {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void sendToken(HttpServletRequest req, HttpServletResponse resp) {
        try {
            String email = req.getParameter("email");
            if (passwordResetService.sendTokenEmail(email, req)) {
                req.setAttribute("success", "true");

                RequestDispatcher dispatcher = req.getRequestDispatcher( "/recover-password.jsp");
                dispatcher.forward(req, resp);
            } else {
                resp.sendRedirect(req.getContextPath() + "/error404.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void resetPassword(HttpServletRequest req, HttpServletResponse resp) {
        try {
            String token = req.getParameter("token");
            User user = passwordResetService.checkTokenValidity(token);
            if (user != null) {
                req.setAttribute("token", token);

                RequestDispatcher dispatcher = req.getRequestDispatcher("/reset-password.jsp");
                dispatcher.forward(req, resp);

            } else {
                resp.sendRedirect(req.getContextPath() + "/error404.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}

package ensamc.mbdio.tp2_jee.service;

import ensamc.mbdio.tp2_jee.dao.TokenDAO;
import ensamc.mbdio.tp2_jee.dao.UserDAO;
import ensamc.mbdio.tp2_jee.model.Token;
import ensamc.mbdio.tp2_jee.model.User;
import jakarta.servlet.http.HttpServletRequest;

import javax.sql.DataSource;
import java.security.SecureRandom;
import java.util.Base64;

public class PasswordResetService {
    DataSource dataSource;
    TokenDAO tokenDAO;
    UserDAO userDAO;

    public PasswordResetService(DataSource dataSource) {
        this.dataSource = dataSource;
        this.tokenDAO = new TokenDAO(dataSource);
        this.userDAO = new UserDAO(dataSource);
    }

    public boolean sendTokenEmail(String email, HttpServletRequest request) {
        User user = userDAO.getUserByEmail(email);
        if (user != null) {
            String token = generateToken();
            String name = user.getFirstName() + " " + user.getLastName();
            String resetLink = request.getContextPath() + "/reset_password?op=RST_PWD&token=" + token;
            MailSender.sendEmail(email, "Reset Your Password for ENSAMC SN", MailSender.passwordResetEmail(name, resetLink, 24));
            return tokenDAO.createToken(token, user);
        }
        return false;
    }

    public User checkTokenValidity(String token) {
        Token tk = tokenDAO.checkTokenValidity(token);

        if (tk != null && tk.getExpirationDate() > (System.currentTimeMillis() / 1000)) {
            return userDAO.getUserByEmail(tk.getEmail());
        }
//        else {
//            tokenDAO.deleteToken(token);
//        }
        return null;
    }

    public void changePassword(String token, String password) {
        Token tk = tokenDAO.checkTokenValidity(token);
        if (tk != null && tk.getExpirationDate() > System.currentTimeMillis() / 1000) {
            User user = userDAO.getUserByEmail(tk.getEmail());
            tokenDAO.deleteToken(token);
            user.setPassword(password);
            userDAO.updatePassword(user);
        } else {
            tokenDAO.deleteToken(token);
        }

    }

    private String generateToken() {
        int length = 100;
        // Generate a random token
        SecureRandom secureRandom = new SecureRandom();
        Base64.Encoder base64Encoder = Base64.getUrlEncoder();

        byte[] randomBytes = new byte[length];
        secureRandom.nextBytes(randomBytes);

        return base64Encoder.encodeToString(randomBytes);

    }
}

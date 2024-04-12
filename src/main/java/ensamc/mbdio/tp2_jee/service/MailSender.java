package ensamc.mbdio.tp2_jee.service;


import jakarta.mail.*;
import jakarta.mail.internet.AddressException;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

import java.util.Properties;

public class MailSender {

    public static void sendEmail(String recipient, String subject, String body) {
        // Assuming you are sending email from localhost
        String host = "smtp.gmail.com"; // Specify the SMTP host

        // Get system properties
        Properties properties = System.getProperties();

        properties.setProperty("mail.smtp.host", host);
        properties.put("mail.smtp.port", "587"); // SMTP port number
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true"); // Enable TLS

        // Get the default Session object
        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("touristguidebooking@gmail.com", "jueuzajznfxizbro");
            }
        });

        try {
            // Create a default MimeMessage object
            MimeMessage message = new MimeMessage(session);

            // Set From: header field
            message.setFrom(new InternetAddress("touristguidebooking@gmail.com"));

            // Set To: header field
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));

            // Set Subject: header field
            message.setSubject(subject);

            // Now set the actual message
            message.setContent(body, "text/html; charset=utf-8");
//            message.setText(body,"text/html; charset=utf-8");

            // Send message
            Transport.send(message);
            System.out.println("Sent message successfully....");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static String friendRequestEmail(String senderName, String senderProfileLink, String recipientName) {
        return "<!DOCTYPE html>\n" +
                "<html>\n" +
                "<head>\n" +
                "    <style>\n" +
                "        body { font-family: Arial, sans-serif; }\n" +
                "        .email-container { max-width: 600px; margin: 20px auto; padding: 20px; border: 1px solid #ccc; border-radius: 5px; }\n" +
                "        .email-heading { font-size: 18px; margin-bottom: 20px; }\n" +
                "        .email-body { margin-bottom: 20px; }\n" +
                "        .email-cta { text-align: center; }\n" +
                "        .email-footer { font-size: 16px; text-align: center; margin-top: 20px; color: #888; }\n" +
                "    </style>\n" +
                "</head>\n" +
                "<body>\n" +
                "    <div class=\"email-container\">\n" +
                "        <div class=\"email-heading\">New Friend Request on ENSAMC Social Network!</div>\n" +
                "        <div class=\"email-body\">\n" +
                "            Hi " + recipientName + ",<br><br>\n" +
                "            " + senderName + " has sent you a friend request on ENSAMC Social Network! They think you'd be a great connection.<br><br>\n" +
                "            You can view their profile here: <a href=\"" + senderProfileLink + "\">" + senderName + "'s Profile</a><br><br>\n" +
                "            <br>\n" +
                "            If you're not interested in connecting, you can simply ignore this email.\n" +
                "        </div>\n" +
                "        <div class=\"email-footer\">\n" +
                "            Happy networking!<br>\n" +
                "            The ENSAMC Social Network Team\n" +
                "        </div>\n" +
                "    </div>\n" +
                "</body>\n" +
                "</html>\n";
    }

    public static String friendRequestAcceptedEmail(String recipientName, String senderName, String senderProfileLink) {
        String viewProfileLink = "#"; // Include token for verification

        return "<!DOCTYPE html>\n" +
                "<html>\n" +
                "<head>\n" +
                "    <style>\n" +
                "        body { font-family: Arial, sans-serif; }\n" +
                "        .email-container { max-width: 600px; margin: 20px auto; padding: 20px; border: 1px solid #ccc; border-radius: 5px; }\n" +
                "        .email-heading { font-size: 18px; margin-bottom: 20px; }\n" +
                "        .email-body { margin-bottom: 20px; }\n" +
                "        .email-footer { font-size: 16px; text-align: center; margin-top: 20px; color: #888; }\n" +
                "    </style>\n" +
                "</head>\n" +
                "<body>\n" +
                "    <div class=\"email-container\">\n" +
                "        <div class=\"email-heading\">Great news!</div>\n" +
                "        <div class=\"email-body\">\n" +
                "            Hi " + recipientName + ",<br><br>\n" +
                "            Great news! You and " + senderName + " are now friends on ENSAMC Social Network! <br><br>\n" +
                "            Start connecting by sending them a message or checking out their profile: <a href=\"" + viewProfileLink + "\">" + senderName + "'s Profile</a><br><br>\n" +
                "            We hope you enjoy making new connections on ENSAMC Social Network!<br><br>\n" +
                "            The ENSAMC Social Network Team\n" +
                "        </div>\n" +
                "        <div class=\"email-footer\">\n" +
                "            Happy networking!<br>\n" +
                "            The ENSAMC Social Network Team\n" +
                "        </div>\n" +
                "    </div>\n" +
                "</body>\n" +
                "</html>\n";
    }

    public static String passwordResetEmail(String userName, String resetLink, int expiryDuration) {
        return "<!DOCTYPE html>\n" +
                "<html>\n" +
                "<head>\n" +
                "    <style>\n" +
                "        body { font-family: Arial, sans-serif; }\n" +
                "        .email-container { max-width: 600px; margin: 20px auto; padding: 20px; border: 1px solid #ccc; border-radius: 5px; }\n" +
                "        .email-heading { font-size: 18px; margin-bottom: 20px; }\n" +
                "        .email-body { margin-bottom: 20px; }\n" +
                "        .email-cta { text-align: center; }\n" +
                "        .email-footer { font-size: 16px; text-align: center; margin-top: 20px; color: #888; }\n" +
                "    </style>\n" +
                "</head>\n" +
                "<body>\n" +
                "    <div class=\"email-container\">\n" +
                "        <div class=\"email-heading\">Reset Your Password for ENSAMC Social Network</div>\n" +
                "        <div class=\"email-body\">\n" +
                "            Hi " + userName + ",<br><br>\n" +
                "            We received a request to reset your password for your account on ENSAMC Social Network.<br><br>\n" +
                "            If you requested this password reset, please click the link below to set a new password:<br><br>\n" +
                "            <a href=\"" + resetLink + "\">Reset Password Link</a><br><br>\n" +
                "            This link will expire in " + expiryDuration + " hours. If you did not request a password reset, you can safely ignore this email.<br><br>\n" +
                "            If you're having trouble resetting your password, please contact us at the nearest train station :/ <br><br>\n" +
                "            Thanks,<br>\n" +
                "            The ENSAMC Social Network Team\n" +
                "        </div>\n" +
                "        <div class=\"email-footer\">\n" +
                "        </div>\n" +
                "    </div>\n" +
                "</body>\n" +
                "</html>\n";
    }

}

package ensamc.mbdio.tp2_jee.service;

import ensamc.mbdio.tp2_jee.dao.FriendshipDAO;
import ensamc.mbdio.tp2_jee.dao.UserDAO;
import ensamc.mbdio.tp2_jee.model.Friendship;
import ensamc.mbdio.tp2_jee.model.User;
import jakarta.servlet.http.HttpServletRequest;

import javax.sql.DataSource;
import java.util.List;

public class FriendshipService {
    private DataSource dataSource;
    private FriendshipDAO friendshipDAO;
    private UserDAO userDAO = new UserDAO(dataSource);

    public FriendshipService(DataSource dataSource) {
        this.dataSource = dataSource;
        friendshipDAO = new FriendshipDAO(dataSource);
    }


    public boolean acceptRequest(User sender, User receiver) {
        if (friendshipDAO.acceptFriendship(sender, receiver)) {
            String senderName = receiver.getFirstName() + " " + receiver.getLastName();
            String receiverName = receiver.getFirstName() + " " + receiver.getLastName();
            String subject = "It's official! You're now friends with " + senderName + " on ENSAMC Social Network!";
            MailSender.sendEmail(receiver.getEmail(), subject, MailSender.friendRequestAcceptedEmail(receiverName, senderName, "#"));
            return true;
        }
        return false;
    }

    public boolean sendRequest(User sender, User receiver) {
        if (friendshipDAO.addFriendship(sender, receiver)) {
            String senderName = receiver.getFirstName() + " " + receiver.getLastName();
            String receiverName = receiver.getFirstName() + " " + receiver.getLastName();
            MailSender.sendEmail(receiver.getEmail(), "Friend Request on ENSAMC Social Network!", MailSender.friendRequestEmail(senderName, "#", receiverName));
            return true;
        }
        return false;
    }

    public boolean removeFriendship(User sender, User receiver) {
        return friendshipDAO.removeFriendship(sender, receiver);
    }

    public static void fetchFriendRequests(HttpServletRequest request, DataSource dataSource) {
        FriendshipDAO friendshipDAO = new FriendshipDAO(dataSource);
        User user = (User) request.getSession().getAttribute("currentUser");
        List<Friendship> friendRequests = friendshipDAO.getFriendships(user);
        request.getSession().setAttribute("friendRequests", friendRequests);
    }

}

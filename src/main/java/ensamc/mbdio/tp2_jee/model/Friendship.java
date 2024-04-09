package ensamc.mbdio.tp2_jee.model;
public class Friendship {
    private User sender;
    private User receiver;
    private FriendshipState state;

    public Friendship() {
    }

    public Friendship(User sender, User receiver, FriendshipState state) {
        this.sender = sender;
        this.receiver = receiver;
        this.state = state;
    }

    public User getSender() {
        return sender;
    }

    public void setSender(User sender) {
        this.sender = sender;
    }

    public User getReceiver() {
        return receiver;
    }

    public void setReceiver(User receiver) {
        this.receiver = receiver;
    }

    public FriendshipState getState() {
        return state;
    }

    public void setState(FriendshipState state) {
        this.state = state;
    }
}

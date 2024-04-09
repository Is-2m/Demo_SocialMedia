package ensamc.mbdio.tp2_jee.model;

public class Message extends Resource {
    private String content;

    public Message() {
    }

    public Message(String name, Post post, ResourceType type, String content) {
        super(name, post, type);
        this.content = content;
    }
    public Message(String content) {
        this.content = content;
    }

    public Message(int id, String name, Post post, ResourceType type, String content) {
        super(id, name, post, type);
        this.content = content;
    }



    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "Message{" +
                "content='" + content + '\'' +
                '}';
    }
}

package ensamc.mbdio.tp2_jee.model;
public abstract class Resource {
    private int id;
    private String name;
    private Post post;
    private ResourceType type;

    public Resource() {
    }

    public Resource(String name, Post post, ResourceType type) {
        this.name = name;
        this.post = post;
        this.type = type;
    }

    public Resource(int id, String name, Post post, ResourceType type) {
        this.id = id;
        this.name = name;
        this.post = post;
        this.type = type;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }

    public ResourceType getType() {
        return type;
    }

    public void setType(ResourceType type) {
        this.type = type;
    }
    public Message asMessage() {
        return (Message) this;
    }

    @Override
    public String toString() {
        return "Resource{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", post=" + post.getId() +
                ", type=" + type +
                '}';
    }
}

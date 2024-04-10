package ensamc.mbdio.tp2_jee.model;


import org.ocpsoft.prettytime.PrettyTime;

import java.time.Instant;
import java.util.Date;
import java.util.List;

public class Post {
    private int id;
    private User user;
    private Long date;
    private Date time;
    private List<ResourceModel> resourceModels;

    public Post() {
    }

    public Post(User user, Long date, Date time, List<ResourceModel> resourceModels) {
        this.user = user;
        this.date = date;
        this.time = time;
        this.resourceModels = resourceModels;
    }

    public Post(User user, Long date, List<ResourceModel> resourceModels) {
        this.user = user;
        this.date = date;
        this.resourceModels = resourceModels;
    }

    public Post(int id, User user, Long date, Date time, List<ResourceModel> resourceModels) {
        this.id = id;
        this.user = user;
        this.date = date;
        this.time = time;
        this.resourceModels = resourceModels;
    }

    public Post(int id, User user, Long date, List<ResourceModel> resourceModels) {
        this.id = id;
        this.user = user;
        this.date = date;
        this.time = time;
        this.resourceModels = resourceModels;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Long getDate() {
        return date;
    }

    public void setDate(Long date) {
        this.date = date;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public List<ResourceModel> getResources() {

        return resourceModels;
    }

    public void setResources(List<ResourceModel> resourceModels) {
        this.resourceModels = resourceModels;
    }

    public String getTimeAgo() {
        return new PrettyTime().format(Instant.ofEpochSecond(this.date));

    }

    @Override
    public String toString() {
        return "Post{" +
                "id=" + id +
                ", user=" + user +
                ", date=" + date +
                ", time=" + time +
                ", resources=" + resourceModels +
                '}';
    }
}
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
    private List<Resource> resources;

    public Post() {
    }

    public Post(User user, Long date, Date time, List<Resource> resources) {
        this.user = user;
        this.date = date;
        this.time = time;
        this.resources = resources;
    }

    public Post(User user, Long date, List<Resource> resources) {
        this.user = user;
        this.date = date;
        this.resources = resources;
    }

    public Post(int id, User user, Long date, Date time, List<Resource> resources) {
        this.id = id;
        this.user = user;
        this.date = date;
        this.time = time;
        this.resources = resources;
    }

    public Post(int id, User user, Long date, List<Resource> resources) {
        this.id = id;
        this.user = user;
        this.date = date;
        this.time = time;
        this.resources = resources;
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

    public List<Resource> getResources() {

        return resources;
    }

    public void setResources(List<Resource> resources) {
        this.resources = resources;
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
                ", resources=" + resources +
                '}';
    }
}
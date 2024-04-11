package ensamc.mbdio.tp2_jee.service;

import ensamc.mbdio.tp2_jee.dao.PostDAO;
import ensamc.mbdio.tp2_jee.model.Post;
import ensamc.mbdio.tp2_jee.model.User;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;

import javax.sql.DataSource;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Objects;

public class PostService {

    public static void fetchFriendPosts(HttpServletRequest req, DataSource dataSource) {
        PostDAO postDAO = new PostDAO(dataSource);
        User user = (User) req.getSession().getAttribute("currentUser");

        List<Post> posts = postDAO.getFriendPosts(user);
        Collections.sort(posts, new Comparator<Post>() {
            public int compare(Post o1, Post o2) {
                if (Objects.equals(o1.getDate(), o2.getDate()))
                    return 0;
                return o1.getDate() < o2.getDate() ? 1 : -1;
            }
        });
        req.getSession().setAttribute("friendsPosts", posts);
    }
}

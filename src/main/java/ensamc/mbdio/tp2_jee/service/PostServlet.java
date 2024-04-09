package ensamc.mbdio.tp2_jee.service;

import ensamc.mbdio.tp2_jee.dao.PostDAO;
import ensamc.mbdio.tp2_jee.model.Message;
import ensamc.mbdio.tp2_jee.model.Post;
import ensamc.mbdio.tp2_jee.model.User;
import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.sql.DataSource;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/PostServlet")
public class PostServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Resource(name = "jdbc/ENSAMC-SocialNetwork")
    private DataSource dataSource;

    private PostDAO postDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            postDAO = new PostDAO(dataSource);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle GET requests here
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Read the "operation" parameter
            String operation = request.getParameter("operation");

            // Route to the appropriate method
            switch (operation) {
                case "CREATE_POST":
                    createPost(request, response);
                    break;
                // Add more cases for other operations if needed
                default:
                    // Handle unknown operation
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid operation");
                    break;
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void createPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Post p = new Post();
        p.setDate(System.currentTimeMillis() / 1000);
        p.setUser((User) request.getSession().getAttribute("currentUser"));

        List<ensamc.mbdio.tp2_jee.model.Resource> resources = new ArrayList<>();
        Message m = new Message();
        m.setContent(request.getParameter("content"));
        m.setType(ensamc.mbdio.tp2_jee.model.ResourceType.MESSAGE);
        resources.add(m);
        p.setResources(resources);
        if (postDAO.createPost(p)) {
            System.out.println("Post created successfully");
//            response.sendRedirect("home.jsp");
        } else {
            System.out.println("Failed to create post");
//            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to create post");
        }

    }
}

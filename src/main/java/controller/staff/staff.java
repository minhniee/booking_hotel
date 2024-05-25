package controller.staff;

import java.io.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
// notion can change name servlet(reason to keep form package)

@WebServlet(name = "staffServlet", value = "/staff-servlet")
public class staff extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("</body></html>");
    }

    public void destroy() {
    }
}
package controller.user;

import java.io.IOException;
import java.util.Properties;
import jakarta.mail.*;
import jakarta.mail.internet.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.Email;

@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        // Email configuration
        String host = "smtp.gmail.com";
        final String user = "thatlavailonnn@gmail.com";
        final String password = "ewaa uigm dmyq rtoj";

        String to = "thieuducdung254@gmail.com";


        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getDefaultInstance(props,
                new jakarta.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(user, password);
                    }
                });


        try {
            MimeMessage msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(user));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            msg.setSubject("Contact Form Submission from " + name);
            msg.setText("Name: " + name + "\nPhone: " + phone + "\nEmail: " + email + "\n\nMessage:\n" + message);


            Transport.send(msg);


            request.setAttribute("message", "Thank you for contacting us! Your message has been sent.");

        } catch (MessagingException e) {
            e.printStackTrace();
            request.setAttribute("message", "There was an error sending your message. Please try again later.");
        }

        request.getRequestDispatcher("contact.jsp").forward(request, response);
    }
}

package controller.user;

import util.Email;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet("/contact")
public class ContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form parameters
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        // Validate input
        String errorMsg = validateInput(name, email, phone, subject, message);
        if (!errorMsg.isEmpty()) {
            request.setAttribute("message", errorMsg);
            request.setAttribute("alertClass", "alert-danger");
            request.getRequestDispatcher("homePage/contact.jsp").forward(request, response);
            return;
        }

        // Capitalize the first letter of each word in the name
        name = capitalizeWords(name);

        // Construct the email content
        String emailContent = "<p>Name: " + name + "</p>"
                + "<p>Email: " + email + "</p>"
                + "<p>Phone: " + phone + "</p>"
                + "<p>Subject: " + subject + "</p>"
                + "<p>Message: " + message + "</p>";

        // Send the email
        boolean emailSent = Email.sendEmail("thieuducdung254@gmail.com", subject, emailContent);

        // Set response based on email send status
        if (emailSent) {
            request.setAttribute("message", "Your message was sent successfully.");
            request.setAttribute("alertClass", "alert-success");
        } else {
            request.setAttribute("message", "There was an error sending your message. Please try again.");
            request.setAttribute("alertClass", "alert-danger");
        }

        // Forward to contact.jsp
        request.getRequestDispatcher("homePage/contact.jsp").include(request, response);
    }

    private String validateInput(String name, String email, String phone, String subject, String message) {
        StringBuilder errorMsg = new StringBuilder();

        if (name == null || name.isEmpty()) {
            errorMsg.append("Name is required. ");
        }
        if (email == null || email.isEmpty() || !isValidEmail(email)) {
            errorMsg.append("Valid email is required. ");
        }
        if (phone == null || phone.isEmpty() || !isValidPhone(phone)) {
            errorMsg.append("Valid phone number is required. ");
        }
        if (subject == null || subject.isEmpty()) {
            errorMsg.append("Subject is required. ");
        }
        if (message == null || message.isEmpty()) {
            errorMsg.append("Message is required. ");
        }

        return errorMsg.toString();
    }

    private boolean isValidEmail(String email) {
        String emailRegex = "^[A-Za-z0-9+_.-]+@(.+)$";
        Pattern pattern = Pattern.compile(emailRegex);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }

    private boolean isValidPhone(String phone) {
        String phoneRegex = "^[0-9]{10}$";
        Pattern pattern = Pattern.compile(phoneRegex);
        Matcher matcher = pattern.matcher(phone);
        return matcher.matches();
    }

    private String capitalizeWords(String str) {
        String[] words = str.split("\\s+");
        StringBuilder capitalized = new StringBuilder();
        for (String word : words) {
            if (word.length() > 0) {
                capitalized.append(Character.toUpperCase(word.charAt(0)))
                        .append(word.substring(1).toLowerCase())
                        .append(" ");
            }
        }
        return capitalized.toString().trim();
    }
}

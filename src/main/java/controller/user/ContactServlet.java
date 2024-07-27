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

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        Email em = new Email();
        String emailContent = "<!DOCTYPE html>\n" +
                "<html lang=\"en\">\n" +
                "<head>\n" +
                "    <meta charset=\"UTF-8\">\n" +
                "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
                "    <title>Thank You for Registering at Renager</title>\n" +
                "    <link rel=\"stylesheet\" href=\"https://fonts.googleapis.com/css2?family=Barlow&amp;family=Barlow+Condensed&amp;family=Gilda+Display&amp;display=swap\">\n" +
                "\n" +
                "</head>\n" +
                "<body style=\"font-family: Barlow, sans-serif; line-height: 1.6;\">\n" +
                "    <table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\n" +
                "        <tr>\n" +
                "            <td align=\"center\">\n" +
                "                <table width=\"600\" cellpadding=\"20\" cellspacing=\"0\" border=\"0\" style=\"border: 1px solid #dddddd; border-radius: 5px; margin-top: 20px;\">\n" +
                "                    <tr>\n" +
                "                        <td align=\"center\" style=\"background-color: #F8F5F0; color: black;\">\n" +
                "                            <h1>Thank You for Registering at Renager</h1>\n" +
                "                        </td>\n" +
                "                    </tr>\n" +
                "                    <tr>\n" +
                "                        <td style=\"background-color: #ffffff; color: #333333;\">\n" +
                "                            <p>Dear <strong>You</strong>,</p>\n" +
                "                            <p>We sincerely thank you for registering at <strong>Renager</strong>. Your interest and support are great encouragement for us in providing the best services.</p>\n" +
                "                            <p><strong>Here are the benefits of being our member:</strong></p>\n" +
                "                            <ul>\n" +
                "                                <li><strong>Exclusive Offers:</strong> Receive information about promotional programs and special offers exclusive to members.</li>\n" +
                "                                <li><strong>Easy Booking Management:</strong> Access and manage your bookings conveniently and easily.</li>\n" +
                "                                <li><strong>Latest Updates:</strong> Stay updated with the newest services and amenities of the hotel.</li>\n" +
                "                            </ul>\n" +
                "                            <p>We are always ready to listen and serve you. If you have any questions or need assistance, please contact us via email at <a href=\"mailto:renager.hotel@gmail.com\">renager.hotel@gmail.com</a> or call us at <strong>031234567</strong>.</p>\n" +
                "                            <p>Sincerely,</p>\n" +
                "                            <p><strong>Le Quang Minh</strong><br>\n" +
                "                            Manager <br>\n" +
                "                            Renager Hotel<br>\n" +
                "                            Thach That, Hoa Lac<br>\n" +
                "                            <a href=\"mailto:[Email Address]\">renager.hotel@gmail.com</a><br>\n" +
                "                            031234567<br>\n" +
                "                            <!-- <a href=\"[Hotel Website]\">[Hotel Website]</a></p> -->\n" +
                "                        </td>\n" +
                "                    </tr>\n" +
                "                    <tr>\n" +
                "                        <td align=\"center\" style=\"background-color: #f9f9f9; color: #999999; font-size: 12px;\">\n" +
                "                            <p>You are receiving this email because you registered at Renager Hotel. If you no longer wish to receive these emails, please <a href=\"[Unsubscribe Link]\">unsubscribe</a>.</p>\n" +
                "                        </td>\n" +
                "                    </tr>\n" +
                "                </table>\n" +
                "            </td>\n" +
                "        </tr>\n" +
                "    </table>\n" +
                "</body>\n" +
                "</html>\n";
        em.sendEmail(email,"Welcome!",emailContent);


        request.getRequestDispatcher("home").forward(request, response);
    }

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
//        String emailContent = "<p>Name: " + name + "</p>"
//                + "<p>Email: " + email + "</p>"
//                + "<p>Phone: " + phone + "</p>"
//                + "<p>Subject: " + subject + "</p>"
//                + "<p>Message: " + message + "</p>";
        String emailContent = "<div style=\"font-family: Arial, sans-serif; color: #333;\">"
                + "<h2 style=\"color: #4CAF50;\">Contact Form Submission</h2>"
                + "<p><strong>Name:</strong> " + name + "</p>"
                + "<p><strong>Email:</strong> " + email + "</p>"
                + "<p><strong>Phone:</strong> " + phone + "</p>"
                + "<p><strong>Subject:</strong> " + subject + "</p>"
                + "<p><strong>Message:</strong></p>"
                + "<div style=\"border: 1px solid #ddd; padding: 10px; background-color: #f9f9f9;\">"
                + "<p>" + message + "</p>"
                + "</div>"
                + "</div>";

        // Send the email
        boolean emailSent = Email.sendEmail("minhlqhe172686@fpt.edu.vn", subject, emailContent);

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

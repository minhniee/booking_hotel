package controller.booking;

import DAO.bookingDAO;
import model.Account;
import model.Booking;
import util.Email;

import java.util.Timer;

public class TimerTask {
       protected static Timer timer = new Timer();
    public static  void timerRejectBooking(Booking booking, Account account, String state, int time){
        System.out.println("Timer start");
        bookingDAO bookingDAO = new bookingDAO();
        timer.schedule(new java.util.TimerTask() {
            @Override
            public void run() {
                timer.cancel();
                timer =new Timer();
                bookingDAO.updateStateBooking(booking.getId(),state);

                Email.sendEmail(account.getEmail(), "Payment has expired",content(account.getFullName()));
            }
        },time*1000);
    }

    private static String content(String cusName){
        return "<!DOCTYPE html>\n" +
                "<html>\n" +
                "<head>\n" +
                "    <title>Payment Expired</title>\n" +
                "<link rel=\"stylesheet\" href=\"https://fonts.googleapis.com/css2?family=Barlow&amp;family=Barlow+Condensed&amp;family=Gilda+Display&amp;display=swap\">"+
                "    <style>\n" +
                "        body {\n" +
                "            font-family: Barlow, sans-serif;\n" +
                "            margin: 0;\n" +
                "            padding: 0;\n" +
                "            background-color: #f2f2f2;\n" +
                "        }\n" +
                "        .container {\n" +
                "            width: 100%;\n" +
                "            max-width: 600px;\n" +
                "            margin: 0 auto;\n" +
                "            background-color: #ffffff;\n" +
                "            padding: 20px;\n" +
                "            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\n" +
                "        }\n" +
                "        .header {\n" +
                "            background-color: #FF0000;\n" +
                "            color: #ffffff;\n" +
                "            padding: 10px 20px;\n" +
                "            text-align: center;\n" +
                "        }\n" +
                "        .content {\n" +
                "            padding: 20px;\n" +
                "        }\n" +
                "        .button {\n" +
                "            display: inline-block;\n" +
                "            padding: 10px 20px;\n" +
                "            font-size: 16px;\n" +
                "            color: #ffffff;\n" +
                "            background-color: #007BFF;\n" +
                "            text-align: center;\n" +
                "            text-decoration: none;\n" +
                "            border-radius: 5px;\n" +
                "            margin-top: 20px;\n" +
                "        }\n" +
                "        .footer {\n" +
                "            text-align: center;\n" +
                "            padding: 10px;\n" +
                "            font-size: 12px;\n" +
                "            color: #888888;\n" +
                "        }\n" +
                "    </style>\n" +
                "</head>\n" +
                "<body>\n" +
                "    <div class=\"container\">\n" +
                "        <div class=\"header\">\n" +
                "            <h1>Payment Expired</h1>\n" +
                "        </div>\n" +
                "        <div class=\"content\">\n" +
                "            <p>Dear "+ cusName+ ",</p>\n" +
                "            <p>We regret to inform you that your payment for the room booking has expired. Please click the button below to retry the payment:</p>\n" +
                "              <a href=\"mailto:renager.hotel@gmail.com\">renager.hotel@gmail.com</a><br>\n" +
                "            <p>If you have any questions or need further assistance, feel free to reply to this email.</p>\n" +
                "            <p>We apologize for any inconvenience this may have caused and appreciate your prompt attention to this matter.</p>\n" +
                "            <p>Thank you!</p>\n" +
                "            <p>Best regards,</p>\n" +
                "            <p>Renager</p>\n" +
                "        </div>\n" +
                "        <div class=\"footer\">\n" +
                "            <p>&copy; 2024 [Your Company Name]. All rights reserved.</p>\n" +
                "            <p>Renager</p>\n" +
                "        </div>\n" +
                "    </div>\n" +
                "</body>\n" +
                "</html>\n";
    }

}

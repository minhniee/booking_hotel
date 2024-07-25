/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.util.Date;
import java.util.Properties;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

public class Email {

    static final String email = "renager.hotel@gmail.com";
    static final String password = "rdvf biks gtvy luij";

    public static boolean sendEmail(String to, String title, String content) {
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        Authenticator authenticator = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(email, password);
            }

        };

        // Create session
        Session session = Session.getInstance(properties, authenticator);

        // Create message
        MimeMessage message = new MimeMessage(session);

        try {

            //type content
            message.addHeader("Content-type", "text/HTML; charset=UTF-8");

            //from
            message.setFrom(email);

            //to
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));

            //subject email
            message.setSubject(title);

            //Day send
            message.setSentDate(new Date());

            //content
            message.setContent(content, "text/HTML; cconharset=UTF-8");

            //send email
            Transport.send(message);
            System.out.println("Send email success");
            return true;
        } catch (Exception e) {
            System.out.println("Something wrong");
            e.printStackTrace();
            return false;
        }
    }

    public static void main(String[] args) {
        sendEmail("thatlavailonnn@gmail.com","ok","ok");
    }
}

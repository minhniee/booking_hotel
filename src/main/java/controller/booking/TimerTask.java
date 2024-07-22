package controller.booking;

import DAO.bookingDAO;

import java.util.Timer;

public class TimerTask {
       protected static Timer timer = new Timer();
    public static  void timerRejectBooking(String bookngId, String state,int time){
        System.out.println("Timer start");
        bookingDAO bookingDAO = new bookingDAO();
        timer.schedule(new java.util.TimerTask() {
            @Override
            public void run() {
                timer.cancel();
                timer =new Timer();
                bookingDAO.updateStateBooking(bookngId,state);
//                roomDAO.updateRoomStatus(roomId, state);
            }
        },time*1000);
    }

}

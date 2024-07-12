//package controller.booking;
//
//import DAO.roomDAO;
//
//import java.util.Timer;
//
//public class TimerTask {
//       protected static Timer timer = new Timer();
//    public static  void doCaculateCheckout(String roomId, String state){
//        roomDAO roomDAO = new roomDAO();
//        timer.schedule(new java.util.TimerTask() {
//            @Override
//            public void run() {
//                timer.cancel();
//                timer =new Timer();
//                roomDAO.updateRoomStatus(roomId, state);
//            }
//        },5*1000);
//    }
//
//}

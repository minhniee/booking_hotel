//package controller.booking;
//
//import DAO.roomDAO;
//
//import java.util.concurrent.Executors;
//import java.util.concurrent.ScheduledExecutorService;
//import java.util.concurrent.TimeUnit;
//import java.sql.SQLException;
//
//public class RoomStatusScheduler {
//
//    private static final long DELAY = 5 * 60 * 1000; // 5 phút tính bằng milliseconds
//
//    public static void startScheduler() {
//        ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);
//
//        scheduler.scheduleAtFixedRate(() -> {
//            try {
//               new roomDAO().rollbackRooms();
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//        }, 0, 1, TimeUnit.MINUTES); // Kiểm tra mỗi phút
//    }
//}

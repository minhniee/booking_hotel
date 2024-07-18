package controller.service;

import java.io.*;
import java.util.List;

import DAO.CartDAO;
import DAO.ServiceDAO;
import DAO.bookingDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.*;

@WebServlet(name = "CartControllerServlet", value = "/cart")
public class CartController extends HttpServlet {
    private CartDAO cartDAO = new CartDAO();
    private ServiceDAO serviceDAO = new ServiceDAO();
    private bookingDAO bookingDAO = new bookingDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {


            Account account = (Account) request.getSession().getAttribute("account");
            if (account == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            Cart cart = cartDAO.getCartByAccountId(account.getId());
            request.setAttribute("cart", cart);

            List<Booking> bookingList = bookingDAO.getAllBookingsAvailableByAccount(account.getId());
            request.setAttribute("bookingList", bookingList);

            request.getRequestDispatcher("services/cart.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        Account account = (Account) request.getSession().getAttribute("account");
        if (account == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Cart cart = cartDAO.getCartByAccountId(account.getId());

        if (action != null) {
            switch (action) {
                case "add":
                    addServiceToCart(request, cart);
                    doGet(request, response);
                    return;
                case "update":
                    updateCartItemQuantity(request, cart);
                    break;
                case "delete":
                    deleteCartItem(request, cart);
                    break;
            }
        }
//        response.sendRedirect("cart");

        String message = (String) request.getAttribute("message");
        if(message != null) {
            sendJsonResponse(response, message, false);
        }else{
            sendJsonResponse(response, message, true);
        }
    }

    private void sendJsonResponse(HttpServletResponse response, String message, boolean success) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print("{\"message\":\"" + message + "\", \"success\":" + success + "}");
        out.flush();
    }

    private void addServiceToCart(HttpServletRequest request, Cart cart) {
        String serviceId = request.getParameter("serviceId");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        Service service = serviceDAO.getServiceById(serviceId);
        Account user = (Account) request.getSession().getAttribute("account");
        if (cart == null) {
            if (service.getQuantity() >= 1) {
                //add cart
                cart = new Cart(user.getId(), service.getPrice() * quantity);
                cart = cartDAO.addCart(cart);
                //add cart item
                cartDAO.addCartItem(new CartItem(0, cart.getId(), serviceId, quantity, service));

                //update quantity service
                service.setQuantity(service.getQuantity() - quantity);
                serviceDAO.updateQuantityService(service);
            } else {
                //not enough
                request.setAttribute("message", "Not enough quantity");
            }
        } else {

            CartItem cartItem = new CartItem(0, cart.getId(), serviceId, quantity, service);
            CartItem cartItemExisted = cartDAO.getCartItemByCartAndService(cartItem);
            if (cartItemExisted != null &&  quantity <= service.getQuantity()) {
                cartItemExisted.setQuantity(cartItemExisted.getQuantity() + quantity);
                cartDAO.updateCartItem(cartItemExisted);

                //update cart
                cart.setCartItems(cartDAO.getCartItemsByCartId(cart.getId()));
                updateCartTotalAmount(cart);

                //update quantity service
                service.setQuantity(service.getQuantity() - quantity);
                serviceDAO.updateQuantityService(service);
            } else if (cartItemExisted == null && service.getQuantity() >= quantity) {
                cartDAO.addCartItem(cartItem);

                //update cart
                cart.setCartItems(cartDAO.getCartItemsByCartId(cart.getId()));
                updateCartTotalAmount(cart);

                //update quantity service
                service.setQuantity(service.getQuantity() - quantity);
                serviceDAO.updateQuantityService(service);
            } else {
                // not enough quantity
                request.setAttribute("message", "Not enough quantity");
            }

        }
    }

    private void updateCartItemQuantity(HttpServletRequest request, Cart cart) {
        int cartItemId = Integer.parseInt(request.getParameter("cartItemId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        CartItem cartItem = cartDAO.getCartItemsByCartId(cart.getId()).stream()
                .filter(item -> item.getId() == cartItemId)
                .findFirst()
                .orElse(null);

        if (cartItem != null) {
            Service service = serviceDAO.getServiceById(cartItem.getServiceId());
            if (quantity <= (service.getQuantity() + cartItem.getQuantity())) {
                //update quantity service
                service.setQuantity(service.getQuantity() + cartItem.getQuantity() - quantity);
                serviceDAO.updateQuantityService(service);

                //update cart item
                cartItem.setQuantity(quantity);
                cartDAO.updateCartItem(cartItem);

                //update cart
                cart.setCartItems(cartDAO.getCartItemsByCartId(cart.getId()));
                updateCartTotalAmount(cart);
            } else {
                // not enough quantity
                request.setAttribute("message", "Not enough quantity");
            }
        }
    }

    private void deleteCartItem(HttpServletRequest request, Cart cart) {
        int cartItemId = Integer.parseInt(request.getParameter("cartItemId"));
        CartItem cartItem = cartDAO.getCartItemsByCartId(cart.getId()).stream()
                .filter(item -> item.getId() == cartItemId)
                .findFirst()
                .orElse(null);

        //update quantity service
        Service service = serviceDAO.getServiceById(cartItem.getServiceId());
        service.setQuantity(service.getQuantity() + cartItem.getQuantity());
        serviceDAO.updateQuantityService(service);

        //delete cart item
        cartDAO.deleteCartItem(cartItemId);

        //update cart
        cart.setCartItems(cartDAO.getCartItemsByCartId(cart.getId()));
        updateCartTotalAmount(cart);
    }

    private void updateCartTotalAmount(Cart cart) {
        double totalAmount = cart.getCartItems().stream()
                .mapToDouble(item -> item.getQuantity() * item.getService().getPrice())
                .sum();
        cart.setTotalAmount(totalAmount);
        cartDAO.updateCartTotalAmount(cart.getId(), totalAmount);
    }

}
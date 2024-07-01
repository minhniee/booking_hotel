package controller.service;

import java.io.*;

import DAO.ServiceDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Account;
import model.Cart;
import model.CartItem;
import model.Service;

@WebServlet(name = "CartControllerServlet", value = "/cart")
public class CartController extends HttpServlet {
    private ServiceDAO serviceDAO = new ServiceDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        if (account == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "add":
                    addToCart(request, cart);
                    break;
                case "remove":
                    removeFromCart(request, cart);
                    break;
                case "update":
                    updateCart(request, cart);
                    break;
            }
        }

        request.setAttribute("cart", cart);
        request.getRequestDispatcher("services/cart.jsp").forward(request, response);
    }

    private void addToCart(HttpServletRequest request, Cart cart) {
        String serviceId = request.getParameter("serviceId");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        Service service = serviceDAO.getServiceById(serviceId);
        if (service != null) {
            CartItem cartItem = new CartItem(service, quantity);
            cart.addItem(cartItem);
        }
    }

    private void removeFromCart(HttpServletRequest request, Cart cart) {
        String serviceId = request.getParameter("serviceId");
        cart.removeItem(serviceId);
    }

    private void updateCart(HttpServletRequest request, Cart cart) {
        String serviceId = request.getParameter("serviceId");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        for (CartItem item : cart.getItems()) {
            if (item.getService().getId().equals(serviceId)) {
                item.setQuantity(quantity);
                break;
            }
        }
    }
}
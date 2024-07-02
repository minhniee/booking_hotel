package controller.service;

import java.io.*;

import DAO.CartDAO;
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
    private CartDAO cartDAO = new CartDAO();
    private ServiceDAO serviceDAO = new ServiceDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Account account = (Account) request.getSession().getAttribute("account");
        if (account == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Cart cart = cartDAO.getCartByAccountId(account.getId());
        request.setAttribute("cart", cart);
        request.getRequestDispatcher("services/cart.jsp").forward(request, response);
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
                    break;
                case "update":
                    updateCartItemQuantity(request, cart);
                    break;
                case "delete":
                    deleteCartItem(request, cart);
                    break;
            }
        }
        response.sendRedirect("cart");
    }

    private void addServiceToCart(HttpServletRequest request, Cart cart) {
        String serviceId = request.getParameter("serviceId");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        Service service = serviceDAO.getServiceById(serviceId);

        if (cart == null) {
            cart = new Cart();
            cart.setAccountId(((Account) request.getSession().getAttribute("account")).getId());
            cart.setTotalAmount(0.0);
            cartDAO.addCartItem(new CartItem(0, cart.getId(), serviceId, quantity, service));
        } else {
            CartItem cartItem = new CartItem(0, cart.getId(), serviceId, quantity, service);
            cartDAO.addCartItem(cartItem);
        }

        updateCartTotalAmount(cart);
    }

    private void updateCartItemQuantity(HttpServletRequest request, Cart cart) {
        int cartItemId = Integer.parseInt(request.getParameter("cartItemId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        CartItem cartItem = cartDAO.getCartItemsByCartId(cart.getId()).stream()
                .filter(item -> item.getId() == cartItemId)
                .findFirst()
                .orElse(null);

        if (cartItem != null) {
            cartItem.setQuantity(quantity);
            cartDAO.updateCartItem(cartItem);
            updateCartTotalAmount(cart);
        }
    }

    private void deleteCartItem(HttpServletRequest request, Cart cart) {
        int cartItemId = Integer.parseInt(request.getParameter("cartItemId"));
        cartDAO.deleteCartItem(cartItemId);
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
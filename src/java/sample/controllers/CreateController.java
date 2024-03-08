/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.user.UserDAO;
import sample.user.UserDTO;
import sample.user.UserError;

/**
 *
 * @author admin
 */
@WebServlet(name = "CreateController", urlPatterns = {"/CreateController"})
public class CreateController extends HttpServlet {
    private static final String ERROR = "createUser.jsp";
    private static final String SUCCESS = "login.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url=ERROR;
        UserError userError = new UserError();
        try {
            boolean checkValidation = true;
            UserDAO dao = new UserDAO();
            String userId = request.getParameter("userID");
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String roleID = request.getParameter("roleID");
            String password = request.getParameter("password");
            String confirm = request.getParameter("confirm");
            if(userId.length()>10 || userId.length()<2){
                checkValidation=false;
                userError.setUserIDError("UserID must be in [2..10]");
            }
//            boolean checkDuplicate = dao.checkDuplicate(userId);
//            if(checkDuplicate){
//                checkValidation=false;
//                userError.setUserIDError("UserId is already exist!");
//                
//            }
            if(fullName.length()>20||fullName.length()<5){
                checkValidation=false;
                userError.setFullNameError("Full Name must be in [5..20]");
            }
            if(!password.equals(confirm)){
                checkValidation=false;
                userError.setConfirmError("Password must be the same");
            }
            if (checkValidation){
                UserDTO user = new UserDTO(userId, password, fullName, email, phone, roleID);
//                boolean checkInsert = dao.insert(user);
                boolean checkInsert = dao.insertv2(user);
                if(checkInsert){
                    url=SUCCESS;
                }else{
                    request.setAttribute("ERROR", "Undefine Error!");
                }
            }else{
                request.setAttribute("USER_ERROR", userError);
            }
        }catch (Exception e){
            log("Error at CreateController: " + e.toString());
            if(e.toString().contains("duplicate")){
                userError.setUserIDError("Trung khoa chinh");            
                request.setAttribute("USER_ERROR", userError);
            }
        }finally{
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

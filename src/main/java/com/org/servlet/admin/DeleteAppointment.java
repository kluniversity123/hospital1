package com.org.servlet.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.org.dao.AppointmentDao;

@WebServlet("/delete_appointment")
public class DeleteAppointment extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the appointment ID from the request
        String appointmentId = request.getParameter("appointmentId");
        HttpSession session = request.getSession();  // Session to store feedback messages

        if (appointmentId != null) {
            try {
                int id = Integer.parseInt(appointmentId);  // Convert to integer

                AppointmentDao dao = new AppointmentDao();  // Create DAO object
                boolean isDeleted = dao.deleteAppointmentById(id);  // Call the DAO method

                // Redirect based on success or failure of deletion
                if (isDeleted) {
                    session.setAttribute("succMsg", "Appointment deleted successfully.");
                    response.sendRedirect("view_appointments.jsp");
                } else {
                    session.setAttribute("errorMsg", "Failed to delete appointment.");
                    response.sendRedirect("view_appointments.jsp");
                }
            } catch (NumberFormatException e) {
                session.setAttribute("errorMsg", "Invalid appointment ID.");
                response.sendRedirect("view_appointments.jsp");
            }
        } else {
            session.setAttribute("errorMsg", "Appointment ID is missing.");
            response.sendRedirect("view_appointments.jsp");
        }
    }
}

package com.org.servlet.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.org.dao.FeedbackDao;
import com.org.entity.Feedback;

public class FeedbackServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public FeedbackServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int doctorId = Integer.parseInt(request.getParameter("doct"));
        String treatmentFeedback = request.getParameter("treatmentFeedback");
        int rating = Integer.parseInt(request.getParameter("rating"));
        String recommendation = request.getParameter("recommend");

        Feedback feedback = new Feedback();
        feedback.setDoctorId(doctorId);
        feedback.setTreatmentFeedback(treatmentFeedback);
        feedback.setRating(rating);
        feedback.setRecommendation(recommendation);

        FeedbackDao feedbackDao = new FeedbackDao();
        feedbackDao.addFeedback(feedback);

        response.sendRedirect("view_feedback.jsp");
    }
}

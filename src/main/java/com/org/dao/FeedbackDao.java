package com.org.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.org.entity.Feedback;
import com.org.helper.ConnectionHelper;

public class FeedbackDao {

    private Connection con;

    public FeedbackDao() {
        this.con = ConnectionHelper.getConObj();
    }

    public List<Feedback> getAllFeedback() {
        List<Feedback> feedbackList = new ArrayList<>();
        String query = "SELECT * FROM feedback";

        try (PreparedStatement stmt = con.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setId(rs.getInt("id"));
                feedback.setDoctorId(rs.getInt("doctor_id"));
                feedback.setTreatmentFeedback(rs.getString("treatment_feedback"));
                feedback.setRating(rs.getInt("rating"));
                feedback.setRecommendation(rs.getString("recommendation"));
                feedback.setCreatedAt(rs.getTimestamp("created_at"));
                feedbackList.add(feedback);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return feedbackList;
    }

    public void addFeedback(Feedback feedback) {
        String query = "INSERT INTO feedback (doctor_id, treatment_feedback, rating, recommendation, created_at) VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setInt(1, feedback.getDoctorId());
            stmt.setString(2, feedback.getTreatmentFeedback());
            stmt.setInt(3, feedback.getRating());
            stmt.setString(4, feedback.getRecommendation());
            stmt.setTimestamp(5, new Timestamp(System.currentTimeMillis()));

            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteFeedback(int feedbackId) {
        String query = "DELETE FROM feedback WHERE id = ?";

        try (PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setInt(1, feedbackId);
            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

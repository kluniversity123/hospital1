package com.org.entity;

import java.sql.Timestamp;

public class Feedback {
    private int id;
    private int doctorId;
    private String treatmentFeedback;
    private int rating;
    private String recommendation;
    private Timestamp createdAt;

    // Constructor (optional)
    public Feedback() {}

    public Feedback(int id, int doctorId, String treatmentFeedback, int rating, String recommendation, Timestamp createdAt) {
        this.id = id;
        this.doctorId = doctorId;
        this.treatmentFeedback = treatmentFeedback;
        this.rating = rating;
        this.recommendation = recommendation;
        this.createdAt = createdAt;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(int doctorId) {
        this.doctorId = doctorId;
    }

    public String getTreatmentFeedback() {
        return treatmentFeedback;
    }

    public void setTreatmentFeedback(String treatmentFeedback) {
        this.treatmentFeedback = treatmentFeedback;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getRecommendation() {
        return recommendation;
    }

    public void setRecommendation(String recommendation) {
        this.recommendation = recommendation;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    @Override
    public String toString() {
        return "Feedback{" +
                "id=" + id +
                ", doctorId=" + doctorId +
                ", treatmentFeedback='" + treatmentFeedback + '\'' +
                ", rating=" + rating +
                ", recommendation='" + recommendation + '\'' +
                ", createdAt=" + createdAt +
                '}';
    }
}

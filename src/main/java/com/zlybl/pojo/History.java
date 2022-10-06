package com.zlybl.pojo;

import java.util.Date;

public class History {
    private int history_id;
    private int bookId;
    private int userId;
    private Date borrowedTime;
    private Date returnedTime;

    public History() {
    }

    public History(int history_id, int bookId, int userId, Date borrowedTime, Date returnedTime) {
        this.history_id = history_id;
        this.bookId = bookId;
        this.userId = userId;
        this.borrowedTime = borrowedTime;
        this.returnedTime = returnedTime;
    }

    public int getHistory_id() {
        return history_id;
    }

    public void setHistory_id(int history_id) {
        this.history_id = history_id;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getBorrowedTime() {
        return borrowedTime;
    }

    public void setBorrowedTime(Date borrowedTime) {
        this.borrowedTime = borrowedTime;
    }

    public Date getReturnedTime() {
        return returnedTime;
    }

    public void setReturnedTime(Date returnedTime) {
        this.returnedTime = returnedTime;
    }

    @Override
    public String toString() {
        return "History{" +
                "history_id=" + history_id +
                ", bookId=" + bookId +
                ", userId=" + userId +
                ", borrowedTime=" + borrowedTime +
                ", returnedTime=" + returnedTime +
                '}';
    }
}

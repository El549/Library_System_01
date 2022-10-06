package com.zlybl.pojo;

public class Book {
    private int bookId;
    private String bookCover; //封面url
    private String bookName;
    private String author;
    private String press;
    private String bookClass;
    private Boolean bookStatus; //借还情况

    public Book() {
    }

    public Book(int bookId, String bookCover, String bookName, String author, String press, String bookClass, Boolean bookStatus) {
        this.bookId = bookId;
        this.bookCover = bookCover;
        this.bookName = bookName;
        this.author = author;
        this.press = press;
        this.bookClass = bookClass;
        this.bookStatus = bookStatus;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public String getBookCover() {
        return bookCover;
    }

    public void setBookCover(String bookCover) {
        this.bookCover = bookCover;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press;
    }

    public String getBookClass() {
        return bookClass;
    }

    public void setBookClass(String bookClass) {
        this.bookClass = bookClass;
    }

    public Boolean getBookStatus() {
        return bookStatus;
    }

    public void setBookStatus(Boolean bookStatus) {
        this.bookStatus = bookStatus;
    }

    @Override
    public String toString() {
        return "Book{" +
                "bookId=" + bookId +
                ", bookCover='" + bookCover + '\'' +
                ", bookName='" + bookName + '\'' +
                ", author='" + author + '\'' +
                ", press='" + press + '\'' +
                ", bookClass='" + bookClass + '\'' +
                ", bookStatus=" + bookStatus +
                '}';
    }
}

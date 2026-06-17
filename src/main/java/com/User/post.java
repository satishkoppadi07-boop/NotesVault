package com.User;

import java.sql.Timestamp;

public class post {
    private int id; 
    private String title; 
    private String content;
    private Timestamp pdate;
    private UserDetails user;
    private String category;
    private String pdfFile;
    private String college;
    private String branch;
    private String semester;

    public post(int id, String title, String content, Timestamp pdate, UserDetails user) {
        super();
        this.id = id;
        this.title = title;
        this.content = content;
        this.pdate = pdate;
        this.user = user;
    }

    public post() {
        super();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getPdate() {
        return pdate;
    }

    public void setPdate(Timestamp timestamp) {
        this.pdate = timestamp;
    }

    public UserDetails getUser() {
        return user;
    }

    public void setUser(UserDetails user) {
        this.user = user;
    }
    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
    public String getPdfFile() {
    	return pdfFile;
    }
    public void setPdfFile(String pdfFile) {
    	this.pdfFile = pdfFile;    }
    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }
}

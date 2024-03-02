/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author HUY
 */
public class Grade {
    private int id;
    private String name;
    private String type;
    private GradeCate cate;
    private GradeDetail detail;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public GradeCate getCate() {
        return cate;
    }

    public void setCate(GradeCate cate) {
        this.cate = cate;
    }

    public GradeDetail getDetail() {
        return detail;
    }

    public void setDetail(GradeDetail detail) {
        this.detail = detail;
    }
    
    
    
}

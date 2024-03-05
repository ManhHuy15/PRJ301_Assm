/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author HUY
 */
public class Groups {

    private int id;
    private String name;
    private Course couse;
    private Instructor ins;
    private Term term;
    private ArrayList<Student> listStudent;

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

    public Course getCouse() {
        return couse;
    }

    public void setCouse(Course couse) {
        this.couse = couse;
    }

    public Instructor getIns() {
        return ins;
    }

    public void setIns(Instructor ins) {
        this.ins = ins;
    }

    public Term getTerm() {
        return term;
    }

    public void setTerm(Term term) {
        this.term = term;
    }

    public ArrayList<Student> getListStudent() {
        return listStudent;
    }

    public void setListStudent(ArrayList<Student> listStudent) {
        this.listStudent = listStudent;
    }

}

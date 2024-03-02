/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;
/**
 *
 * @author HUY
 */
public class Session {
    private int id;
    private int status;
    private Groups group;
    private Instructor ins;
    private Course course;
    private TimeSlot slot;
    private String room;
    private Date dateTime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Groups getGroup() {
        return group;
    }

    public void setGroup(Groups group) {
        this.group = group;
    }

    public Instructor getIns() {
        return ins;
    }

    public void setIns(Instructor ins) {
        this.ins = ins;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public TimeSlot getSlot() {
        return slot;
    }

    public void setSlot(TimeSlot slot) {
        this.slot = slot;
    }

    public String getRoom() {
        return room;
    }

    public void setRoom(String room) {
        this.room = room;
    }

    public Date getDateTime() {
        return dateTime;
    }

    public void setDateTime(Date dateTime) {
        this.dateTime = dateTime;
    }
    
    
}

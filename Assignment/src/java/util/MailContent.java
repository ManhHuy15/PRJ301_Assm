/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import model.Groups;
import model.Student;

/**
 *
 * @author HUY
 */
public class MailContent {

    public static String warningAbsent(Student stu, Groups g, int numCourse, int numAbsent) {
        float percent = Math.round(((float) numAbsent / numCourse) * 100.0);
        String msg = "<!DOCTYPE html>\n"
                + "<html lang=\"en\">\n"
                + "<head>\n"
                + "    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n"
                + "</head>"
                + "<body>\n"
                + "     <h3>Dear: " + stu.getFname() + " " + stu.getMname() + " " + stu.getLname() + "</h3>\n"
                + "      Student Code: " + stu.getCode() + "\n"
                + "            Report your status attendance as follows: Course " + g.getCouse().getName() + ": " + percent + "% absent-" + "Absent: " + numAbsent + "/" + numCourse + "</br>\n"
                + "            Please note that you should attend class diligently in the near future to ensure the conditions for taking the final exam ( attend more than or equals 80%)\n"
                + "</body>\n"
                + "</html>";
        return msg;
    }

    public static String overAbsent(Student stu, Groups g, int numCourse, int numAbsent) {
        float percent = Math.round(((float) numAbsent / numCourse) * 100.0);
        String msg = "<!DOCTYPE html>\n"
                + "<html lang=\"en\">\n"
                + "<head>\n"
                + "    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n"
                + "</head>"
                + "<body>\n"
                + "<h3>Dear: " + stu.getFname() + " " + stu.getMname() + " " + stu.getLname() + "</h3>\n"
                + "      Student Code: " + stu.getCode() + "\n"
                + "            Report your status attendance as follows: Course " + g.getCouse().getName() + ": " + percent + "% absent-" + "Absent: " + numAbsent + "/" + numCourse + "</br>\n"
                + "            Leave more than the allowed number of sessions( attend more than 80%).do not qualify to take the final exam\n"
                + "</body>\n"
                + "</html>";
        return msg;
    }

}

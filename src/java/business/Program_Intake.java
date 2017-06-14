/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package business;

/**
 *
 * @author xmore mmohz
 */
public class Program_Intake extends PersonalInformation {
    int user_id;
    String enddate;
    String startdate;
    String academicyear;
    String intakename;
    String courseid;
    String course_category;
    
    public Program_Intake(){
         super();
        course_category="";
       courseid="";
        user_id=0;
        enddate="";
        startdate="";
        academicyear="";
        intakename="";
        
    }

    public String getCourse_category() {
        return course_category;
    }

    public void setCourse_category(String course_category) {
        this.course_category = course_category;
    }

    public String getCourseid() {
        return courseid;
    }

    public void setCourseid(String courseid) {
        this.courseid = courseid;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int username_id) {
        this.user_id = username_id;
    }

    public String getEnddate() {
        return enddate;
    }

    public void setEnddate(String enddate) {
        this.enddate = enddate;
    }

    public String getStartdate() {
        return startdate;
    }

    public void setStartdate(String startdate) {
        this.startdate = startdate;
    }

    public String getAcademicyear() {
        return academicyear;
    }

    public void setAcademicyear(String academicyear) {
        this.academicyear = academicyear;
    }

    public String getIntakename() {
        return intakename;
    }

    public void setIntakename(String intakename) {
        this.intakename = intakename;
    }
    
    
}

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
public class EducationBackground {

    private int user_id;
    private String courseStudient;
    private String nameOfCerticate;
    private String yearFrom;
    private String yearTo;
    private String qualification;
    private String institutionName;
    private String indexNo;
    private String physicalChallenge;

    public EducationBackground() {
        user_id = 0;
        physicalChallenge = "";
        courseStudient = "";
        nameOfCerticate = "";
        yearFrom = "";
        qualification = "";
        institutionName = "";
        yearTo = "";
        indexNo = "";

    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int appicant_national_id) {
        this.user_id = appicant_national_id;
    }

    public String getPhysicalChallenge() {
        return physicalChallenge;
    }

    public void setPhysicalChallenge(String physicalChallenge) {
        this.physicalChallenge = physicalChallenge;
    }

    public String getIndexNo() {
        return indexNo;
    }

    public void setIndexNo(String indexNo) {
        this.indexNo = indexNo;
    }

    public String getCourseStudient() {
        return courseStudient;
    }

    public void setCourseStudient(String courseStudient) {
        this.courseStudient = courseStudient;
    }

    public String getNameOfCerticate() {
        return nameOfCerticate;
    }

    public void setNameOfCerticate(String nameOfCerticate) {
        this.nameOfCerticate = nameOfCerticate;
    }

    public String getYearFrom() {
        return yearFrom;
    }

    public void setYearFrom(String yearFrom) {
        this.yearFrom = yearFrom;
    }

    public String getYearTo() {
        return yearTo;
    }

    public void setYearTo(String yearTo) {
        this.yearTo = yearTo;
    }

    public String getQualification() {
        return qualification;
    }

    public void setQualification(String gradeScored) {
        this.qualification = gradeScored;
    }

    public String getInstitutionName() {
        return institutionName;
    }

    public void setInstitutionName(String institutionName) {
        this.institutionName = institutionName;
    }

}

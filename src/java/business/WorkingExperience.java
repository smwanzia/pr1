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
public class WorkingExperience {

    private int userid;
    private String organizationName;
    private String postHeld;
    private String town;
    private String date_from;
    private String date_to;

    public WorkingExperience() {
        userid= 0;
        organizationName = "";
        postHeld = "";
        date_from = "";
        date_to = "";
    }

    public int getUserId() {
        return userid;
    }

    public void setUserId(int nationalId) {
        this.userid = nationalId;
    }

    public String getOrganizationName() {
        return organizationName;
    }

    public void setOrganizationName(String organizationName) {
        this.organizationName = organizationName;
    }

    public String getPostHeld() {
        return postHeld;
    }

    public void setPostHeld(String postHeld) {
        this.postHeld = postHeld;
    }

    public String getTown() {
        return town;
    }

    public void setTown(String town) {
        this.town = town;
    }

    public String getDate_from() {
        return date_from;
    }

    public void setDate_from(String date_from) {
        this.date_from = date_from;
    }

    public String getDate_to() {
        return date_to;
    }

    public void setDate_to(String date_to) {
        this.date_to = date_to;
    }

}

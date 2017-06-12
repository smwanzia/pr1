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
public class Sponsor {
    int userid;
  String name;
  String town;
  String Address;
  String phoneNumber;
  String fax;
  
 public Sponsor(){
    userid=0;
    name="";
    town="";
    Address="";
    phoneNumber="";
    fax="";
    
  }

    public int getUserId() {
        return userid;
    }

    public void setUserId(int id) {
        this.userid= id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTown() {
        return town;
    }

    public void setTown(String town) {
        this.town = town;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }
 
}

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
public class CourseFees {
   String  feeitemId;
   String yearofstudy;
   double amount;
   String semOfstudy;
   String feeitemname;
           
    public CourseFees(){
        feeitemId="";
       yearofstudy="";
        amount=0.00;
        semOfstudy="";
        feeitemname="";
    }

    public String getFeeitemname() {
        return feeitemname;
    }

    public void setFeeitemname(String feeitemname) {
        this.feeitemname = feeitemname;
    }

    public String getFeeitemId() {
        return feeitemId;
    }

    public void setFeeitemId(String feeitemId) {
        this.feeitemId = feeitemId;
    }

    public String getYearofstudy() {
        return yearofstudy;
    }

    public void setYearofstudy(String yearofstudy) {
        this.yearofstudy = yearofstudy;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getSemOfstudy() {
        return semOfstudy;
    }

    public void setSemOfstudy(String semOfstudy) {
        this.semOfstudy = semOfstudy;
    }
    
}

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
public class AuditTrail {

    private int itemId;
    private String userName;
    private String itemCode;
    private String action;
    private String remarks;
    private String recordCreated;

    public AuditTrail() {
        itemId = 0;
        userName = "";
        itemCode = "";
        action = "";
        remarks = "";
        recordCreated = "";
    }

    public void SetItemId(int itemId) {
        this.itemId = itemId;
    }

    public int getItemId() {
        return itemId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getItemCode() {
        return itemCode;
    }

    public void setItemCode(String itemCode) {
        this.itemCode = itemCode;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getRecordCreated() {
        return recordCreated;
    }

    public void setRecordCreated(String recordCreated) {
        this.recordCreated = recordCreated;
    }

}

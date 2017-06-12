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
public class Users {

    private String username;
    private String roles;
    private String password;
    private String login_time;
    private String accountState;
    private int userId;
    private String record_creator;
    private String phone_number;
    private String alternate_phone_number;
    private String email_address;

    private String firstname;
    private String lastname;

    public Users() {
        username = "";
        roles = "";
        login_time = "";
        accountState = "";
        password = "";
        userId = 0;
        phone_number = "";
        email_address = "";
        alternate_phone_number = "";
        firstname = "";
        lastname = "";
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRoles() {
        return roles;
    }

    public void setRoles(String roles) {
        this.roles = roles;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getLogin_time() {
        return login_time;
    }

    public void setLogin_time(String login_time) {
        this.login_time = login_time;
    }

    public String getAccountState() {
        return accountState;
    }

    public void setAccountState(String accountState) {
        this.accountState = accountState;
    }

    public String getRecord_creator() {
        return record_creator;
    }

    public void setRecord_creator(String record_creator) {
        this.record_creator = record_creator;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getAlternate_phone_number() {
        return alternate_phone_number;
    }

    public void setAlternate_phone_number(String alternate_phone_number) {
        this.alternate_phone_number = alternate_phone_number;
    }

    public String getEmail_address() {
        return email_address;
    }

    public void setEmail_address(String email_address) {
        this.email_address = email_address;
    }

}

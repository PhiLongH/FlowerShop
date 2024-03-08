/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.user;

/**
 *
 * @author ungca
 */
public class UserDTO {

    private String userID;
    private String password;
    private String fullName;
    private String email;
    private String phone;
    private String roleID;
    

    public UserDTO() {
        this.fullName ="";
        this.userID ="";
        this.roleID ="";
        this.email="";
        this.phone="";
        this.password ="";
    }

    public UserDTO(String userID, String password, String fullName, String email, String phone, String roleID) {
        this.userID = userID;
        this.password = password;
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.roleID = roleID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    
    

}

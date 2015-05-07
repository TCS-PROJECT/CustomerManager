/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Model;

/**
 *
 * @author Bach Canh Ki
 */
public class Customer {
    private String id;
    private String name;
    private String address;
    private String gender;
    private String dob;
    private String married;
    private String status;
    private String startDate;
    private String endDate;
    private String income;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getMarried() {
        return married;
    }

    public void setMarried(String married) {
        this.married = married;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getIncome() {
        return income;
    }

    public void setIncome(String income) {
        this.income = income;
    }

    public Customer(String id, String name, String address, String gender, String dob, String married, String status, String startDate, String endDate, String income) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.gender = gender;
        this.dob = dob;
        this.married = married;
        this.status = status;
        this.startDate = startDate;
        this.endDate = endDate;
        this.income = income;
    }
    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccessLayer;

import java.text.SimpleDateFormat;

import Model.Customer;
import Model.User;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author BCK
 */
public class CustomerDAL {

    Connection cn;
    ResultSet rs;

    public ArrayList<Customer> SearchbyName(String userName) {
        Customer newCustomer = null;
        ArrayList<Customer> customerList = new ArrayList<Customer>();
        try {
            cn = DriverManager.getConnection("Jdbc:Odbc:ADV_Project");
            Statement st = cn.createStatement();
            if (userName.equals("All customers")) {
                rs = st.executeQuery("select * from CustomerDetails ");
            } else {
                rs = st.executeQuery("select * from CustomerDetails where Name like '%" + userName + "%' ");
            }
            while (rs.next()) {
                customerList.add(new Customer(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10)));
            }

        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return customerList;
    }

    public ArrayList<Customer> SearchbyPrice(String dob) {
        Customer newCustomer = null;
        ArrayList<Customer> customerList = new ArrayList<Customer>();
        try {
            cn = DriverManager.getConnection("Jdbc:Odbc:ADV_Project");
            Statement st = cn.createStatement();

            ResultSet rs = st.executeQuery("select * from [CustomerDetails] where DOB like '%" + dob + "%' ");
            while (rs.next()) {
                customerList.add(new Customer(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10)));
            }

        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return customerList;
    }

    public ArrayList<Customer> SearchbyBoth(String userName, String dob) {
        Customer newCustomer = null;
        ArrayList<Customer> customerList = new ArrayList<Customer>();
        try {
            cn = DriverManager.getConnection("Jdbc:Odbc:ADV_Project");
            Statement st = cn.createStatement();

            ResultSet rs = st.executeQuery("select * from CustomerDetails where Dob like '%" + dob + "%' and Name like '%" + userName + "%'");
            while (rs.next()) {
                customerList.add(new Customer(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10)));
            }

        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return customerList;
    }

    public Customer Select(String Id) {
        Customer newCustomer = null;
        try {
            cn = DriverManager.getConnection("Jdbc:Odbc:ADV_Project");
            Statement st = cn.createStatement();
            Connection cn = DriverManager.getConnection("Jdbc:Odbc:ADV_Project");
            PreparedStatement ps = cn.prepareStatement("select * from CustomerDetails where ID=?");
            ps.setString(1, Id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                newCustomer = new Customer(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10));
            } else {
                return null;
            }
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return newCustomer;
    }

    public void Insert(String Name, String Address, String Gender, String Dob, String Married, String Status, String Start, String End, String Income) {
        Customer newCustomer = null;
        try {
            Connection cnn = DriverManager.getConnection("Jdbc:Odbc:ADV_Project");
            PreparedStatement ps = cnn.prepareStatement("insert into CustomerDetails values(?,?,?,?,?,?,?,?,?)");

            ps.setString(1, Name);
            ps.setString(2, Address);
            ps.setString(3, Gender);
            ps.setString(4, Dob);
            ps.setString(5, Married);
            ps.setString(6, Status);
            ps.setString(7, Start);
            ps.setString(8, End);
            ps.setFloat(9, Float.parseFloat(Income));

            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void Update(String Name, String Address, String Gender, String Dob, String Married, String Status, String Start, String End, String Income, String Id) {
        //Product newProduct=null;
        try {

            Connection cnn = DriverManager.getConnection("Jdbc:Odbc:ADV_Project");
            PreparedStatement ps = cnn.prepareStatement("update CustomerDetails set Name = ?, Address = ?, Gender = ?, dob = ?, Married = ?, Status = ?, StartDate = ?, EndDate = ?, Income = ? where Id = ?");

            ps.setString(1, Name);
            ps.setString(2, Address);
            ps.setString(3, Gender);
            ps.setString(4, Dob);
            ps.setString(5, Married);
            ps.setString(6, Status);
            ps.setString(7, Start);
            ps.setString(8, End);
            ps.setFloat(9, Float.parseFloat(Income));
            ps.setInt(10, Integer.parseInt(Id));

            ps.executeUpdate();

        } catch (SQLException ex) {
            //Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void Delete(String Id) {

        try {
            cn = DriverManager.getConnection("Jdbc:Odbc:ADV_Project");

            PreparedStatement ps = cn.prepareStatement("delete from CustomerDetails where ID = ?");

            ps.setInt(1, Integer.parseInt(Id));

               //ps.executeUpdate(); 
            ResultSet rs = ps.executeQuery();

        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}

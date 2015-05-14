/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccessLayer;

import Model.User;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author BCK
 */
public class UserDAL {

    Connection cn;

    public User Select(String userName) {
        User newUser = null;
        try {
            cn = DriverManager.getConnection("Jdbc:Odbc:ADV_Project");
            //Statement st = cn.createStatement();
            //Connection cn = DriverManager.getConnection("Jdbc:Odbc:ADV_Project");
            PreparedStatement ps = cn.prepareStatement("select * from Users where Name=?");
            ps.setString(1, userName);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                newUser = new User(rs.getString(1), rs.getString(2));
            } else {
                return null;
            }
            cn.close();
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return newUser;
    }

    public User Insert(String name, String password) {
        User newUser = null;
        try {
            cn = DriverManager.getConnection("Jdbc:Odbc:ADV_Project");
            //Connection cn = DriverManager.getConnection("Jdbc:Odbc:ADV_Project");
            PreparedStatement neww = cn.prepareStatement("insert into Users values (?,?)");
            neww.setString(1, name);
            neww.setString(2, password);
            int a = neww.executeUpdate();
            if (a==0)
            {
                return null;
            }
            else{
                newUser = new User(name, password);
            }
            cn.close();
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return newUser;
    }

    public ArrayList<String> Select_all_Username() {
        ArrayList<String> newUser = new ArrayList<String>();
        try {
            cn = DriverManager.getConnection("Jdbc:Odbc:ADV_Project");
            //Connection cn = DriverManager.getConnection("Jdbc:Odbc:ADV_Project");
            Statement neww = cn.createStatement();
            ResultSet rs = neww.executeQuery("select * from Users");
            while (rs.next()) {
                newUser.add(rs.getString(1));
            }
            cn.close();
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return newUser;

    }

    public User Update_User(String name, String password) {
        User updateUser = null;
        try {
            cn = DriverManager.getConnection("Jdbc:Odbc:ADV_Project");
            //Connection cn = DriverManager.getConnection("Jdbc:Odbc:ADV_Project");
            PreparedStatement update = cn.prepareStatement("  update Users "
                    + "  set [Password] = ? "
                    + "  where Name = ?");
            update.setString(1, password);
            update.setString(2, name);
            int a= update.executeUpdate();
            if (a==0)
            {
                return null;
            }
            else{
                updateUser = new User(name, password);
            }
            
            cn.close();
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return updateUser;
    }
    ResultSet rs;
    public ArrayList<User> Select_Search_User(String name) {
        ArrayList<User> user = new ArrayList<User>();
        try {
            
            cn = DriverManager.getConnection("Jdbc:Odbc:ADV_Project");
            Statement st = cn.createStatement();
            if (name.equals("All users")) {
                rs = st.executeQuery("select * from users ");
            } else {
                rs = st.executeQuery("select * from users where Name like '%" + name + "%' ");
            }
            while (rs.next()) {
                user.add(new User(rs.getString(1), rs.getString(2)));
            }
            cn.close();
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }

    public int Delete_User(String name) {
        int a = 0;

        try {
            cn = DriverManager.getConnection("Jdbc:Odbc:ADV_Project");
            PreparedStatement ps = cn.prepareStatement(" delete Users where Name = ? ");
            ps.setString(1, name);
            a = ps.executeUpdate();
            cn.close();
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

    public User SelectLogIn(String userName, String passWord) {
        User newUser = null;
        try {
            cn = DriverManager.getConnection("Jdbc:Odbc:ADV_Project");
            Statement st = cn.createStatement();
            Connection cn = DriverManager.getConnection("Jdbc:Odbc:ADV_Project");
            PreparedStatement ps = cn.prepareStatement("select * from Users where Name = ? and Password = ?");
            ps.setString(1, userName);
            ps.setString(2, passWord);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                newUser = new User(rs.getString(1), rs.getString(2));
            } else {
                return null;
            }
            cn.close();
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return newUser;
    }

    public boolean isValid(User user) {
        boolean valid = true;
        try {
            User temp = this.SelectLogIn(user.getName(), user.getPassword());
            if (temp == null) {
                valid = false;
            }
            else{
                
            }
        } catch (Exception ex) {
            valid = false;
        }
        return valid;
    }
}

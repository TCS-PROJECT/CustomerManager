/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DataAccessLayer;
import java.text.SimpleDateFormat;

import Model.Product;
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
 * @author Toan
 */
public class ProductDAL {
    Connection cn;
   
     public  ArrayList<Product> SearchbyName(String userName){
         Product newProduct=null;
         ArrayList<Product> productList=new ArrayList<Product>();
        try {
            cn=DriverManager.getConnection("Jdbc:Odbc:ADV_Project");
            Statement st=cn.createStatement();
             
             ResultSet rs=st.executeQuery("select * from Product where Name like '%"+userName+"%' ");
                while(rs.next())
                   productList.add(new Product(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10)));
         
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
         return productList;
    }
     public  ArrayList<Product> SearchbyPrice(String price){
         Product newProduct=null;
         ArrayList<Product> productList=new ArrayList<Product>();
        try {
            cn=DriverManager.getConnection("Jdbc:Odbc:ADV_Project");
               PreparedStatement ps=cn.prepareStatement("select * from Product where  Price = ?");
           
            ps.setFloat(1, Float.parseFloat(price));
             ResultSet rs=ps.executeQuery();
                while(rs.next())
                   productList.add(new Product(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10)));
                    
                   
                
                
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
         return productList;
    }
     public  ArrayList<Product> SearchbyBoth(String userName,String price){
         Product newProduct=null;
         ArrayList<Product> productList=new ArrayList<Product>();
        try {
            cn=DriverManager.getConnection("Jdbc:Odbc:ADV_Project");
               PreparedStatement ps=cn.prepareStatement("select * from Product where Name like '%"+userName+"%'and Price = ?");
           
            ps.setFloat(1, Float.parseFloat(price));
             ResultSet rs=ps.executeQuery();
                while(rs.next())
                   productList.add(new Product(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10)));
                    
                   
                
                
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
         return productList;
    }
     public Product Select(String Id){
         Product newProduct=null;
        try {
            cn=DriverManager.getConnection("Jdbc:Odbc:ADV_Project");
            Statement st=cn.createStatement();
                Connection cn=DriverManager.getConnection("Jdbc:Odbc:ADV_Project");
               PreparedStatement ps=cn.prepareStatement("select * from Product where ID=?");
            ps.setString(1, Id);
           
             ResultSet rs=ps.executeQuery();
                if(rs.next())
                    newProduct=new Product(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10));
                    
                   
                
                else return null;
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
         return newProduct;
    }
     
   
     
     public void Insert(String Name, String Description, String MnfDate, String Status, String Price, String DiscountStart, String DiscountEnd, String Discount, String MadeIn){
        Product newProduct=null;
        try {
                Connection cnn=DriverManager.getConnection("Jdbc:Odbc:ADV_Project");
               PreparedStatement ps=cnn.prepareStatement("insert into Product values(?,?,?,?,?,?,?,?,?)");
            
               ps.setString(1, Name);
               ps.setString(2, Description);
               ps.setString(3, MnfDate);             
               ps.setString(4, Status);
               ps.setFloat(5, Float.parseFloat(Price));
               ps.setString(6, DiscountStart);
               ps.setString(7, DiscountEnd);
               ps.setString(8, Discount);
               ps.setString(9, MadeIn);
               
               ps.executeUpdate();
            
                    
                   
                
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
     
     public void Update(String Name, String Description, String MnfDate,  String Status, String Price, String DiscountStart, String DiscountEnd, String Discount, String MadeIn,String Id) {
         //Product newProduct=null;
        try {
                
            Connection cnn=DriverManager.getConnection("Jdbc:Odbc:ADV_Project");
               PreparedStatement ps=cnn.prepareStatement("update Product set Name = ?, Description = ?, Mnfdate = ?, Status = ?, Price = ?, DiscountStart = ?, DiscountEnd = ?, Discount = ?, MadeIn = ? where Id = ?");
            
               ps.setString(1, Name);
               ps.setString(2, Description);
               ps.setString(3, MnfDate);             
               ps.setString(4, Status);
               ps.setFloat(5, Float.parseFloat(Price));
               ps.setString(6, DiscountStart);
               ps.setString(7, DiscountEnd);
               ps.setString(8, Discount);
               ps.setString(9, MadeIn);
               ps.setInt(10, Integer.parseInt(Id));
               
               ps.executeUpdate();
               //cn.close();
                    
                   
                
        } catch (SQLException ex) {
            //Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
     
     public void Delete(String Id){
         
        try {
            cn=DriverManager.getConnection("Jdbc:Odbc:ADV_Project");
            Statement st=cn.createStatement();
                Connection cn=DriverManager.getConnection("Jdbc:Odbc:ADV_Project");
               PreparedStatement ps=cn.prepareStatement("delete from Product where Id=?");
            
               ps.setString(1, Id);
               
               //ps.executeUpdate();
            
             ResultSet rs=ps.executeQuery();
                
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
         
    }
}

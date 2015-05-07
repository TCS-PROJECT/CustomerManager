/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Model;

/**
 *
 * @author Toan
 */
public class Product {
    private String ID;
    private String Name;
    private String Description;
    private String MnfDate;
    private String Status;
    private String Price;
    private String DiscountStart;
    private String DiscountEnd;
    private String Discount;
    private String MadeIn;

    public String getMadeIn() {
        return MadeIn;
    }

    public void setMadeIn(String MadeIn) {
        this.MadeIn = MadeIn;
    }

    public String getDiscountStart() {
        return DiscountStart;
    }

    public void setDiscountStart(String DiscountStart) {
        this.DiscountStart = DiscountStart;
    }

    public String getDiscountEnd() {
        return DiscountEnd;
    }

    public void setDiscountEnd(String DiscountEnd) {
        this.DiscountEnd = DiscountEnd;
    }

    public String getDiscount() {
        return Discount;
    }

    public void setDiscount(String Discount) {
        this.Discount = Discount;
    }
    

    public String getPrice() {
        return Price;
    }

    public void setPrice(String Price) {
        this.Price = Price;
    }

    public String getID() {
        return ID;
    }

    public String getName() {
        return Name;
    }

    public String getDescription() {
        return Description;
    }

    public String getMnfDate() {
        return MnfDate;
    }

   

    public String getStatus() {
        return Status;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public void setMnfDate(String MnfDate) {
        this.MnfDate = MnfDate;
    }

   

    public void setStatus(String Status) {
        this.Status = Status;
    }

    public Product(String ID, String Name, String Description, String MnfDate,  String Status,String Price,String DiscountStart,String DiscountEnd,String Discount,String MadeIn) {
        this.ID = ID;
        this.Name = Name;
        this.Description = Description;
        this.MnfDate = MnfDate;
       
        this.Status = Status;
        this.Price = Price;
        this.DiscountStart = DiscountStart;
        this.DiscountEnd = DiscountEnd;
        this.Discount = Discount;
        this.MadeIn=MadeIn;
    }
    
}

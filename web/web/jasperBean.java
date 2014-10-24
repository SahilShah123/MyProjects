/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author ketulshah
 */
public class jasperBean
{
  private String username; 
  private String shoppingaddress;
  private int oderid;
  private int totalamount;
  private int itemid;
  private int quantity;
  private int price;

    public mybean()
    {}        
   public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getShoppingaddress() {
        return shoppingaddress;
    }

    public void setShoppingaddress(String shoppingaddress) {
        this.shoppingaddress = shoppingaddress;
    }

    public int getOderid() {
        return oderid;
    }

    public void setOderid(int oderid) {
        this.oderid = oderid;
    }

    public int getTotalamount() {
        return totalamount;
    }

    public void setTotalamount(int totalamount) {
        this.totalamount = totalamount;
    }
     public int getItemid() {
        return itemid;
    }

    public void setItemid(int itemid) {
        this.itemid = itemid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
  
}

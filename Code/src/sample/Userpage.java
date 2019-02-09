package sample;

import com.jfoenix.controls.JFXButton;
import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Userpage {

    @FXML
    public Label pdetails;
    @FXML
    public JFXButton buy,bt,bt1,bt2,bt3,bt4,bt5;

    @FXML
    public ImageView i,i1,i2,i3,i4,i5,rv;

    public Integer pid,price;

    public String get_details(String s) throws Exception
    {
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        String url = "jdbc:mysql://localhost:3306/pizza?autoReconnect=true&useSSL=false";
        Connection con = DriverManager.getConnection(url, "root", "0209");
        Statement st=con.createStatement();
        String q="select * from product where Name = \""+s+"\";";
        ResultSet rs=st.executeQuery(q);

        String res="";
        while (rs.next())
        {
            pid=rs.getInt("Pid");
            price=rs.getInt("Price");
            res="PID    : "+rs.getString("Pid")+"\nName : "+rs.getString("Name")+"\nType  : "+rs.getString("Type")+"\nPrice  : "+rs.getString("Price")+"\n";
        }
        return res;
    }

    public void display_button(String details)
    {
        pdetails.setText(details);
        buy.setText("BUY");
        //buy.setBackground(Color.rgb(0,0,0));
        buy.setDisable(false);
    }

    public void fun1()throws Exception{
        rv.setImage(new Image(i.getImage().impl_getUrl()));
        System.out.println(Userlogin.user_logedin);
        String details=get_details(bt.getText());
        display_button(details);
        /*pdetails.setText(details);
        buy.setText("BUY");
        //buy.setBackground(Color.rgb(0,0,0));
        buy.setDisable(false);*/
    }
    public void fun2()throws Exception{
        rv.setImage(new Image(i1.getImage().impl_getUrl()));
        String details=get_details(bt1.getText());
        display_button(details);
    }
    public void fun3()throws Exception{
        rv.setImage(new Image(i2.getImage().impl_getUrl()));
        String details=get_details(bt2.getText());
        display_button(details);
    }
    public void fun4()throws Exception{
        rv.setImage(new Image(i3.getImage().impl_getUrl()));
        String details=get_details(bt3.getText());
        display_button(details);
    }
    public void fun5()throws Exception{
        rv.setImage(new Image(i4.getImage().impl_getUrl()));
        String details=get_details(bt4.getText());
        display_button(details);
    }
    public void fun6()throws Exception{
        rv.setImage(new Image(i5.getImage().impl_getUrl()));
        String details=get_details(bt5.getText());
        display_button(details);
    }

    public void buy_button()throws Exception
    {
        /*Alert alert=new Alert(Alert.AlertType.INFORMATION);
        alert.setHeaderText(null);
        alert.setContentText("Login id = "+Userlogin.user_logedin+"Pid id = "+pid+"\nIncompelete Func");
        alert.show();*/

        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        String url = "jdbc:mysql://localhost:3306/pizza?autoReconnect=true&useSSL=false";
        Connection con = DriverManager.getConnection(url, "root","0209");
        Statement st=con.createStatement();


        String query_input="insert into orderr (cid,pid,qantity,price,odate,otime) values ("+Userlogin.user_logedin+","+pid+",1,"+price+",SYSDATE(),CURTIME());";
        try{
            System.out.println(query_input);
            st.executeUpdate(query_input);
            System.out.println("done");

            Alert alert2=new Alert(Alert.AlertType.INFORMATION);
            alert2.setHeaderText(null);
            alert2.setContentText("Ordered");
            alert2.show();
        }
        catch (Exception eq)
        {
            System.out.println("Error");
            //labell.setText("Error");
        }
    }
}

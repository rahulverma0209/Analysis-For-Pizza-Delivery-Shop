package sample;
import com.jfoenix.controls.*;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;

import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.Label;
import javafx.stage.Modality;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Userlogin  {
    @FXML
    public JFXTextField user;
    @FXML
    public JFXPasswordField pass;

    @FXML
    private Label texx;

    public static Stage signupstage;

    public static String user_logedin;

    public boolean login2(){

        texx.setText("");
        String u=user.getText();
        String p=pass.getText();

        if(u.compareToIgnoreCase("")==0 || p.compareToIgnoreCase("")==0)
        {
            System.out.println("Mobile no or Password Field is Empty");
            texx.setText("Mobile no or Password Field is Empty");
        }
        else
        {
            System.out.println("Username : " + u + "\tPassword : " + p + "\n");

            try{
                Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
                String url = "jdbc:mysql://localhost:3306/pizza?autoReconnect=true&useSSL=false";
                Connection con = DriverManager.getConnection(url, "root","0209");
                texx.setText("Connected to DB");
                System.out.println("Connected to DB");


                Statement st=con.createStatement();
                String q="select cid,pwd from customer where pno = "+u+";";
                ResultSet rs=st.executeQuery(q);
                while (rs.next()) {
                    System.out.println(rs.getString("pwd"));
                    if(p.compareTo(rs.getString("pwd"))==0) {
                        user_logedin = rs.getString("cid");
                        return true;
                    }
                }
                System.out.println("Mobile or Password is wrong");
                Alert alert=new Alert(Alert.AlertType.ERROR);
                alert.setHeaderText(null);
                alert.setContentText("Mobile or Password is wrong");
                alert.show();
                return false;
            }
            catch (Exception e)
            {
                System.out.println("Not Connected with DB");
                texx.setText("Not Connected with DB");
                return false;
            }
        }
        return false;
    }
    public void login1(){

        try
        {
            if(login2())
            {
                firstpage.firststage.close();
                Stage prim=new Stage();                                   //With FXML
                prim.initModality(Modality.APPLICATION_MODAL);
                prim.setTitle("UserPage");
                prim.setResizable(false);
                Parent root1 = FXMLLoader.load(getClass().getResource("userpage.fxml"));
                prim.setScene(new Scene(root1, 1410, 650));
                prim.show();
            }
        }

        catch (Exception e){
            e.getMessage();
        }
    }
    public void signup()
    {
        try
        {
            //Stage prim=new Stage();                                   //With FXML
            signupstage=new Stage();
            signupstage.initModality(Modality.APPLICATION_MODAL);
            signupstage.initStyle(StageStyle.UNDECORATED);
            signupstage.setTitle("Signup");
            signupstage.setResizable(false);
            Parent root1 = FXMLLoader.load(getClass().getResource("signupp.fxml"));
            signupstage.setScene(new Scene(root1, 380, 600));
            signupstage.show();
        }
        catch (Exception e){
            e.getMessage();
        }
    }
}
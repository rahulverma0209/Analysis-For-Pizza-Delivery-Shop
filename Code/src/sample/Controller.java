package sample;
import com.jfoenix.controls.*;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;

import javafx.fxml.FXML;
import javafx.scene.control.Label;
import javafx.stage.Modality;
import javafx.stage.Stage;

import java.sql.Connection;
import java.sql.DriverManager;

public class Controller  {
    @FXML
    public JFXTextField user;
    @FXML
    public JFXPasswordField pass;

    @FXML
    private Label texx;

    public boolean login2(){

        texx.setText("");
        String u=user.getText();
        String p=pass.getText();

        if(u.compareToIgnoreCase("")==0 || p.compareToIgnoreCase("")==0)
        {
            System.out.println("Username or Password Field is Empty");
            texx.setText("Username or Password Field is Empty");
        }
        else
        {
            System.out.println("Username : " + u + "\nPassword : " + p);

            try{
                //Class.forName("com.mysql.jdbc.Driver");
                Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
                //String url = "jdbc:mysql://localhost:3306/swiggy";
                String url = "jdbc:mysql://localhost:3306/pizza?autoReconnect=true&useSSL=false";
                //System.out.println("fs1");
                Connection con = DriverManager.getConnection(url, u, p);
                texx.setText("Connected to DB");
                System.out.println("Connected to DB");
                return true;

                /*firstpage.firststage.close();

                Stage prim=new Stage();                                   //With FXML
                prim.initModality(Modality.APPLICATION_MODAL);
                prim.setTitle("Table");
                prim.setResizable(false);
                Parent root1 = FXMLLoader.load(getClass().getResource("tables.fxml"));
                prim.setScene(new Scene(root1, 1410, 650));
                prim.show();*/

                //Tables t=new Tables();
                //t.start();
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
                prim.setTitle("Table");
                prim.setResizable(false);
                Parent root1 = FXMLLoader.load(getClass().getResource("tables.fxml"));
                prim.setScene(new Scene(root1, 1410, 650));
                prim.show();
            }
        }

        catch (Exception e){
            e.getMessage();
        }
    }
}
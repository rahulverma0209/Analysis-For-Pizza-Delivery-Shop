package sample;

import com.jfoenix.controls.JFXTextField;
import javafx.fxml.FXML;
import javafx.scene.control.Alert;

import java.awt.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import static java.lang.System.exit;

public class Signupp {

     @FXML
    public JFXTextField name,email,street,city,state,pincodee,pno,pwd;

    public void cancell() {
        Userlogin.signupstage.close();
    }

    public boolean check_pno(ResultSet rss)throws Exception{
        if(rss.next())
        {
            Alert alert=new Alert(Alert.AlertType.ERROR);
            alert.setHeaderText(null);
            alert.setContentText("Mobile already exist");
            alert.show();
            return false;
        }
        return true;
    }
    public void save_data()throws Exception{


        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        String url = "jdbc:mysql://localhost:3306/pizza?autoReconnect=true&useSSL=false";
        Connection con = DriverManager.getConnection(url, "root", "0209");
        System.out.println("Connected to DB");
        Statement st=con.createStatement();
        ResultSet rs;


        String name_i=name.getText();
        String email_i=email.getText();
        String street_i=street.getText();
        String city_i=city.getText();
        String state_i=state.getText();
        String pincode_i=pincodee.getText();
        String pno_i=pno.getText();
        String pwd_i=pwd.getText();
        Integer cid_i=new Integer(0);


        if(name_i.compareTo("")==0 || email_i.compareTo("")==0 || state_i.compareTo("")==0 || city_i.compareTo("")==0 || street_i.compareTo("")==0 || pincode_i.compareTo("")==0 || pno_i.compareTo("")==0 || pwd_i.compareTo("")==0){
            Alert alert=new Alert(Alert.AlertType.ERROR);
            alert.setHeaderText(null);
            alert.setContentText("Some Field is empty");
            alert.show();
        }
        else if(check_pno(st.executeQuery("select pno from customer where pno = "+pno_i+";")))
        {
            String q="select max(cid) as cid from customer;";
            rs=st.executeQuery(q);
            while (rs.next()) {
                System.out.println(rs.getInt("cid"));
                cid_i=rs.getInt("cid");
            }
            cid_i++;



            String query_input="insert into customer values("+cid_i.toString()+",\""+name_i+"\",\""+email_i+"\",\""+street_i+"\",\""+city_i+"\",\""+state_i+"\","+pincode_i+","+pno_i+",\""+pwd_i+"\");";

            try{
                System.out.println(query_input);
                st.executeUpdate(query_input);
                System.out.println("done");

                Alert alert=new Alert(Alert.AlertType.INFORMATION);
                alert.setHeaderText(null);
                alert.setContentText("Data Saved");
                alert.show();
                cancell();

                //labell.setText("Data Saved");
            }
            catch (Exception eq)
            {
                System.out.println("Error");
                //labell.setText("Error");
            }
        }
    }
}

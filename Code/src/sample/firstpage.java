package sample;

import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Modality;
import javafx.stage.Stage;

public class firstpage {
    public static Stage firststage;

    public void fun(){
        try {
            firststage=new Stage();
            firststage.initModality(Modality.APPLICATION_MODAL);
            Parent root = FXMLLoader.load(getClass().getResource("sample.fxml"));
            firststage.setTitle("Login");
            firststage.setResizable(false);                           //so than no one can resize window
            firststage.setScene(new Scene(root, 1410, 650));
            firststage.show();
        }
        catch (Exception e){
            e.getMessage();
        }
    }
    public void userp(){
        try {
            firststage=new Stage();
            firststage.initModality(Modality.APPLICATION_MODAL);
            Parent root = FXMLLoader.load(getClass().getResource("userlogin.fxml"));
            firststage.setTitle("UserLogin");
            firststage.setResizable(false);                           //so than no one can resize window
            firststage.setScene(new Scene(root, 1410, 650));
            firststage.show();
        }
        catch (Exception e){
            e.getMessage();
        }
    }
}
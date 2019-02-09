package sample;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Modality;
import javafx.stage.Stage;

public class Main extends Application {

    public static Stage primaryStage=new Stage();

    @Override
    public void start(Stage abc) throws Exception{
        try
        {
            Parent root = FXMLLoader.load(getClass().getResource("firstpage.fxml"));
            primaryStage.setTitle("Pizzahut");
            primaryStage.initModality(Modality.APPLICATION_MODAL);
            //primaryStage.initStyle(StageStyle.UNDECORATED);             //use to remove min,max,cross option
            primaryStage.setResizable(false);                           //so than no one can resize window
            primaryStage.setScene(new Scene(root, 1410, 650));
            primaryStage.show();
        }
        catch (Exception e)
        {
            e.getMessage();
        }
    }
    public static void main(String[] args) {
        launch(args);
    }
}

package sample;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.chart.BarChart;
import javafx.scene.chart.LineChart;
import javafx.scene.chart.PieChart;
import javafx.scene.chart.XYChart;
import javafx.scene.control.Button;
import javafx.scene.control.TextArea;

import java.sql.*;
import java.util.Date;
import java.util.Observable;

public class Tables {


    @FXML
    public TextArea query;
    @FXML
    public Button exe_button;
    @FXML
    public TextArea query_output;
    @FXML
    public TextArea analys_output,analys_output1,analys_output2,analys_output3;
    @FXML
    public LineChart<String,Integer> lc1;
    @FXML
    public BarChart<String,Integer> barc1;
    @FXML
    public PieChart pchart1;
   public void execite_fun() throws SQLException,ClassNotFoundException,IllegalAccessException,InstantiationException
   {
       Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
       String url = "jdbc:mysql://localhost:3306/pizza?autoReconnect=true&useSSL=false";
       Connection con = DriverManager.getConnection(url, "root", "0209");
       System.out.println("Connected to DB");



       Statement st=con.createStatement();
       String query_input=query.getText();
       try
       {
               ResultSet rs=st.executeQuery(query_input);
               String result=DBTablePrinter.printResultSet(rs);
               query_output.setText("\n"+result.toUpperCase());

       }
       catch (SQLException e)
       {
           try{
               st.executeUpdate(query_input);
               query_output.setText("Query Executed");
           }
           catch (Exception eq)
           {
               System.out.println("Error");
               query_output.setText("Error");
           }
       }
       catch(Exception e)
       {
           System.out.println("Query error or Failed to Connect with DB");
           query_output.setText("Error");
            e.getMessage();
       }
   }
   public String analys(String queryy)  throws Exception
   {
       Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
       String url = "jdbc:mysql://localhost:3306/pizza?autoReconnect=true&useSSL=false";
       Connection con = DriverManager.getConnection(url, "root", "0209");
       Statement st=con.createStatement();
       try
       {
           ResultSet rs=st.executeQuery(queryy);
           String result=DBTablePrinter.printResultSet(rs);
           return ("\n"+result.toUpperCase());

       }
       catch(Exception e)
       {
           System.out.println("Query error or Failed to Connect with DB");
           analys_output.setText("Error");
       }
       return ("Error");

   }
    public void b1() throws Exception
    {
        String qur="select p.Pid,p.name,sum(o.qantity) as Unit_Sold from (product p left outer join orderr o on o.pid=p.Pid) group by p.Pid;";
        analys_output.setText(analys(qur));
    }
    public void b2() throws Exception
    {
        String qur="select c.pincode,sum(o.qantity) as no_of_unit_sold,sum(o.price) as cost from orderr o,customer c where o.cid=c.cid group by c.pincode order by no_of_unit_sold desc;";
        analys_output.setText(analys(qur));
    }
    public void b3() throws Exception
    {
        String qur="select o.cid,c.cname,sum(o.qantity) as no_of_product_ordered from orderr o,customer c where o.cid=c.cid group by cid order by no_of_product_ordered desc;";
        analys_output.setText(analys(qur));
    }
    public void b4() throws Exception
    {
        String qur="select pincode, count(*) as no_of_req from pin_req group by pincode order by no_of_req desc;";
        analys_output.setText(analys(qur));
    }
    public void b5() throws Exception
    {
        String qur="select sid,Name,desg,rating from staff where rating < (select avg(rating) from staff) order by rating;";
        analys_output.setText(analys(qur));
    }
    public void b6() throws Exception
    {
        String qur="select year(odate) as year,sum(qantity) as Unit_sold from orderr group by year;";
        analys_output.setText(analys(qur));
    }
    public void b7() throws Exception
    {
        String qur="select sum(qantity) as unit_sold,month(odate) as monn,year(odate) as year from orderr where oid in (select oid from orderr where oid in (select oid from orderr where year(odate) in (select year(SYSDATE())))) group by monn order by monn;";
        analys_output.setText(analys(qur));
    }


    public ResultSet resultSet(String q) throws Exception
    {
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        String url = "jdbc:mysql://localhost:3306/pizza?autoReconnect=true&useSSL=false";
        Connection con = DriverManager.getConnection(url, "root", "0209");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery(q);
        return rs;
    }

    public void linechart1()throws Exception{
        lc1.getData().clear();
        XYChart.Series<String,Integer> series=new XYChart.Series<>();
        //String q="select p.pid,p.name as name,sum(o.qantity) as Unit_Sold from (product p left outer join orderr o on o.pid=p.Pid) group by p.Pid;";;

        //String q="select year(odate) as year,sum(qantity) as Unit_sold from orderr group by year order by year;";

        String q="select sum(qantity) as unit_sold,month(odate) as monn,year(odate) as year from orderr where oid in (select oid from orderr where oid in (select oid from orderr where year(odate) in (select year(SYSDATE())))) group by monn order by monn;";

        ResultSet rs=resultSet(q);
        while (rs.next()) {
            series.getData().add(new XYChart.Data<>(rs.getString("monn"),rs.getInt("Unit_Sold")));
        }
        analys_output1.setText(analys(q));
        lc1.getData().add(series);
    }

    public void barchart1()throws Exception{
        barc1.getData().clear();
        XYChart.Series<String,Integer> series=new XYChart.Series<>();
        String q="select p.pid,p.name as name,sum(o.qantity) as Unit_Sold from (product p left outer join orderr o on o.pid=p.Pid) group by p.Pid;";;

        //String q="select year(odate) as year,sum(qantity) as Unit_sold from orderr group by year order by year;";

        ResultSet rs=resultSet(q);
        while (rs.next()) {
            if(rs.getString("Unit_Sold")==null)
                series.getData().add(new XYChart.Data<>(rs.getString("name"),0));
            else
            series.getData().add(new XYChart.Data<>(rs.getString("name"),rs.getInt("Unit_Sold")));
        }
        analys_output3.setText(analys(q));
        barc1.getData().add(series);
    }

    public void piechart1()throws Exception{
       pchart1.getData().clear();
        ObservableList<PieChart.Data> list= FXCollections.observableArrayList();
        String q="select pincode, count(*) as no_of_req from pin_req group by pincode";
        ResultSet rs=resultSet(q);
        while (rs.next()) {
            list.add(new PieChart.Data(rs.getString("pincode"),rs.getInt("no_of_req")));
        }
        analys_output2.setText(analys("select pincode, count(*) as no_of_req from pin_req group by pincode order by no_of_req desc;"));
        pchart1.setData(list);
    }
}

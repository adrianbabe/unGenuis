package Bean;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import javax.swing.JTable;
import javax.swing.table.TableModel;

public class DBBean2 {

    /**
     * @param args
     */
    
    //数据库连接地址
    //private final static String URL = "jdbc:mysql://localhost:3306/mysql?zeroDateTimeBehavior=convertToNull";
    private final static String URL = "jdbc:mysql://localhost:3306/shop?zeroDateTimeBehavior=convertToNull";

//用户名
    public final static String USERNAME = "root";
    //密码
    public final static String PASSWORD = "zhouziteng980110";
    //加载的驱动程序类（这个类就在我们导入的jar包中）
    public final static String DRIVER = "com.mysql.jdbc.Driver";
    
    public static void main(String[] args) {
        // TODO Auto-generated method stub
    }    
    
    public void exportTable(JTable table, File file) throws IOException {  
TableModel model = table.getModel();//得到Jtable的Model  
FileWriter out = new FileWriter(file);  
  
for(int i=0; i < model.getColumnCount(); i++) {  
out.write(model.getColumnName(i) + "\t");  
}  
out.write("\n");  
for(int i=0; i< model.getRowCount(); i++) {  
for(int j=0; j < model.getColumnCount(); j++) {  
//  if(model.getValueAt(i,j).toString()!=null&&!model.getValueAt(i,j).toString().equals(""))  
//  {  
//      out.write(model.getValueAt(i,j).toString()+"\t");  
//  }else{  
//      out.write("null"+"\t");  
//  }  
    out.write(model.getValueAt(i,j).toString()+"\t");  
}  
out.write("\n");  
}  
out.close();  
System.out.println("write out to: " + file);  
}  
 
    
    //方法：操作数据
    public static void executeUpdate(String sql){
        try {
            //1、加载数据库驱动程序
            Class.forName(DRIVER);
            
            //2、获取数据库连接
            Connection connection  = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            
            //3、构造SQL语句（插入具体的数据）
            //String sql = "insert into person(name,age,description)values('生命壹号',22,'学到哪里，我的博客就写到哪里')";
            
            //4、构造一个Statement实例(用来发送SQL语句的载体)
            Statement state = connection.createStatement();
            
            //5、执行SQL语句（其实是向数据库中发送sql语句）
            state.executeUpdate(sql);
            
            //6、关闭连接(释放资源)
            state.close();
            connection.close();
            
            
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
    }    
    //唯一性检测
     public static boolean isOnly(String sql) {// 判断是否存在该记录  
        boolean flag = false;  
        try {  
            Class.forName(DRIVER);
            Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            //String sql = "select id,name,age,description from person";
            Statement state = conn.createStatement();
            //执行查询并返回结果集
            ResultSet rs = state.executeQuery(sql);
            if (rs.next()) {  
                flag = true;// 存在  
                if (rs.next()) {  
                flag = false;// 存在不唯一  
            }
            }
            rs.close();
            conn.close();
        } catch (Exception e) {  
            e.printStackTrace();  
            flag = false;  
        } 
        return flag;  
    }
     
     //得到字段
     public String GetString(String sql, int n){
     String result = "未找到对象！";
      try {
            Class.forName("com.mysql.jdbc.Driver");     //连接驱动  
            Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);    //连接数据库  
//          if(!conn.isClosed())  
//              System.out.println("成功连接数据库"); 
            //String sql = "select Name,Gender,Age,Birth,Phone from addresslist where UserName = '"+ username +"'";
           //        sql = "select Phone from addresslist where UserName='" + username + "' and Name='" + input + "'";
            Statement statement = conn.createStatement(); //创建执行对象
            ResultSet rs = statement.executeQuery(sql);
        
            while (rs.next()) {
                rs.getString(n);
            }
            
            rs.close();
            statement.close();
        } catch (Exception e) {
        }
     return result;
     }
     
    //方法：查询操作
    public static void query(String sql){
        try {
            Class.forName(DRIVER);
            Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            //String sql = "select id,name,age,description from person";
            Statement state = conn.createStatement();
            //执行查询并返回结果集
            ResultSet rs = state.executeQuery(sql);
            while(rs.next()){  //通过next来索引：判断是否有下一个记录
                //rs.getInt("id"); //方法：int java.sql.ResultSet.getInt(String columnLabel) throws SQLException
                int id = rs.getInt(1);  //方法：int java.sql.ResultSet.getInt(int columnIndex) throws SQLException

                String name = rs.getString(2);
                int age = rs.getInt(3);
                String description = rs.getString(4);
                System.out.println("id="+id+",name="+name+",age="+age+",description="+description);
            }
            rs.close();
            state.close();
            conn.close();            
            
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    
    
    
     public static boolean isExist(String sql) {// 判断是否存在该记录  
        boolean flag = false;  
        try {  
            Class.forName(DRIVER);
            Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            //String sql = "select id,name,age,description from person";
            Statement state = conn.createStatement();
            //执行查询并返回结果集
            ResultSet rs = state.executeQuery(sql);
            if (rs.next()) {  
                flag = true;// 存在  
            }
            rs.close();
            conn.close();
        } catch (Exception e) {  
            e.printStackTrace();  
            flag = false;  
        } 
        return flag;  
    }
     
     public static boolean check(String user, String pwd) {// 登陆验证  
        boolean flag = false;  
        try {  
            Class.forName(DRIVER);
            Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            //String sql = "select id,name,age,description from person";
            Statement state = conn.createStatement();
            //执行查询并返回结果集
            ResultSet rs = state.executeQuery("select Password from account where UserName='" + user + "'");  
            rs.next();  
            String mywd = rs.getString(1);// 得到密码  
            if (mywd.equals(pwd)) {  
                flag = true;// 密码正确  
            }
            rs.close();
            conn.close();
        } catch (Exception e) {  
            flag = false;
        // 有异常登录失败  
        } 
        return flag;  
    }  
}

package util;

import java.sql.*;
import java.util.*;
import java.util.Date;
import java.text.*;
public class DBHelper {

    //数据库链接相关数据
    private static final String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private static final String url= "jdbc:sqlserver://localhost:1433;DatabaseName=DADAstudio";
    private static final String username="sa";//数据库的用户名
    private static final String password="844701730";//数据库密码
    private static Connection conn=null;
    private static Statement stmt=null;



    //数据库连接函数
    public void getConnection(){
        //首先定义下连接数据的URL、用户名、密码
        try
        {
            Class.forName(driver);
            conn=DriverManager.getConnection(url,username,password);
            stmt = conn.createStatement();
        }
        catch (ClassNotFoundException e)
        {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //向表Table_usersl中插入一行数据
    public boolean InsertTable_users1(String Username,String Password) {

        try {
            getConnection();
            String sql = "INSERT INTO Table_users1(username,password,status,privilege)values(?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, Username);
            ps.setString(2, Password);
            ps.setString(3,"待审核");
            ps.setString(4,"游客");
            ps.executeUpdate();
            //完成后记得关闭数据库连接   
            conn.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    //向表Table_usersinfo中插入一行数据
    public boolean InserTable_usersinfo(String Username,String Name,String Sex,String Birthday,String Address,String Phone,String Referrer,String Branch,String Community) {
        try {
            getConnection();

            String sql = "INSERT INTO Table_usersinfo(username,name,sex,birthday,address,phone,referrer,branch,community)values(?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, Username);
            ps.setString(2,Name);
            ps.setString(3,Sex);
            ps.setString(4,Birthday);
            ps.setString(5,Address);
            ps.setString(6,Phone);
            ps.setString(7,Referrer);
            ps.setString(8,Branch);
            ps.setString(9,Community);
            ps.executeUpdate();
            //完成后记得关闭数据库连接   
            conn.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    //向表Table_draft和Table_draftinfo表中插入一行数据
    public boolean InsertDraft(String name,String author,String essay) {
        try {
            getConnection();
            Calendar calendar = Calendar.getInstance();
            //计算十天后的日期，既截止日期
            calendar.add(Calendar.DATE,10);//今天加上15天以后的日子,也可以加上年数,月数等,具体看API  
            Date after10day = calendar.getTime();
            DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            String sql = "INSERT INTO Table_draft (name,author,deadline,essay) values(?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, author);
            ps.setString(3, format.format(after10day));
            ps.setString(4, essay);
            ps.executeUpdate();
            sql = "INSERT INTO Table_draftinfo (name,author,deadline,state,support,object,submittime) values(?,?,?,?,?,?,?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, author);

            ps.setString(3,format.format(after10day));
            ps.setString(4, "推荐中");
            ps.setString(5, "0");
            ps.setString(6, "0");
            ps.setString(7, time());
            ps.executeUpdate();
            //完成后记得关闭数据库连接   
            conn.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
   //向表Table_caogao中插入一组数据
    public boolean InserTable_caogao(String name,String author,String essay) {
        try {
            getConnection();
            String sql = "INSERT INTO Table_caogao(name,author,submittime,state,essay) values (?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,name);
            ps.setString(2,author);
            ps.setString(3,time());
            ps.setString(4,"未提交");
            ps.setString(5,essay);
            ps.executeUpdate();
            //完成后记得关闭数据库连接   
            conn.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
   //向表
    public boolean InserTable_rule(String name,String author,String essay) {
        try {
            getConnection();
            String sql = "INSERT INTO Table_rule(name,author,time,essay) values (?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,name);
            ps.setString(2,author);
            ps.setString(3,time());
            ps.setString(4,essay);
            ps.executeUpdate();
            //完成后记得关闭数据库连接   
            conn.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    //向表Table_common中插入一个数据
    public boolean InserTable_common(String name,String essay,String submittime,int common,int submitid) {
        try {
            getConnection();
            String sql = "INSERT INTO Table_common(name,essay,submittime,common,essayID) values (?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,name);
            ps.setString(2,essay);
            ps.setString(3,submittime);
            ps.setInt(4,common );
            ps.setInt(5,submitid );

            ps.executeUpdate();
            //完成后记得关闭数据库连接   
            conn.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    //向表Table_referrer中插入一行数据
    public boolean InsertTable_referrer(String referrer,String position,String title,String company,String phone,String email,String recommended,String reason){
        try {
            getConnection();
            String sql = "INSERT INTO Table_referrer(referrer,position,title,company,phone,email,recommended,reason) values (?,?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,referrer);
            ps.setString(2,position);
            ps.setString(3,title);
            ps.setString(4,company);
            ps.setString(5,phone );
            ps.setString(6,email);
            ps.setString(7,recommended);
            ps.setString(8,reason);


            ps.executeUpdate();
            //完成后记得关闭数据库连接   
            conn.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    //在某表（Table)中修改用户名为（username）的列，要修改的属性为(KeyType),要修改为的值为(NewProperty)
    public void UpdateProperty(String Table,String WhereProperty,String WhereValue,String KeyType,String NewProperty){

        try {//"' where username='"
            getConnection();
            String sql="update "+Table+" set "+KeyType+"='"+NewProperty+"' where "+WhereProperty+"='"+WhereValue+"'";
            int i=stmt.executeUpdate(sql);
            stmt.close();
            conn.close();

        }catch (SQLException e){
            e.printStackTrace();
        }
    }


    //从某表（Table）中读取某个属性（type）中的某个数据，当某属性（KeyType）等于某值时（Key），并以String类型输出
    public String SelectDate(String Table,String KeyType,String Key ,String type) {
        try {
            getConnection();
            String sql="select "+type+" from "+Table+" where "+KeyType+" = "+"'"+Key+"'" ;
            ResultSet rs=stmt.executeQuery(sql);
            rs.next();
            String result=rs.getString(type);
            //完成后记得关闭数据库连接   
            conn.close();
            return result;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "NULL";
    }
    //从表Table_draftinfo中输出一个表
    public List Select_Table_draftinfo(String author)
    {
        List list =new ArrayList();

        try {
            getConnection();
            String sql = "Select * from Table_draftinfo where author = "+"'"+author+"'";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Map map = new HashMap();
                map.put("ID", rs.getString("ID"));
                map.put("name", rs.getString("name"));
                map.put("submittime", rs.getString("submittime"));
                map.put("state", rs.getString("state"));
                list.add(map);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public List Select_Table_rule()
    {
        List list =new ArrayList();

        try {
            getConnection();
            String sql = "Select * from Table_rule ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Map map = new HashMap();
                map.put("name", rs.getString("name"));
                map.put("time", rs.getString("time"));
                list.add(map);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    //从表Table_caogao中输出一个表
    public List Select_Table_caogao(String author)
    {
        List list =new ArrayList();

        try {
            getConnection();
            String sql = "Select * from Table_caogao where author = "+"'"+author+"'";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Map map = new HashMap();
                map.put("ID", rs.getString("ID"));
                map.put("name", rs.getString("name"));
                map.put("submittime", rs.getString("submittime"));
                map.put("state", rs.getString("state"));
                list.add(map);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    //删除
    public void Delete(int id )
    {
        try {
            getConnection();
            String sql="delete from Table_caogao where ID=?";
            PreparedStatement pst=conn.prepareStatement(sql);
            pst.setInt(1,id);
            pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    //在表Table_referrer中，通过name和referrer来查找SeekType属性上的值
    public String SearchInTable_referrer(String name,String referrer,String SeekType){
        try{
            getConnection();

            String sql="select "+SeekType+" from Table_referrer where recommended='"+name+"' and referrer='"+referrer+"'";
            ResultSet rs=stmt.executeQuery(sql);
            rs.next();
            String result=rs.getString(SeekType);
            conn.close();
            return result;
        }catch (SQLException e){
            e.printStackTrace();
            return "NULL";
        }
    }
    //在表Table_referrer中，通过name和referrer来判断该表是否存在
    public boolean ExistInTable_referrer(String name,String referrer){
        try {//"' where username='"
            getConnection();
            int count=0;
            String sql="select count(*) from Table_referrer where recommended='"+name+"' and referrer='"+referrer+"'";
            PreparedStatement psmt=conn.prepareStatement(sql);
            ResultSet rs=psmt.executeQuery();
            while(rs.next()){
                count=rs.getInt(1);
            }
            if(count==0)
                return false;
            else
                return true;
        }catch (SQLException e){
            e.printStackTrace();
            return false;
        }
    }
       //计算输入表的总行数
    public int countEmp(String Table) {
        try {
            //加载数据库驱动，注册到去送管理器
            getConnection();
            int count=0;
            String sql="select count(*) from "+Table;
            PreparedStatement psmt=conn.prepareStatement(sql);
            ResultSet rs=psmt.executeQuery();
            while(rs.next()){
                count=rs.getInt(1);
            }
            conn.close();
            return count;
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
    //获取当前时间
    public String time() {
        Date date=new Date();
        DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
        String time=format.format(date);
        return time;
    }
}

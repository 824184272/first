package com.snnu.db;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

public class DBHelper2 {
	
	public static String driver;  
	public static String url;  
	public static String username;  
	public static String password; 
	private static Connection conn =null;
	
	static{
		//加载属性文件，读取数据库连接配置信息
		Properties prop = new Properties();
		try {
			prop.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("db.properties"));
			DBHelper2.driver= prop.getProperty("driver"); 
			DBHelper2.url=prop.getProperty("url");    
			DBHelper2.username=prop.getProperty("username");    
			DBHelper2.password=prop.getProperty("password"); 
			Class.forName(driver);
			System.out.println(driver);
			System.out.println(url);
			System.out.println(username);
			System.out.println(password);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//单例模式返回
		public static Connection getConnection() throws Exception{
			
			if(conn==null){
				conn = DriverManager.getConnection(url,username,password);
				return conn;
			}
			return conn;
		}
		public static void main(String[] args) {
		Connection conn;
		try {
			conn = DBHelper2.getConnection();
			if(conn!=null){
				String sql="select * from user;";
				PreparedStatement stmt=null;
				ResultSet rs=null;
				stmt= conn.prepareStatement(sql);
				rs=stmt.executeQuery();
				while(rs.next()){
					System.out.print("用户名："+rs.getString("username"));
					System.out.println("  密码:"+rs.getString("password"));
				}
			}
			else{
				System.out.println("异常");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

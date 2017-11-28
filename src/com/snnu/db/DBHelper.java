package com.snnu.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBHelper {

	private static final String driver="com.mysql.jdbc.Driver"; 
	private static final String url="jdbc:mysql://localhost:3306/ArticleTest?useUnicode=true&characterEncoding=UTF-8";
	private static final String username="root";
	private static final String password="123456";
	
	private static Connection conn =null;

	//静态代码负责加载驱动
	static{
		try{
			Class.forName(driver);
		}catch (Exception e) {
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
	
	/*public static void main(String[] args) {
		Connection conn;
		try {
			conn = DBHelper.getConnection();
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
	}*/
}

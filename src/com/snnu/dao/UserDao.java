package com.snnu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.snnu.bean.User;
import com.snnu.db.DBHelper2;

public class UserDao {
	
	private static Connection conn=null;
	private static PreparedStatement pt= null;
	private static ResultSet rs =null;
	private static String sql=null;
	static ArrayList<User> list=new ArrayList<User>();//商品集合
	
	public static ArrayList<User> QueryD(){
		
		try {
			sql="select * from user";
			conn = DBHelper2.getConnection();
			pt = conn.prepareStatement(sql);
			rs = pt.executeQuery();
			while(rs.next()){
				User user =new User();
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				list.add(user);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}

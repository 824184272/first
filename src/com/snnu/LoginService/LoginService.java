package com.snnu.LoginService;

import java.util.ArrayList;

import com.snnu.bean.User;
import com.snnu.dao.UserDao;

public class LoginService {
	public static int login(String username, String password) {

		ArrayList<User> list =UserDao.QueryD();
		if (list.size() > 0) {
			for (User user : list) {
				if (user.getUsername().equals(username) && user.getPassword().equals(password)) {
					System.out.println("已检测");
					return 1;
				}else{
					return 0;
				}
			}
		}
		return -1;
	}
//	public static void main(String[] args) {
//		LoginService ls =new LoginService();
//		int result=ls.login("admin", "admin");
//		if(result ==1){
//			System.out.println("匹配成功");
//		}else{
//			System.out.println("失败");
//		}
//	}
}

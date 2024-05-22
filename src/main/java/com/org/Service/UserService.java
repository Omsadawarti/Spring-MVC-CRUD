package com.org.Service;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.org.Dao.UserDao;
import com.org.Model.Users;

@Service
public class UserService {

	@Autowired
	@Qualifier("userDao")
	UserDao userDao;
	
	@Transactional
	public void insert(Users users)
	{
		userDao.insertUser(users);
	}
	
	public Users getUser(int id) {
		Users users = userDao.getUser(id);
		return users;
	}
	
	public List<Users> getAllUsers()
	{
		List<Users> usersList = userDao.getAllUsers();
		
		return usersList;
	}
	
	
}

package com.org.Dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.org.Model.Users;



@Repository
public class UserDao {
	
	@Autowired
	@Qualifier("hibTemplate")
	HibernateTemplate hibernateTemplate;

	@Transactional
	public void insertUser(Users users)
	{
		hibernateTemplate.save(users);
	}
	
	public Users getUser(int id)
	{
		Users users = hibernateTemplate.get(Users.class , id) ;
		return users;
	}
	
	public  List<Users> getAllUsers()
	{
		List<Users> userList  = hibernateTemplate.loadAll(Users.class);
		return userList;
	}
	
	
}

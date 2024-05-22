package com.org.Dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.org.Model.Persons;
import com.org.Model.Users;

@Repository
public class PersonsDao {

	@Autowired
	@Qualifier("hibTemplate")
	HibernateTemplate hibernateTemplate;
	
	@Transactional
	public int insertPerson(Persons persons	)
	{
		int i = Integer.parseInt(hibernateTemplate.save(persons).toString());
		return i;
		
	}
	
	public Persons getPerson(int id)
	{
		Persons persons = hibernateTemplate.get(Persons.class, id);
		return persons;
	}
	
	public List<Persons> getAllPersons()
	{
		
		List<Persons> personsList = hibernateTemplate.loadAll(Persons.class);
	
		
		return personsList;
	}
	
	@Transactional
	public void updatePersons(Persons persons ) {
		 this.hibernateTemplate.update(persons);
		
	}
	
	@Transactional
	public int deltePersons(Persons persons)
	{
		
		try 
		{
			this.hibernateTemplate.delete(persons);
			return 1;
		} 
		catch (Exception e)
		{
			System.out.println(e);
			return 0; 
		}
	}
}

package com.org.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.org.Dao.PersonsDao;
import com.org.Model.Persons;

import net.bytebuddy.asm.Advice.This;

@Service
public class PersonService {
	
	@Autowired
	PersonsDao personsDao ;
	
	
	public int insert(Persons persons)
	{
		int i = personsDao.insertPerson(persons);
		
		return i;
	}
	
	public Persons getPerson(int id)
	{
		Persons persons  = personsDao.getPerson(id);
		return persons;
	}
	
	public List<Persons> getAllPersons()
	{
		List<Persons> personList = personsDao.getAllPersons();
		
		return personList;
	}
	
	public void updatePersons(Persons persons) {
		this.personsDao.updatePersons(persons);
	}
	
	public int deletePersons(Persons persons)
	{
		int result = this.personsDao.deltePersons(persons);
		return result;
	}

}

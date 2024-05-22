package com.org.Controller;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.org.Model.Persons;
import com.org.Service.PersonService;

@Controller
public class UpdateController {

	@Autowired
	PersonService personService;
	
	@Autowired
	HttpSession httpSession;
	
	int personId = 0 ;
	
	@ModelAttribute
	public void commonInformation(Model model)
	{
		model.addAttribute("personService",personService);
	}
	
	@RequestMapping(path="/update/{id}" )
	public String jumpOnToUpdatePage(@PathVariable("id") int id , Model model) {
		
		if(httpSession == null)
		{
			return "redirect:/login";
		}
		personId = id;
		System.out.println("Id is : "+id);
		model.addAttribute("id",id);
		return"update";
	}
	
	
	@RequestMapping(path = "/personupdate" , method = RequestMethod.POST)
	public String personUpdate(@RequestParam("name") String name , @RequestParam("age") int age , @RequestParam("phone") long phone, Model model) {
		System.out.println("Reached here");
		if(httpSession == null)
		{
			return "redirect:/login";
		}
		Persons persons = new Persons();
		persons.setAge(age);
		persons.setName(name);
		persons.setPhone(phone);
		persons.setId(personId);
		Integer aInteger = 1 ;
		persons.setStatus(1);
		personService.updatePersons(persons);
		model.addAttribute("updateMsg",aInteger);
		model.addAttribute("id",personId);
		return "update";
	}
	
	
}

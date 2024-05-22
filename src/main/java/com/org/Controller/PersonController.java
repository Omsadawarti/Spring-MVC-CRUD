package com.org.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.org.Model.Persons;
import com.org.Model.Users;
import com.org.Service.PersonService;

@Controller
//@RequestMapping(path = "/personpage")
public class PersonController {

	@Autowired
	PersonService personService;
	@Autowired
	HttpSession session;
	
	@ModelAttribute
	public void commonInformation(Model model)
	{
		model.addAttribute("personService",personService);
	}
	
	@RequestMapping("/persons")
	public String jumpToPersonPage(Model model)
	{
		if((Users) session.getAttribute("loginUser") == null)
	{
		
		
		return "redirect:/login";
	}
		else if(session==null)
		{
			return"redirect:/login";
		}
		return "person";
	}
	
	@RequestMapping("/personsubmit")
	public String personSubmitAction(@ModelAttribute("persons") Persons persons,BindingResult result , Model model)
	{
		if (result.hasErrors()) {
			Integer a = 1;
			model.addAttribute("invalidData",a );
			
			return "person";
		}
		System.out.println("persons object:"+persons);
		if(!(persons.getName().isEmpty() || persons.getAge() == 0 || persons.getPhone() == 0))
		{
			persons.setStatus(1);
			int i = personService.insert(persons);
			System.out.println("rows affected:"+i);
			if(i!=0)
			{
				Integer aInteger = 1;
				model.addAttribute("recordAdded",aInteger);
				persons = null;
				
				return "redirect:/persons";
			}
			else
			{
				return "person";
			}
		}
		else {
			return "person";
		}
		
	}
	
	@ExceptionHandler(value = Exception.class)
	public String handleException(Model model) {
		Integer aInteger = 1;
		model.addAttribute("exception",aInteger);
		return "index";
	}
	
}

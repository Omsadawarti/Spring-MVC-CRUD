package com.org.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mysql.cj.Session;
import com.org.Model.Persons;
import com.org.Service.PersonService;

@Controller
public class DeleteControlelr {
	
	

	@Autowired
	PersonService personService;
	private int deleteId = 0 ;
	
	@Autowired
	HttpSession httpSession;
	
	@ModelAttribute
	public void commonInformation(Model model	)
	{
		model.addAttribute("personService",personService);
	}
	
	@RequestMapping(path = "/delete/{id}")
	public String jumpOnToDeletePage(@PathVariable("id") int id ,Model model)
	{
		if (httpSession == null	 ) {
			return "redirect:/login";
		}
		deleteId = id ;
		model.addAttribute("id",id);
		return "delete";
	}
	
	@RequestMapping(path = "/deleteperson" , method = RequestMethod.POST)
	public String deletePerson(@ModelAttribute("persons") Persons persons  ,BindingResult result , Model model)
	{
		if(result.hasErrors())
		{
			Integer aInteger = 1;
			List list = result.getAllErrors();
			System.out.println(list);
			model.addAttribute("invalidData",aInteger);
			model.addAttribute("id",deleteId);
			return "delete";
		}
		persons.setStatus(1);
		persons.setId(deleteId);
		
		int delResult = personService.deletePersons(persons);
		System.out.println(delResult);
		if(delResult==1)
		{
			Integer a = 1;
			model.addAttribute("id",deleteId);
			model.addAttribute("deleteStatus" ,a);
			return "delete";
		}
		else 
		{
			model.addAttribute("status","record not  Deleted");
			return "delete";
		}
		
	}
}

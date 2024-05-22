package com.org.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.org.Model.Users;
import com.org.Service.UserService;

@Controller
public class ForgotPasswordController {
	
	String userEmail = "";
	int generatedOtp = 0 ;
	int enteredOtp  = 0 ;
	
	EmailSender emailSender = new EmailSender();
	
	Users users = null ;

	
	@Autowired
	UserService userService;
	
	@RequestMapping(path= "/forgotpassword" , method = RequestMethod.GET)
	public String jumpOnToForgotPassPage(Model model)
	{
		
		return "forgotPasswordPage";
	}
	
	@RequestMapping(path = "/forgotPasswordAction" , method = RequestMethod.GET)
	public String forgotPasswordAction(@RequestParam("email")String email, @RequestParam("otp") int enteredOtp ,   Model model)
	{
		
		if(enteredOtp != 0)
		{
			this.enteredOtp = enteredOtp;
			if(this.enteredOtp == this.generatedOtp)
			{
				String title = "Get your Password , Mr/Mis "+this.users.getUsername()+".";
				String message = "Dear User,  Your Email has been verified succesfully.\nAttached below is your password, you can now login through credentials given below:\nUser Email = "+this.users.getEmail()+"\nPassword = "+this.users.getPassword();
				
				System.out.println("Generated otp:"+generatedOtp);
				emailSender.send(userEmail, title, message);
				model.addAttribute("otpVerified","true");
				return "forgotPasswordPage";
			}
			else
			{
				
				return "index";
			}
		}
		else
		{
			System.out.println("Reacher dere");
			this.userEmail = email ;
			List<Users> userList = userService.getAllUsers();
			this.users = userList.stream().filter(p->p.getEmail().equals(email)).findAny().orElse(null);
			System.out.println(users);
			
			if(users != null)
			{
				generatedOtp = new OtpGenerater().generateOtp();
				String title = "Email Verification for "+users.getUsername()+".";
				String message = "Oops!! You forgot your password?? \nDont worry, we hold your back.....\nEnter the OTP given below and see the Magic!\nYour Requested OTP is: "+generatedOtp;
				
				System.out.println("Generated otp:"+generatedOtp);
				emailSender.send(userEmail, title, message);
				
				model.addAttribute("validEmail","true");
				model.addAttribute("email",email);
				return "forgotPasswordPage";
			}
			else {
				model.addAttribute("invalidEmail","true");
				
			}
		}
		return "forgotPasswordPage";
	}
}

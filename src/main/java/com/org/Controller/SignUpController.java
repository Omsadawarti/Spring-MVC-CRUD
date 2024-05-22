package com.org.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.org.Model.Users;
import com.org.Service.UserService;
import com.sun.mail.handlers.message_rfc822;

import net.bytebuddy.asm.Advice.This;

@Controller
public class SignUpController {

	
	@Autowired
	UserService userService;
	
	String username = "";
	String password = "";
	String confirmPassword = "";
	String userEmail = "";
	
	int enteredOtp = Integer.MAX_VALUE;
	int generatedOtp = 0 ;
	
	EmailSender emailSender = new EmailSender();
	@RequestMapping("/signup")
	public String jumpOnToSignUpPage(Model model)
	{
		
		try {
			boolean isOtpSent = (Boolean)model.getAttribute("otpSent");
			if (isOtpSent == true) {
				model.addAttribute("otpSent","true");
				model.addAttribute("username",username);
				model.addAttribute("email",userEmail);
				model.addAttribute("password",password);
				model.addAttribute("confirmPassword",confirmPassword);
				
				return "signup";
				
			}
		} catch (NullPointerException e) {
			// TODO: handle exception
		}
		
		return "signup";
	}
	
	@RequestMapping(path = "/signupAction" , method = RequestMethod.GET)
	public String signupAction(@RequestParam("email") String email , @RequestParam("username") String username  , @RequestParam("password") String password , @RequestParam("confirmPassword")String confirmPassword, @RequestParam("otp")int enteredOtp, Model model)
	{
		
		
		this.userEmail = email;
		this.username = username;
		this.confirmPassword = confirmPassword;
		this.password = password;
		
		
		if(!(email.isEmpty() || username.isEmpty() || password.isEmpty() || confirmPassword.isEmpty()))
		{
			List<Users>userList = userService.getAllUsers();
			Users existingUser = userList.stream().filter(p->p.getEmail().equals(email)).findAny().orElse(null);
			if(existingUser != null)
			{
				model.addAttribute("userExists","true");
				return "redirect:/signup";
			}
			System.out.println("Entered otp:"+enteredOtp);
			System.out.println("Generated otp:"+generatedOtp);
			model.addAttribute("otpSent","true");
			model.addAttribute("signupSetEnable","true") ;
			
			if(enteredOtp == 0  )
			{
				// write otp code here
				 generatedOtp = new OtpGenerater().generateOtp();
				String title = "welcome "+this.username+".";
				String message = "We are Glad to see you as a part of our vast and growing community.\n Below is your requestd OTP for the verification process. Verify and be a part of US....\nOTP:"+generatedOtp;
				System.out.println("Genereated opt in first phase: "+generatedOtp);
				
				emailSender.send(email, title, message);
				System.out.println("Email sent succesfully");
				
				model.addAttribute("otpSent","true");
				return "signup";
				
			}
			else
			{
				if(enteredOtp == generatedOtp)
				{
					model.addAttribute("signUpSuccess","true");
					Users users = new Users();
					users.setEmail(this.userEmail);
					users.setUsername(this.username);
					users.setPassword(this.password);
					users.setStatus(1);
					
					userService.insert(users);
					return"signup";
				}
				else {
					model.addAttribute("invalidOtp","true");
					return "signup";
				}
			}
			
			
		}
		else
		{
			model.addAttribute("invalidInfo","true");
			return "signup";
			
			
		}
		
		
		
		
		
		
		
		
	}
}

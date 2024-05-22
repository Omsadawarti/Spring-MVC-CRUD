package com.org.Controller;

import java.util.Random;

public class OtpGenerater {

	public int generateOtp()
	{
		// This method generate's a 4 digit otp
		Random random = new Random();
		int otp = random.nextInt(9000) + 1000;
		return otp ;
	}
}

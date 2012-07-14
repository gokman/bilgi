package com.util.constants;

import java.util.ArrayList;

public class ApplicationUtil {

	public static ArrayList<String> getHoursOfADay(){
		ArrayList<String> hoursOfDay = new ArrayList<String>();
		
		hoursOfDay.add(0, ApplicationConstants.HoursInADay.h0000);
		hoursOfDay.add(1, ApplicationConstants.HoursInADay.h0100);
		hoursOfDay.add(2, ApplicationConstants.HoursInADay.h0200);
		hoursOfDay.add(3, ApplicationConstants.HoursInADay.h0300);
		hoursOfDay.add(4, ApplicationConstants.HoursInADay.h0400);
		hoursOfDay.add(5, ApplicationConstants.HoursInADay.h0500);
		hoursOfDay.add(6, ApplicationConstants.HoursInADay.h0600);
		hoursOfDay.add(7, ApplicationConstants.HoursInADay.h0700);
		hoursOfDay.add(8, ApplicationConstants.HoursInADay.h0800);
		hoursOfDay.add(9, ApplicationConstants.HoursInADay.h0900);
		hoursOfDay.add(10, ApplicationConstants.HoursInADay.h1000);
		hoursOfDay.add(11, ApplicationConstants.HoursInADay.h1100);
		hoursOfDay.add(12, ApplicationConstants.HoursInADay.h1200);
		hoursOfDay.add(13, ApplicationConstants.HoursInADay.h1300);
		hoursOfDay.add(14, ApplicationConstants.HoursInADay.h1400);
		hoursOfDay.add(15, ApplicationConstants.HoursInADay.h1500);
		hoursOfDay.add(16, ApplicationConstants.HoursInADay.h1600);
		hoursOfDay.add(17, ApplicationConstants.HoursInADay.h1700);
		hoursOfDay.add(18, ApplicationConstants.HoursInADay.h1800);
		hoursOfDay.add(19, ApplicationConstants.HoursInADay.h1900);
		hoursOfDay.add(20, ApplicationConstants.HoursInADay.h2000);
		hoursOfDay.add(21, ApplicationConstants.HoursInADay.h2100);
		hoursOfDay.add(22, ApplicationConstants.HoursInADay.h2200);
		hoursOfDay.add(23, ApplicationConstants.HoursInADay.h2300);
		
		return hoursOfDay;
	}
}

package com.shuodao.hrms.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTimeUtil {

	private static final String MONTH_FORMAT = "yyyy-MM";
	private static final String DATE_FORMAT = "yyyy-MM-dd";
	private static final String DATETIME_FORMAT = "yyyy-MM-dd HH:mm";
	private static final String DATESEC_FORMAT = "yyyy-MM-dd HH:mm:ss";
	
	public static Date parseMonth(String dateStr) throws ParseException  {
		if (dateStr == null || dateStr.length() <= 0) return null;
		return new SimpleDateFormat(MONTH_FORMAT).parse(dateStr);
	}
	
	public static String formatMonth(Date date) {
		if (date == null) return null;
		return new SimpleDateFormat(MONTH_FORMAT).format(date);
	}
	
	public static Date parseDate(String dateStr) throws ParseException  {
		if (dateStr == null || dateStr.length() <= 0) return null;
		return new SimpleDateFormat(DATE_FORMAT).parse(dateStr);
	}
	
	public static String formatDate(Date date) {
		if (date == null) return null;
		return new SimpleDateFormat(DATE_FORMAT).format(date);
	}
	
	public static Date parseMinute(String timeStr) throws ParseException  {
		if (timeStr == null || timeStr.length() <= 0) return null;
		return new SimpleDateFormat(DATETIME_FORMAT).parse(timeStr);
	}
	
	public static String formatMinute(Date time) {
		if (time == null) return null;
		return new SimpleDateFormat(DATETIME_FORMAT).format(time);
	}
	
	public static Date parseSecond(String timeStr) throws ParseException  {
		if (timeStr == null || timeStr.length() <= 0) return null;
		return new SimpleDateFormat(DATESEC_FORMAT).parse(timeStr);
	}
	
	public static String formatSecond(Date time) {
		if (time == null) return null;
		return new SimpleDateFormat(DATESEC_FORMAT).format(time);
	}
}

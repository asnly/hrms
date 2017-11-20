package com.shuodao.hrms.util;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.common.io.ByteStreams;


public class HtmlUtil {

	private static Logger logger_ = LoggerFactory.getLogger(HtmlUtil.class);

	private final static int CONNECT_TIMEOUT = 5000; // in milliseconds
	private final static String DEFAULT_ENCODING = "UTF-8";

	public static String getUrlContent(String urlStr) {
		return getUrlContent(urlStr, CONNECT_TIMEOUT);
	}
	
	public static String getUrlContent(String urlStr, int readTimeOut) {
		BufferedReader reader = null;
		try {
			URL url = new URL(urlStr);
			URLConnection conn = url.openConnection();
			conn.setDoOutput(true);
			conn.setConnectTimeout(CONNECT_TIMEOUT);
			conn.setReadTimeout(readTimeOut);

			reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), DEFAULT_ENCODING));
			StringBuilder sb = new StringBuilder();
			String line = null;
			while ((line = reader.readLine()) != null) {
				sb.append(line);
				sb.append("\r\n");
			}
			return sb.toString();
		} catch (IOException e) {
			logger_.error("Error connecting to " + urlStr + ": " + e.getMessage());
		} finally {
			try {
				if (reader != null)
					reader.close();
			} catch (IOException e) {
			}
		}
		return null;
	}
	
	public static String postData(String urlStr, String data) {
		BufferedReader reader = null;
		try {
			URL url = new URL(urlStr);
			URLConnection conn = url.openConnection();
			conn.setDoOutput(true);
			conn.setConnectTimeout(CONNECT_TIMEOUT);
			conn.setReadTimeout(CONNECT_TIMEOUT);
			
			OutputStreamWriter writer = new OutputStreamWriter(conn.getOutputStream(), DEFAULT_ENCODING);  
	          
	        writer.write(data); 
	        writer.flush();
	        writer.close();  

			reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), DEFAULT_ENCODING));
			StringBuilder sb = new StringBuilder();
			String line = null;
			while ((line = reader.readLine()) != null) {
				sb.append(line);
				sb.append("\r\n");
			}
			return sb.toString();
		} catch (IOException e) {
			logger_.error("Error connecting to " + urlStr + ": " + e.getMessage());
		} finally {
			try {
				if (reader != null)
					reader.close();
			} catch (IOException e) {
			}
		}
		return null;
	}
	
	/**
	 * ���ͼƬurl����ȡͼƬ����
	 * 
	 * @param imgUrl
	 * @param readTimeOut ������Ӧʱ�䣬0Ϊ����
	 * @return
	 */
	public static byte[] getImageContent(String imgUrl, int readTimeOut) {
		BufferedInputStream bin = null;
		ByteArrayOutputStream bout = null;
		try {
			URL url = new URL(imgUrl);
			URLConnection conn = url.openConnection();
			conn.setDoOutput(true);
			conn.setConnectTimeout(CONNECT_TIMEOUT);
			conn.setReadTimeout(readTimeOut);

			InputStream in = conn.getInputStream();
			return ByteStreams.toByteArray(in);
		} catch (IOException e) {
			logger_.error("Error connecting to " + imgUrl + ": " + e.getMessage());
		} finally {
			try {
				if (bin != null)
					bin.close();
				if (bout != null)
					bout.close();
			} catch (IOException e) {
			}
		}
		return null;
	}
	
}

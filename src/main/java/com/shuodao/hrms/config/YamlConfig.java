package com.shuodao.hrms.config;
import java.io.File;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.ho.yaml.Yaml;

public class YamlConfig {
	private final static Log log=LogFactory.getLog(YamlConfig.class);
	public static class ConfigEntry{
		public String jdbc_url;
		public String jdbc_user;
		public String jdbc_password;
		
		public String admin_user;
		public String admin_password;
		public String domain_url;
		
		public String manager_user;
		public String manager_password;
	}
	private static YamlConfig instance=new YamlConfig();
	private ConfigEntry configEntry;
	private String webappRoot;
	private String contextPath="/";
	private YamlConfig(){
		webappRoot=System.getProperty("hrms.root");
		try {
			configEntry = Yaml.loadType(new File(webappRoot, "WEB-INF/config.yml"), ConfigEntry.class);
		} catch (Exception e) {
			System.out.println(configEntry);
			log.error("Load config.yml error.", e);
		}
		if (configEntry == null || configEntry.domain_url == null) {
			log.error("Can not find domain_url in config.yml, server start failed.");
			throw new RuntimeException("Error in config.yml.");
		}
		
		if (configEntry.domain_url != null && !configEntry.domain_url.startsWith("http")) {
			configEntry.domain_url = "http://" + configEntry.domain_url;
		}
		if (configEntry.domain_url.endsWith("/")) {
			configEntry.domain_url = configEntry.domain_url.substring(0, configEntry.domain_url.length() - 1);
		}
		
	}
	
	public static YamlConfig getInstance() {
		return instance;
	}
	
	public ConfigEntry getConfigEntry() {
		return configEntry;
	}
	
	public void setContextPath(String path) {
		contextPath = path;
	}
	
	public String getContextUrl() {
		return configEntry.domain_url + contextPath + "/";
	}
	
	public String getDomainUrl() {
		return configEntry.domain_url;
	}
	
	public String getWebappRoot() {
		return webappRoot;
	}
}

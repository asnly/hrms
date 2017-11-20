package com.shuodao.hrms.config;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ContextRootListener implements ServletContextListener{

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		YamlConfig.getInstance().setContextPath(sce.getServletContext().getContextPath());
	}

}

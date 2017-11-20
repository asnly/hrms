package com.shuodao.hrms.util;

import java.io.File;
import java.io.IOException;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.shuodao.hrms.config.YamlConfig;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class TemplateUtil {
	
	private static Logger log = LoggerFactory.getLogger(TemplateUtil.class);

	public static String applyTemplate(String templatePath, Map<String, Object> propMap) throws IOException {
		Configuration config = new Configuration();
		File dir = new File(YamlConfig.getInstance().getWebappRoot(), "WEB-INF/templates");
		config.setDirectoryForTemplateLoading(dir);
		Template template = config.getTemplate(templatePath, "UTF-8");
		StringWriter writer = new StringWriter();
		
		try {
			template.process(propMap, writer);
		} catch (TemplateException e) {
			log.warn("Error while process template: " + templatePath, e);
		}
		
		return writer.toString();
	}
	
	public static String applyTemplateSimple(String templatePath, Object ... values) {
		Map<String, Object> propMap = new HashMap<String, Object>();
		propMap.put("contextUrl", YamlConfig.getInstance().getContextUrl());
		for (int i = 0; i < values.length; i++) {
			propMap.put("param" + i, values[i]);
		}
		try {
			return applyTemplate(templatePath, propMap);
		} catch (IOException e) {
			log.warn("Error while process template: " + templatePath, e);
		}
		return null;
	}
}

package com.Unicon.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/pages/*")
public class TestController {
	
	private static final Logger logger = LoggerFactory.getLogger(TestController.class);
	
	/**D
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/{juso}", method = RequestMethod.GET)
	public String connect(@PathVariable("juso") String juso) {
		logger.info("( •̀ ω •́ )✧ connect(@PathVariable(\"juso\") String juso) 호출 ");
		logger.info("( •̀ ω •́ )✧ juso : {}",juso);
		return "/pages/"+juso;
	}
	
	@RequestMapping(value = "/{juso}/{jusoTwo}", method = RequestMethod.GET)
	public String connectTwo(@PathVariable("juso") String juso, @PathVariable("jusoTwo") String jusoTwo) {
		logger.info("( •̀ ω •́ )✧ connectTwo(@PathVariable(\"juso\") String juso, @PathVariable(\"jusoTwo\") String jusoTwo) 호출 ");
		logger.info("( •̀ ω •́ )✧ jusoTwo : {}",jusoTwo);
		return "/pages/"+juso+"/"+jusoTwo;
	}
	
}

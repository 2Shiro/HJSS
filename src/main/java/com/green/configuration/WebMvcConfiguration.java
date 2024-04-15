package com.green.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.green.interceptor.LoginCheckInterceptor;

@Configuration
public class WebMvcConfiguration implements WebMvcConfigurer {

	   @Override
	   public void addInterceptors(InterceptorRegistry registry) {
	      registry.addInterceptor(new LoginCheckInterceptor())
	              .addPathPatterns("/**","/**/*")
	              .excludePathPatterns("/loginForm","/login",
	                                 "/Person/JoinForm","/Person/Join",
	                                 "/Company/loginForm","/Company/login",
	                                 "/Company/JoinForm","/Company/Join",
	                                 "/logout","/ViewPost","/",
	                                 "/CheckId?id=","/CheckId",
	                                 "/log*","/css/**", "/images/**", "/js/**",
	                                 "/Search", "/Person/Search", "Company/Search");
	   }
	
}

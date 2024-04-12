package com.green.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.green.interceptor.LoginCheckInterceptor;

@Configuration
public class WebMvcConfiguration implements WebMvcConfigurer {

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new LoginCheckInterceptor()).addPathPatterns("/**").addPathPatterns("/**/*").excludePathPatterns("/Person/LoginForm").excludePathPatterns("/Person/Login")
		.excludePathPatterns("/Company/LoginForm").excludePathPatterns("/Company/Login").excludePathPatterns("/logout").excludePathPatterns("/ViewPost").excludePathPatterns("/").excludePathPatterns("/Company/IdDupCheck")
		.excludePathPatterns("/Company/IdCheck")
		.excludePathPatterns("/Company/Login").excludePathPatterns("/Company/LoginForm").excludePathPatterns("/Company/JoinForm").excludePathPatterns("/Company/Join").excludePathPatterns("/log*","/css/**", "/images/**", "/js/**");

	}	
	
}

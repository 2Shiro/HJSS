package com.green.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.green.interceptor.LoginCheckInterceptor;

@Configuration
public class WebMvcConfiguration implements WebMvcConfigurer {

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new LoginCheckInterceptor()).addPathPatterns("/**").addPathPatterns("/**/*").excludePathPatterns("/loginForm")
				.excludePathPatterns("/Company/loginForm").excludePathPatterns("/logout").excludePathPatterns("/").excludePathPatterns("/login").excludePathPatterns("/ViewPost").excludePathPatterns("/Company/login")
				.excludePathPatterns("/Company/JoinForm").excludePathPatterns("/Person/JoinForm").excludePathPatterns("/log*","/css/**", "/images/**", "/js/**");;

	}	
	
}

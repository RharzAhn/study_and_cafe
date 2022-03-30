package com.one.springpj.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Bean
	public BCryptPasswordEncoder encodePwd() {
		return new BCryptPasswordEncoder(); //패스워드 암호화
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception{
		  http
	        .cors().disable()		//cors방지
	        .csrf().disable()		//csrf방지
	        .formLogin().disable()	//기본 로그인 페이지 없애기
	        .headers().frameOptions().disable();	
		/*
		 * http.csrf().disable(); http.authorizeRequests()
		 * .antMatchers("/user/user/**").authenticated()
		 * .antMatchers("/user/manager/**").hasRole("USER") .anyRequest().permitAll()
		 * .and() .formLogin() .loginPage("/user/login") //로그인
		 * .loginProcessingUrl("/loginProc") //로그인 처리 .defaultSuccessUrl("/");
		 */

	}
}
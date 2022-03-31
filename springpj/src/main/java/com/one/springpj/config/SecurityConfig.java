package com.one.springpj.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.one.springpj.service.UserService;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Bean
	public BCryptPasswordEncoder encodePwd() {
		return new BCryptPasswordEncoder(); //패스워드 암호화
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception{
		  
		 http.csrf().disable(); 
		 http.authorizeRequests()
		  .antMatchers("/user/user/**").authenticated()
		  .antMatchers("/user/manager/**").hasRole("USER") 
		  .anyRequest().permitAll()
	.and() 
		 .formLogin() 
		 .loginPage("/user/login") //로그인
		 .loginProcessingUrl("/loginProc") //로그인 처리 
		 .defaultSuccessUrl("/")
	.and()
		.logout()//로그아웃
		.logoutUrl("/logout")
		.logoutSuccessUrl("/login");
	//	.logoutSuccessUrl("/")//로그아웃 성공시 리다이렉트 주소
	//	.invalidateHttpSession(true);//로그아웃 이후 세션 전체 삭제 여부
		 

	}
	@Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
         auth.userDetailsService(userDetailsService());
    }
}
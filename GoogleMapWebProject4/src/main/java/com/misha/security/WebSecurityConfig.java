package com.misha.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;

import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;


import com.misha.service.UserDetailsServiceImpl;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig {
  
	@Bean
	public UserDetailsService userDetailsService() {
		return new UserDetailsServiceImpl();
	}

	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		http.authorizeRequests()
			.antMatchers("/","/home/**","/register/**","/saveDogSitter/**","/search/**", "/searchsitter/**","/images/**").permitAll()
			.and()
			.authorizeRequests()
			.antMatchers("/admin/sitterlist/**").hasAuthority("ADMIN")
			.antMatchers("/profile/**").hasAnyAuthority("ADMIN","USER")
			.anyRequest()
			.authenticated()
			.and()
			.formLogin().permitAll()
			.and()
			.logout().permitAll()
			.logoutUrl("/logout")
			.logoutSuccessUrl("/login")
			.invalidateHttpSession(true)
			.and()
			.exceptionHandling().accessDeniedPage("/403");
		
		http.csrf().disable();
		
		return http.build();
	}
	
	
	  @Bean 
	  public BCryptPasswordEncoder passwordEncoder() { 
		  return new  BCryptPasswordEncoder(); 
		  }
	 
	  @Bean 
	  public DaoAuthenticationProvider authenticationProvider() {
	  DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
	  authProvider.setPasswordEncoder(passwordEncoder());
	  authProvider.setUserDetailsService(userDetailsService()); 
	  return authProvider; 
	  }
	
}

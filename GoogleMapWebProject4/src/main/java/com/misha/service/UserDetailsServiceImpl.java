package com.misha.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.misha.model.SitterRegistration;
import com.misha.repository.SitterRepository;


public class UserDetailsServiceImpl implements UserDetailsService {
	
	@Autowired
	private SitterRepository sitterRepository;
	
	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		SitterRegistration user = sitterRepository.getUserByEmail(email);
		
		if(user == null) {
			throw new UsernameNotFoundException("Could not find user");
		}
		return new MyUserDetails(user);
	}

}

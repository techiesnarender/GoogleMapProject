package com.misha.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.misha.model.User;
import com.misha.repository.UserRepository;

@Service
@Transactional
public class UserService {

		@Autowired
		private final UserRepository userRepository;

		public UserService(UserRepository userRepository) {
			super();
			this.userRepository = userRepository;
		}
		
		public List<User> getAllUser() {
			return  (List<User>) userRepository.findAll();
		}
		
		public User saveUser(User user) {
			return userRepository.save(user);
		}
		
		public Optional<User> getUser(Integer id) {
			return userRepository.findById(id);
		}
		
		public void deleteUser(Integer id) {
			if (getUser(id).isPresent()) {
				userRepository.delete(getUser(id).get());
			}
		}
}
		
		

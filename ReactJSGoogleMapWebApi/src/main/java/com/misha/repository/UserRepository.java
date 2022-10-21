package com.misha.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.misha.model.User;

@Repository
public interface UserRepository extends CrudRepository<User, Integer> {
		
	
}

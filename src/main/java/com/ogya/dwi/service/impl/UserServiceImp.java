package com.ogya.dwi.service.impl;

import java.util.Arrays;
import java.util.HashSet;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.ogya.dwi.domain.Role;
import com.ogya.dwi.repository.RoleRespository;
import com.ogya.dwi.domain.User;
import com.ogya.dwi.repository.UserRepository;
import com.ogya.dwi.service.UserService;

@Service
public class UserServiceImp implements UserService{
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RoleRespository roleRespository;
	 
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	 
	@Override
	public User findUserByEmail(String email) {
		return userRepository.findByEmail(email);
	}

	@Override
	public void saveUser(@Valid User user) {
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		  Role userRole = roleRespository.findByRole("SUPERUSER");
		  user.setRoles(new HashSet<Role>(Arrays.asList(userRole)));
		  userRepository.save(user);
	}

}

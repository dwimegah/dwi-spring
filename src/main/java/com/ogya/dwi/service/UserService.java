package com.ogya.dwi.service;

import javax.validation.Valid;

import com.ogya.dwi.domain.User;

public interface UserService {
	public User findUserByEmail(String email);
	public void saveUser(@Valid User user);
}

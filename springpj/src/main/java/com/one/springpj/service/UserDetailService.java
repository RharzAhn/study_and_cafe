package com.one.springpj.service;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserDetailService extends UserDetailsService {
    Collection<GrantedAuthority> getAuthorities(String username);

}

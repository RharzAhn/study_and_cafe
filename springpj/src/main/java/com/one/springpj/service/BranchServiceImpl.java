package com.one.springpj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.springpj.model.Branch;
import com.one.springpj.model.User;
import com.one.springpj.repository.BranchRepository;

@Service
public class BranchServiceImpl implements BranchService{
	
	@Autowired
	private BranchRepository branchRepository;
	
	

//	@Transactional
	@Override
	public void insert(Branch branch) {
		// TODO Auto-generated method stub
		branchRepository.save(branch);
		
	}
	@Override
	public List<Branch> branchList(){
		return branchRepository.findAll();
	}
//	@Transactional
	@Override
	public void delete(Long id) {
		// TODO Auto-generated method stub
		branchRepository.deleteById(id);
		
	}
	
	@Override
	public Branch findById(Long id) {
		Branch branch = branchRepository.findById(id).get();
		return branch;
	}
	
	@Override
	public void update(Branch branch) {
		Branch b = branchRepository.findById(branch.getId()).get();
		b.setProfile(branch.getProfile());
		b.setName(branch.getName());
		b.setAddr(branch.getAddr());
		b.setPhone(branch.getPhone());
		b.setManager(branch.getManager());
		branchRepository.save(b);
	}
	@Override
	public Branch findByManager(User user) {
		return branchRepository.findByManager(user);
	}
	

}

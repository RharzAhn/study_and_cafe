package com.one.springpj.service;

import java.util.List;

import com.one.springpj.model.Branch;
import com.one.springpj.model.CafeMenu;
import com.one.springpj.model.Seat;

public interface BranchService {
	
	public void insert(Branch branch);

	public List<Branch> branchList();

	public void delete(Long id);

	public Branch findById(Long id);

	void update(Branch branch);
	
	public Long countIdMax();
	public Long count();
	
	public void insertSeat(Seat seat);
	
	
	public List<Seat> findByBranchId(Long id);
	public List<CafeMenu> cafeMenufindByBranchId(Branch id); 
}

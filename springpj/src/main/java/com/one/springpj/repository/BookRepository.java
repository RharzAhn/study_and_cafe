package com.one.springpj.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.one.springpj.model.Book;
import com.one.springpj.model.Branch;

public interface BookRepository extends JpaRepository<Book, Long>{
	
	public List<Book> findByBookDateBetweenAndBranch(Date startdate, Date enddate,Branch branch);
}

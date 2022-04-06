package com.one.springpj.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.one.springpj.constant.JoinStatus;
import com.one.springpj.model.Study;

public interface StudyRepository extends JpaRepository<Study, Long>{

}

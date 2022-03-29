package com.one.springpj.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Entity
@Data
public class Reply {
	@Id
	@GeneratedValue
	@Column(name="reply_id")
	private Long id;
	
	@ManyToOne
	@JoinColumn(name = "replyer_id")
	private User replyer;
	
	private String content;
	
	@ManyToOne
	@JoinColumn(name="board_id")
	private Board board;
	
	@DateTimeFormat(pattern="yy.MM.dd")
	@CreationTimestamp
	private Date regdate;
}

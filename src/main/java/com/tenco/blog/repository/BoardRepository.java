package com.tenco.blog.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tenco.blog.entity.Board;

@Mapper
public interface BoardRepository {
	
	public int insert(Board board);
	public int updateById(Board board);
	public int deleteById(Integer id);
	public Board findById(Integer id);
	public List<Board> findAll();
}

package com.tenco.blog.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tenco.blog.dto.BoardDto;
import com.tenco.blog.entity.Board;
import com.tenco.blog.handler.exception.BoardException;
import com.tenco.blog.repository.BoardRepository;

@Service
public class BoardService {
	
	@Autowired
	BoardRepository boardRepository;
	
	@Transactional
	public void createBoard(BoardDto dto) {
		
		Board board = Board.builder()
				.author(dto.getAuthor())
				.title(dto.getTitle())
				.content(dto.getContent())
				.build();
		
		int result = boardRepository.insert(board);
		if (result != 1) {
			throw new BoardException("작못된 게시글입니다", HttpStatus.BAD_REQUEST);
		}
	}
	
	public List<Board> readBoard() {
		return boardRepository.findAll();
	}
	
	public Board getBoardById(Integer id) {
		Board boardOptional = boardRepository.findById(id);
		return boardOptional;
	}
	
	@Transactional
	public void deleteBoard(Integer id) {
		boardRepository.deleteById(id);
	}
	
	@Transactional
	public void updateBoard(Integer id, BoardDto dto) {
		Board board = Board.builder()
				.id(id)
				.author(dto.getAuthor())
				.title(dto.getTitle())
				.content(dto.getContent())
				.build();
		boardRepository.updateById(board);
	}
}

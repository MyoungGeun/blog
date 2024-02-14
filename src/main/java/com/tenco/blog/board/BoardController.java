package com.tenco.blog.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tenco.blog.dto.BoardDto;
import com.tenco.blog.entity.Board;
import com.tenco.blog.handler.exception.BoardException;
import com.tenco.blog.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	
	
    @GetMapping("/save")
    public String saveForm() {
        return "board/saveForm";
    }

    @GetMapping("/list")
    public String listForm(Model model) {
    	List<Board> board = boardService.readBoard();
    	model.addAttribute("board", board);
    	
    	
        return "board/list";
    }

    @GetMapping("/update/{id}")
    public String updateForm(@PathVariable Integer id, Model model) {
        
    	Board board = boardService.getBoardById(id);
        BoardDto boardDto = new BoardDto();
        boardDto.setAuthor(board.getAuthor());
        boardDto.setTitle(board.getTitle());
        boardDto.setContent(board.getContent());
        
        model.addAttribute("board", board);
        return "board/update";
    }

    @PostMapping("/save")
    public String save(BoardDto dto){
    	
    	
    	if (dto.getAuthor() == null || dto.getAuthor().isEmpty()) {
			throw new BoardException("작성자를 입력하세요", HttpStatus.BAD_REQUEST);
		}
    	
    	boardService.createBoard(dto);

    	return "redirect:/board/list";
    }
    

    @PostMapping("/update/{id}")
    public String update(@PathVariable Integer id, BoardDto dto){
    	
    	boardService.updateBoard(id, dto);
    	
        return "redirect:/board/list";
    }

    @PostMapping("/delete/{id}")
    public String delete(@PathVariable Integer id) {
    	
    	boardService.deleteBoard(id);
        return "redirect:/board/list";
    }
}

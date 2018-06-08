package com.spring.web.controller;


import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.spring.web.board.service.BoardService;
import com.spring.web.domain.BoardVo;
import com.spring.web.domain.Search;
import com.spring.web.factory.ContextFactory;

@SessionAttributes("path,user")
@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired ContextFactory context;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	//6/4
	//private SqlSession sqlSession;
	@Inject
	private BoardService service;
	
	@RequestMapping(value="/list")
	public ModelAndView boardList(@ModelAttribute("search") Search search) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		System.out.println("search"+search);
		
		service.boardList(search);
		mv.addObject("list", service.boardList(search));
		mv.setViewName("board/list");
		return mv;
	}
	//게시글 등록
	@RequestMapping(value="/register", method = RequestMethod.GET)
	public ModelAndView boardRegister(BoardVo vo) throws Exception{
		System.out.println("들어가는곳");
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/register");
		return mv;
	}
	
	@RequestMapping(value="/register", method = RequestMethod.POST)
	public String boardRegister2(BoardVo vo) throws Exception{
		
		System.out.print(vo);
		System.out.println("등록 나오는곳");
		
		ModelAndView mv = new ModelAndView();
		service.boardRegist(vo);
		
		return "redirect:/board/list";
	}
	//게시글 삭제
	@RequestMapping(value="/delete", method = RequestMethod.GET)
	public String delete(HttpServletRequest request) throws Exception{
		
		String[] bno = request.getParameter("bno").toString().split(",");
		System.out.println("bno"+bno);
		
		for(int i =0; i<bno.length; i++) {
			service.boardDelete(Integer.parseInt(bno[i]));
			System.out.println(Integer.parseInt(bno[i])+" 삭제완료");
		}
		
		return "redirect:/board/list";
	}
	
	//게시글 확인
	@RequestMapping(value="/view", method=RequestMethod.GET)
	public ModelAndView boardView(BoardVo vo) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.print(vo);
		
		mv.addObject("view", service.boardView(vo));
		mv.setViewName("board/view");
		
		return mv;
	}
	
	@RequestMapping(value = "/listAjax.do")
	public @ResponseBody Map<String, Object> getJsonByMap(BoardVo vo) throws Exception {
		Map<String, Object> jsonObject = new HashMap<String, Object>();

		jsonObject = new HashMap<String, Object>();
		jsonObject.put("list", service.boardList2(vo));

		return jsonObject;

	}

	@RequestMapping(value = "/listAjax")
	public ModelAndView boardListAjax(BoardVo vo) throws Exception {

		ModelAndView mv = new ModelAndView();

		System.out.print("������ �ֳ�" + service.boardList2(vo));
		mv.setViewName("board/listAjax");// Ÿ���� view => �Ϲ� view
		return mv;
	}

	
	@RequestMapping(value="/main",method=RequestMethod.GET)
	public String joinForm(Model model) {
		System.out.println("게시글 컨트롤러 방문");
		model.addAttribute("path", context.ptx());
		return "board/main";
		
	}
	
	
	
	
}

package com.spring.web.controller;

import java.sql.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.spring.web.domain.JoinVo;
import com.spring.web.factory.ContextFactory;
import com.spring.web.join.service.JoinService;

import net.sf.json.util.WebUtils;

@SessionAttributes("path,user")
@Controller
public class LoginController {
	@Autowired ContextFactory context;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value="/main",method=RequestMethod.GET)
	public String loginForm(Model model) {
		
		System.out.println("메인으로");
		model.addAttribute("path", context.ptx());
		return "intro.tiles";
		
	}
	
	//회원가입 페이지
	@RequestMapping(value="/join",method=RequestMethod.GET)
	public String joinForm(Model model) {
		System.out.println("조인 컨트롤러 방문");
		model.addAttribute("path", context.ptx());
		return "user/join";
		
	}
	
	@Inject
	private JoinService service;
	
	//로그인폼 페이지
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login(Model model) {
		System.out.println("로그인단 이동");
		model.addAttribute("path", context.ptx());
		return "user/login";
		
	}
	
	//로그인 처리하는 부분
	@RequestMapping(value="/loginProcess", method=RequestMethod.POST)
	public String loginProcess(HttpSession session, JoinVo dto, HttpServletRequest response) {
		System.out.println("1로그인");
		System.out.println("아이디값"+dto);
		String returnURL="";
		if(session.getAttribute("login")!=null) {	//기존 login이란 세션 값이 존재한다면 
			session.removeAttribute("login");	//기존값 제거
		}
		//로그인이 성공하면 joinVo 객체를 반환함
		JoinVo vo = service.login(dto);
		
		if(vo!=null) {	//로그인 성공
			session.setAttribute("login", vo);//세션에 login이란 이름으로 userVo객체를 저장해놈.
			returnURL = "redirect:/board/list";	//로그인 성공시 게시글 목록페이지 바로 이동
			System.out.println("2로그인성공");
		/*//세션추가되는 부분
			// 1. 로그인이 성공하면, 그 다음으로 로그인 폼에서 쿠키가 체크된 상태로 로그인 요청이 왔는지를 확인한다.
            if ( dto.isUseCookie() ){ // dto 클래스 안에 useCookie 항목에 폼에서 넘어온 쿠키사용 여부(true/false)가 들어있을 것임
                // 쿠키 사용한다는게 체크되어 있으면...
                // 쿠키를 생성하고 현재 로그인되어 있을 때 생성되었던 세션의 id를 쿠키에 저장한다.
                Cookie cookie = new Cookie("loginCookie", session.getId());
                // 쿠키를 찾을 경로를 컨텍스트 경로로 변경해 주고...
                cookie.setPath("/");
                cookie.setMaxAge(60*60*24*7); // 단위는 (초)임으로 7일정도로 유효시간을 설정해 준다.
                // 쿠키를 적용해 준다.
                response.addCookie(cookie);
            }*/
		}else {	//로그인에 실패한 경우
			returnURL = "redirect:/login";	//다시 로그인 폼으로
			System.out.println("3로그인실패");
		}
		return returnURL;
	}
	
	/*@RequestMapping(value="/logout")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		Object obj = session.getAttribute("login");
		if(obj!=null) {
			JoinVo vo =(JoinVo)obj;
			//null이 아닐 경우 제거
			session.invalidate();	//세션 전체 날리기
			//session.removeAttribute("login");	//하나씩 로그아웃
			
			Cookie loginCookie = WebUtils.getCookie(request,"loginCookie");
			if ( loginCookie != null ){
                // null이 아니면 존재하면!
                loginCookie.setPath("/");
                // 쿠키는 없앨 때 유효시간을 0으로 설정하는 것 !!! invalidate같은거 없음.
                loginCookie.setMaxAge(0);
                // 쿠키 설정을 적용한다.
                response.addCookie(loginCookie);
                 
                // 사용자 테이블에서도 유효기간을 현재시간으로 다시 세팅해줘야함.
                Date date = new Date(System.currentTimeMillis());
                service.keepLogin(vo.getUserId(), session.getId(), date);
            }
		}
		return "redirect:/board/list";
	}*/
	
	//회원가입
	/*@RequestMapping(value="/user/join", method = RequestMethod.GET)
	public ModelAndView joinRegister(JoinVo vo) throws Exception{
		System.out.println("가입들어가는곳");
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/user/join");
		return mv;
	}*/
	
	
	//회원가입 정보 등록
	@RequestMapping(value="/joinGo", method = RequestMethod.POST)
	public ModelAndView joinRegister2(JoinVo vo, Model model) throws Exception{
		
		System.out.print("입력된값"+vo);
		
		ModelAndView mv = new ModelAndView();
		service.JoinRegist(vo);
		
		/*model.addAttribute("userId", vo.getUserId());
		model.addAttribute("userPW", vo.getUserPw());
		model.addAttribute("userName", vo.getUserName());
		model.addAttribute("userEmail", vo.getUserEmail());
		model.addAttribute("userPhoneNum", vo.getUserPhoneNum());*/
		
		mv.setViewName("user/joinview");
		System.out.println("가입완료.나오는곳");
		System.out.println("mv주소: "+mv);
		System.out.println("가입아이디"+vo.getUserId());
		//return "user/joinview?userID="+vo.getUserId();
		
		
		return mv;
	}
	
	//회원가입 완료 후 뷰페이지
	@RequestMapping(value="/user/joinview", method=RequestMethod.GET)
	public ModelAndView joinView(JoinVo vo , Model model ) throws Exception{
		System.out.println("가입정보 뷰");
		ModelAndView mv = new ModelAndView();
		
		
		System.out.println(vo);
		
		mv.addObject("view", service.joinView(vo));
		
		mv.setViewName("user/joinview");
		System.out.println(mv.getViewName());

		System.out.println("view페이지 mv :"+mv);
		System.out.println("view페이지vo :"+vo);
		System.out.println("아이디값"+vo.getUserId());
		return mv;
		//return "redirect:/user/joinview?userId="+vo.getUserId();
	}
}

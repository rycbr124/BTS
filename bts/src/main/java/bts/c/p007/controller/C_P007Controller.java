package bts.c.p007.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import bts.e.p001.VO.PagingVO;
import bts.e.p001.VO.PagingVO2;

public interface C_P007Controller {
	public ModelAndView myAccList(PagingVO pagingVO,PagingVO2 pagingVO2,String nowPage,String nowPage2, String cntPerPage,String cntPerPage2, HttpServletRequest request, HttpServletResponse response) throws Exception;
}

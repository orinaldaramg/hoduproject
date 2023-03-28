package com.woori.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.woori.dao.UserJoinDAOImpl;
import com.woori.domain.userVO;

@Service
public class UserJoinServiceImpl implements UserJoinService {

	@Inject
	UserJoinDAOImpl userJoin;
	
	@Override
	public void insertUser(userVO vo) {
		userJoin.insertUser(vo);
	}
	@Override
	public userVO viewProfile(String userId) {
		return userJoin.viewProfile(userId);
	}
	@Override
	public void editProfile(userVO vo) {
		userJoin.editProfile(vo);
	}
	
	// 아이디 중복체크
	@Override
	public int idCheck(userVO vo) {
		int result = userJoin.idCheck(vo);
		return result;
	}
	
	@Override
	public void deleteProfile(String userId, HttpSession session) {
		userJoin.deleteProfile(userId);
		session.invalidate();
	}

}
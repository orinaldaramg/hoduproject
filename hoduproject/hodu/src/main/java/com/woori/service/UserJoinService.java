package com.woori.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.woori.domain.Criteria;
import com.woori.domain.QnaVO;
import com.woori.domain.ReservationVO;
import com.woori.domain.ReviewVO;
import com.woori.domain.UserVO;

public interface UserJoinService {
	
	//로그인
	public UserVO logincheck(UserVO vo, HttpSession session);
	public void logout(HttpSession session);
	
	public void insertUser(UserVO vo);
	public UserVO viewProfile(String userId);
	public void editProfile(UserVO vo);
	
	// 아이디 중복체크
	public int idCheck(UserVO vo);
	public void deleteProfile(String userId, HttpSession session);
	
	//Q 리스트 출력
	public List<QnaVO> QList(Criteria cri);
	public int getTotal(Criteria cri);
	
	//Q 비밀번호
	public QnaVO Q_pwCheck(QnaVO qvo, HttpSession qsession); 
	//Q 글쓰기
	public void Q_insert(QnaVO qvo);
	//Q 확인
	public QnaVO QView(int Q_idx, HttpSession session);
	
	//리뷰 작성
	public void ReviewInswer(ReviewVO rvo);
	//R 리스트 출력
	public List<ReviewVO> ReviewList(ReviewVO rvo);
	
	//나의 예약 목록 출력
	public List<ReservationVO> ReservationList(ReservationVO rvo);
	public ReservationVO UserRView(int reservation_idx);
	public void UserRUpdate(ReservationVO rvo);
	public void DeleteReservation(int reservation_idx);
}
